from google import genai
from django.conf import settings
from .models import ChatMessage

# Create client (NEW WAY)
client = genai.Client(api_key=settings.GEM_API_KEY)


SYSTEM_INSTRUCTION = """
You are a clinical AI assistant designed to support licensed physicians during patient chatbot conversations.
Provide structured, evidence-based medical guidance to assist clinical reasoning.
Prioritize patient safety, clearly identify red flags, and recommend urgent in-person evaluation when appropriate.
Offer differential diagnoses, suggested investigations, and management considerations,
but do not replace physician judgment or provide definitive diagnoses without sufficient evidence.
Maintain a professional, concise, and objective tone.
Acknowledge uncertainty when information is incomplete.
Do not prescribe medications or provide controlled substance guidance directly to patients.
"""

def chat_with_gemini(session, user_message):

    # Get previous messages
    messages = session.messages.all().order_by("timestamp")

    contents = []

    # Add system instruction FIRST
    contents.append({
        "role": "user",
        "parts": [{"text": SYSTEM_INSTRUCTION}]
    })

    # Add chat history
    for msg in messages:
        contents.append({
            "role": msg.role,
            "parts": [{"text": msg.content}]
        })

    # Add current user message
    contents.append({
        "role": "user",
        "parts": [{"text": user_message}]
    })

    # Generate response (NEW METHOD)
    response = client.models.generate_content(
        model="gemini-2.0-flash",  # recommended stable model
        contents=contents,
    )

    reply_text = response.text

    # Save user message
    session.messages.create(
        role="user",
        content=user_message
    )

    # Save AI response
    session.messages.create(
        role="model",
        content=reply_text
    )

    return reply_text