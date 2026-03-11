import os
from dotenv import load_dotenv
load_dotenv()

import os
from pypdf import PdfReader
from google import genai

client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))

def extract_pdf_text(path):
    reader = PdfReader(path)
    text = ""

    for page in reader.pages:
        t = page.extract_text()
        if t:
            text += t

    return text


import json

def analyze_file(file_path):

    ext = file_path.split('.')[-1].lower()

    if ext == "pdf":
        content = extract_pdf_text(file_path)
    else:
        return {"error": "Only PDF supported now."}

    if not content:
        return {"error": "Could not read PDF text."}

    prompt = f"""
    Analyze the following medical report content and provide a structured JSON response.
    Content: {content}

    The JSON should have the following keys:
    - "report": A clear summary and clinical impression (markdown allowed).
    - "triage": An integer (1 for Emergency, 2 for Urgent, 3 for Routine).
    - "severity_score": A float between 0.0 and 1.0.
    - "main_disease": A short string of the primary condition identified.
    - "possible_diseases": A list of objects with "name" (string) and "probability" (float, 0-1).

    Return ONLY the raw JSON string.
    """

    try:
        response = client.models.generate_content(
            model="gemini-2.5-flash",
            contents=prompt
        )
        
        # Clean response text if it contains markdown code blocks
        text = response.text.strip()
        if text.startswith("```json"):
            text = text[7:-3].strip()
        elif text.startswith("```"):
            text = text[3:-3].strip()
            
        return json.loads(text)
    except Exception as e:
        return {
            "error": f"AI Analysis Error: {str(e)}",
            "report": f"Error during analysis: {str(e)}",
            "triage": 3,
            "severity_score": 0.0,
            "main_disease": "Error",
            "possible_diseases": []
        }
