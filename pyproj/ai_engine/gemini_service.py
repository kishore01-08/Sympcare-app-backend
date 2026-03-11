import google.generativeai as genai
from django.conf import settings

genai.configure(api_key=settings.GEMINI_API_KEY)

model = genai.GenerativeModel("gemini-3-flash-preview")

def analyze_medical_file(text_data):
    prompt = f"""
    Analyze this medical report and summarize:
    - Key findings
    - Abnormal values
    - Possible health concerns
    - Simple recommendations

    Report:
    {text_data}
    """

    response = model.generate_content(prompt)
    return response.text
