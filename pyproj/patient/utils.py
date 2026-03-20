import os
from dotenv import load_dotenv
load_dotenv()

from pypdf import PdfReader
import pytesseract
from PIL import Image
from pdf2image import convert_from_path
import re

# 🔹 Tesseract path
pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"


# 🔹 NORMAL RANGES
NORMAL_RANGES = {
    "hemoglobin": {
        "male": (13, 18),
        "female": (12, 16),
        "child": (11, 14)
    },
    "wbc": {"default": (4000, 11000)},
    "rbc": {
        "male": (4.5, 5.9),
        "female": (4.1, 5.1),
        "child": (4.0, 5.2)
    },
    "platelet": {"default": (1.5, 4.0)},
    "creatinine": {
        "male": (0.6, 1.2),
        "female": (0.5, 1.1)
    },
    "pcv": {
        "male": (42, 50),
        "female": (37, 47)
    }
}


# 🔹 SYNONYMS
SYNONYMS = {
    "hemoglobin": ["hemoglobin", "haemoglobin", "hb"],
    "wbc": ["wbc", "white blood cells", "leukocytes", "wbc count"],
    "rbc": ["rbc", "red blood cells", "erythrocytes", "rbc count"],
    "platelet": ["platelet", "platelet count", "thrombocytes"],
    "creatinine": ["creatinine", "serum creatinine"],
    "pcv": ["pcv", "packed cell volume", "hematocrit"]
}


# 🔹 PDF TEXT
def extract_pdf_text(path):
    reader = PdfReader(path)
    text = ""
    for page in reader.pages:
        t = page.extract_text()
        if t:
            text += t
    return text


# 🔹 OCR PDF (fallback)
def extract_pdf_ocr(path):
    images = convert_from_path(
        path,
        poppler_path=r"C:\poppler-25.12.0\Library\bin"
    )
    text = ""
    for img in images:
        text += pytesseract.image_to_string(img)
    return text


# 🔹 IMAGE OCR
def extract_image_text(path):
    img = Image.open(path)
    return pytesseract.image_to_string(img)


# 🔹 CLEAN TEXT
def clean_text(text):
    return text.lower().replace("\n", " ")


# 🔹 REGEX BUILDER
def build_pattern(words):
    return r"(" + "|".join(words) + r")[^\d]{0,25}(\d+\.?\d*)"


# 🔹 VALUE EXTRACTION
def extract_values(text):
    data = {}

    for key, words in SYNONYMS.items():
        match = re.search(build_pattern(words), text)
        if match:
            try:
                data[key] = float(match.group(2))
            except:
                pass

    # 🔥 Platelet scaling fix
    if "platelet" in data:
        val = data["platelet"]
        if val > 1000000:
            data["platelet"] = val / 1000000
        elif val > 100000:
            data["platelet"] = val / 100000

    # 🔥 Creatinine fix
    if "creatinine" in data and data["creatinine"] > 10:
        data["creatinine"] /= 10

    return data


# 🔹 NAME EXTRACTION
def extract_patient_name(text):
    text_lower = text.lower()

    patterns = [
        r"name\s*.*?:\s*([a-zA-Z\s\.]+)",
        r"patient\s*name\s*.*?:\s*([a-zA-Z\s\.]+)",
        r"mr\.?\s+([a-zA-Z\s]+)",
        r"mrs\.?\s+([a-zA-Z\s]+)",
        r"ms\.?\s+([a-zA-Z\s]+)"
    ]

    for pattern in patterns:
        match = re.search(pattern, text_lower)
        if match:
            name = match.group(1).strip()
            name = re.sub(r'\b(lab|report|age|sex)\b.*', '', name)
            return name.title()

    return "Unknown"


# 🔹 ROBUST GENDER + AGE
def extract_patient_info(text):
    text_lower = text.lower()

    gender = "unknown"
    age = 30

    # ✅ 1. Direct field detection (BEST)
    patterns = [
        r'(gender|sex)\s*[:\-]\s*(male|female)',
        r'(gender|sex)\s*[:\-]\s*(m|f)\b'
    ]

    for pattern in patterns:
        match = re.search(pattern, text_lower)
        if match:
            value = match.group(2)
            if value in ["male", "m"]:
                gender = "male"
            elif value in ["female", "f"]:
                gender = "female"
            break

    # ✅ 2. Word fallback
    if gender == "unknown":
        if re.search(r'\bmale\b', text_lower):
            gender = "male"
        elif re.search(r'\bfemale\b', text_lower):
            gender = "female"

    # 🔹 AGE
    age_match = re.search(r'(\d{1,3})\s*(years|yrs|year|y)', text_lower)
    if age_match:
        age = int(age_match.group(1))

    name = extract_patient_name(text)

    return name, gender, age


# 🔹 ANALYSIS
def analyze_values(data, gender, age):
    result = {}

    category = "child" if age < 14 else gender

    for key, value in data.items():

        if key in NORMAL_RANGES:
            ranges = NORMAL_RANGES[key]

            if category in ranges:
                low, high = ranges[category]
            elif "default" in ranges:
                low, high = ranges["default"]
            else:
                result[key] = "Unknown"
                continue

            if value < low:
                result[key] = "Low"
            elif value > high:
                result[key] = "High"
            else:
                result[key] = "Normal"
        else:
            result[key] = "Unknown"

    return result


# 🔹 MAIN FUNCTION
def analyze_file(file_path):

    ext = file_path.split('.')[-1].lower()

    if ext == "pdf":
        text = extract_pdf_text(file_path)
        if not text.strip():
            text = extract_pdf_ocr(file_path)

    elif ext in ["jpg", "jpeg", "png"]:
        text = extract_image_text(file_path)

    else:
        return {"error": "Unsupported file"}

    if not text.strip():
        return {"error": "No text extracted"}

    cleaned = clean_text(text)

    # 🔹 Patient info
    name, gender, age = extract_patient_info(text)

    values = extract_values(cleaned)
    analysis = analyze_values(values, gender, age)

    # 🔹 REPORT
    report_text = "### 🧪 Medical Report\n\n"
    report_text += "### 👤 Patient Information\n\n"
    report_text += f"**Name:** {name}\n\n"
    report_text += f"**Age:** {age}\n\n"
    report_text += f"**Gender:** {gender.capitalize()}\n\n"

    report_text += "### 📊 Results\n\n"

    for key in values:
        val = values.get(key)
        status = analysis.get(key, "Unknown")
        icon = "🟢" if status == "Normal" else "🔴"

        report_text += f"- {icon} **{key.capitalize()}**: {val} ({status})\n"

    # 🔹 Severity
    total = len(values)
    abnormal = len([k for k in analysis if analysis[k] != "Normal"])

    severity_score = abnormal / total if total > 0 else 0

    # 🔹 Triage
    if abnormal >= 3:
        triage = 1
    elif abnormal > 0:
        triage = 2
    else:
        triage = 3

    # 🔹 Possible diseases
    possible_diseases = [
        {
            "name": f"{k.capitalize()} ({analysis[k]})",
            "probability": round(severity_score, 2)
        }
        for k in analysis if analysis[k] != "Normal"
    ]

    return {
        "report": report_text,
        "triage": triage,
        "severity_score": round(severity_score, 2),
        "main_disease": "Abnormal Report" if abnormal else "Normal",
        "possible_diseases": possible_diseases
    }