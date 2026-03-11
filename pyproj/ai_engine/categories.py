def get_category(symptom):
    s = symptom.lower().strip()

    # HEAD / FACE / SENSES
    if any(word in s for word in [
        "head", "eye", "ear", "vision", "tongue", "mouth",
        "nose", "throat", "face", "scalp"
    ]):
        return "head"

    # RESPIRATORY / CHEST
    if any(word in s for word in [
        "cough", "breath", "breathing", "chest", "lung",
        "wheezing", "apnea", "sputum", "nose"
    ]):
        return "respiratory"

    # STOMACH / ABDOMEN / DIGESTIVE
    if any(word in s for word in [
        "stomach", "abdominal", "abdomen", "vomit",
        "nausea", "diarrhea", "constipation",
        "bloating", "heartburn", "stool"
    ]):
        return "stomach"

    # SKIN / HAIR / NAILS
    if any(word in s for word in [
        "skin", "rash", "itch", "dry", "peeling",
        "scalp", "mole", "wart", "nail", "hair"
    ]):
        return "skin"

    # MUSCLE / JOINT / LIMBS
    if any(word in s for word in [
        "pain", "joint", "muscle", "arm", "leg",
        "knee", "shoulder", "ankle", "wrist",
        "elbow", "hip", "back", "neck", "foot",
        "toe", "stiff", "swelling", "weakness",
        "cramp", "spasm"
    ]):
        return "muscle"

    # MENTAL / EMOTIONAL / BEHAVIOR
    if any(word in s for word in [
        "anxiety", "depression", "anger",
        "fear", "memory", "behavior",
        "hallucination", "delusion",
        "phobia", "obsession", "sleep"
    ]):
        return "mental"

    # URINARY / REPRODUCTIVE
    if any(word in s for word in [
        "urine", "urination", "vaginal",
        "penis", "menstrual", "pregnancy",
        "prostate", "breast", "genital"
    ]):
        return "urogenital"

    # HEART / BLOOD / GENERAL BODY
    if any(word in s for word in [
        "heart", "pulse", "blood",
        "fever", "chills", "fatigue",
        "weight", "sweat", "temperature"
    ]):
        return "general"

    # DEFAULT
    return "general"
