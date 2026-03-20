import re

def safe_float(value, default=0.0):
    """
    Safely converts a value to float. 
    Handles cases like "It's a 7", "Level 5", or just "moderate" (returns default).
    """
    if value is None:
        return default
    
    if isinstance(value, (int, float)):
        return float(value)
    
    try:
        # Try direct conversion first
        return float(value)
    except (ValueError, TypeError):
        # Try to extract the first number found in the string (e.g., "7/10" -> 7)
        match = re.search(r"[-+]?\d*\.\d+|\d+", str(value))
        if match:
            try:
                return float(match.group())
            except ValueError:
                return default
        return default

def calculate_severity(answers):
    """
    Calculates a normalized severity score (0.0 to 1.0) based on pain and duration.
    """
    pain = safe_float(answers.get("pain"), default=0.0)
    days = safe_float(answers.get("days"), default=0.0)

    pain_norm = min(max(pain / 10, 0), 1)   # Clamp between 0 and 1
    days_norm = min(max(days / 14, 0), 1)   # Clamp between 0 and 1

    # Weighting: 70% Pain, 30% Duration
    severity_score = (pain_norm * 0.7) + (days_norm * 0.3)
    return float(round(severity_score, 2))

def determine_triage(severity_score):
    """
    Determines the triage level (1: High, 2: Medium, 3: Low) based on severity score.
    """
    if severity_score >= 0.70:
        return 1   # HIGH
    elif severity_score >= 0.40:
        return 2   # MEDIUM
    else:
        return 3   # LOW
def validate_answer(answer, q_type):
    import re

    answer = answer.lower()

    if q_type == "scale":
        val = safe_float(answer, None)
        return val is not None and 1 <= val <= 10

    elif q_type == "duration":
    # Accept if number exists (with or without units)
        return bool(re.search(r"\d+", answer))

    elif q_type == "yes_no":
        return any(word in answer for word in ["yes", "no"])

    elif q_type == "choice":
        return len(answer.strip()) > 2

    elif q_type == "text":
        return len(answer.strip()) > 2

    return False