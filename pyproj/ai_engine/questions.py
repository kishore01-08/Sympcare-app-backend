COMMON_QUESTIONS = [
    {
        "id": "pain",
        "question": "On a scale of 1–10, how severe is the pain?",
        "type": "scale"
    },
    {
        "id": "days",
        "question": "For how many days have you had these symptoms?",
        "type": "duration"
    }
]

QUESTION_BANK = {

    "head": [
        {"id": "dizziness", "question": "Do you feel dizziness or blurred vision?", "type": "text"},
        {"id": "pain_pattern", "question": "Is the pain continuous or intermittent?", "type": "text"},
        {"id": "light_sensitivity", "question": "Do you have sensitivity to light or sound?", "type": "yes_no"},
        {"id": "eye_pressure", "question": "Do you feel pressure behind your eyes?", "type": "yes_no"},
        {"id": "headache_location", "question": "Where is the headache located?", "type": "text"},
        {"id": "headache_trigger", "question": "Does anything trigger the headache?", "type": "text"},
        {"id": "headache_duration", "question": "How long does each headache episode last?", "type": "duration"},
        {"id": "vision_changes", "question": "Have you noticed any changes in vision?", "type": "yes_no"},
        {"id": "nausea_headache", "question": "Do you feel nausea along with the headache?", "type": "yes_no"},
        {"id": "morning_headache", "question": "Is the headache worse in the morning?", "type": "yes_no"}
    ],

    "respiratory": [
        {"id": "breathing_difficulty", "question": "Are you experiencing difficulty breathing?", "type": "yes_no"},
        {"id": "cough_type", "question": "Is the cough dry or wet?", "type": "text"},
        {"id": "chest_tightness", "question": "Do you feel chest tightness?", "type": "yes_no"},
        {"id": "wheezing", "question": "Do you wheeze while breathing?", "type": "yes_no"},
        {"id": "cough_duration", "question": "How long have you had the cough?", "type": "duration"},
        {"id": "sputum_color", "question": "What is the color of the sputum?", "type": "text"},
        {"id": "breath_activity", "question": "Does breathing worsen with activity?", "type": "yes_no"},
        {"id": "night_breathing", "question": "Do you have breathing issues at night?", "type": "yes_no"},
        {"id": "fever_respiratory", "question": "Do you have fever along with breathing issues?", "type": "yes_no"},
        {"id": "smoking_history", "question": "Do you have a history of smoking?", "type": "yes_no"}
    ],

    "stomach": [
        {"id": "nausea", "question": "Have you experienced vomiting or nausea?", "type": "yes_no"},
        {"id": "bloating", "question": "Do you feel bloated?", "type": "yes_no"},
        {"id": "pain_after_food", "question": "Is the pain worse after eating?", "type": "yes_no"},
        {"id": "bowel_changes", "question": "Any diarrhea or constipation?", "type": "yes_no"},
        {"id": "pain_location", "question": "Where is the abdominal pain located?", "type": "text"},
        {"id": "pain_type", "question": "Is the pain sharp, dull, or cramping?", "type": "text"},
        {"id": "vomiting_frequency", "question": "How frequently are you vomiting?", "type": "text"},
        {"id": "blood_vomit", "question": "Have you noticed blood in vomit?", "type": "yes_no"},
        {"id": "appetite_loss", "question": "Have you lost your appetite?", "type": "yes_no"},
        {"id": "food_trigger", "question": "Does any specific food trigger symptoms?", "type": "text"}
    ],

    "skin": [
        {"id": "itching", "question": "Is there itching or burning sensation?", "type": "yes_no"},
        {"id": "redness", "question": "Is the skin red or swollen?", "type": "yes_no"},
        {"id": "rash_spread", "question": "Did the rash spread recently?", "type": "yes_no"},
        {"id": "skin_peeling", "question": "Any peeling or dryness?", "type": "yes_no"},
        {"id": "rash_location", "question": "Where is the rash located?", "type": "text"},
        {"id": "rash_duration", "question": "How long have you had the rash?", "type": "duration"},
        {"id": "blisters", "question": "Are there any blisters?", "type": "yes_no"},
        {"id": "pain_skin", "question": "Is the affected area painful?", "type": "yes_no"},
        {"id": "allergy_history", "question": "Do you have any known allergies?", "type": "yes_no"},
        {"id": "new_products", "question": "Have you used any new skincare products recently?", "type": "yes_no"}
    ],

    "muscle": [
        {"id": "movement_pain", "question": "Does movement increase the pain?", "type": "yes_no"},
        {"id": "swelling", "question": "Is there any swelling or stiffness?", "type": "yes_no"},
        {"id": "weakness", "question": "Do you feel weakness in the area?", "type": "yes_no"},
        {"id": "injury", "question": "Did you have any injury recently?", "type": "yes_no"},
        {"id": "pain_location", "question": "Where exactly is the pain located?", "type": "text"},
        {"id": "pain_duration", "question": "How long have you had this pain?", "type": "duration"},
        {"id": "pain_type", "question": "Is the pain sharp, dull, or throbbing?", "type": "text"},
        {"id": "exercise_relation", "question": "Did the pain start after exercise?", "type": "yes_no"},
        {"id": "joint_stiffness", "question": "Do you feel stiffness in joints?", "type": "yes_no"},
        {"id": "range_motion", "question": "Is your range of motion limited?", "type": "yes_no"}
    ],

    "mental": [
        {"id": "sleep_impact", "question": "Is it affecting your sleep?", "type": "yes_no"},
        {"id": "stress", "question": "Do you feel stressed or anxious often?", "type": "yes_no"},
        {"id": "mood_changes", "question": "Any sudden mood changes?", "type": "yes_no"},
        {"id": "low_energy", "question": "Do you feel a lack of energy or motivation?", "type": "yes_no"},
        {"id": "focus_issue", "question": "Do you have difficulty concentrating?", "type": "yes_no"},
        {"id": "panic_attacks", "question": "Have you experienced panic attacks?", "type": "yes_no"},
        {"id": "social_withdrawal", "question": "Do you avoid social interactions?", "type": "yes_no"},
        {"id": "appetite_changes", "question": "Have your eating habits changed?", "type": "yes_no"},
        {"id": "hopeless_feeling", "question": "Do you feel hopeless or worthless?", "type": "yes_no"},
        {"id": "irritability", "question": "Do you feel unusually irritable?", "type": "yes_no"}
    ],

    "urogenital": [
        {"id": "pain_urination", "question": "Do you feel pain while urinating?", "type": "yes_no"},
        {"id": "discharge", "question": "Any unusual discharge?", "type": "yes_no"},
        {"id": "menstrual_changes", "question": "Any changes in menstrual cycle?", "type": "yes_no"},
        {"id": "pelvic_pain", "question": "Do you feel pelvic pain?", "type": "yes_no"},
        {"id": "urine_frequency", "question": "Are you urinating more frequently than usual?", "type": "yes_no"},
        {"id": "urine_color", "question": "Has the color of your urine changed?", "type": "yes_no"},
        {"id": "blood_urine", "question": "Have you noticed blood in urine?", "type": "yes_no"},
        {"id": "night_urination", "question": "Do you wake up at night to urinate?", "type": "yes_no"},
        {"id": "lower_abdomen_pain", "question": "Do you feel pain in the lower abdomen?", "type": "yes_no"},
        {"id": "burning_sensation", "question": "Do you feel a burning sensation while urinating?", "type": "yes_no"}
    ],

    "general": [
        {"id": "fever_check", "question": "Do you have fever or chills?", "type": "yes_no"},
        {"id": "fatigue", "question": "Do you feel fatigue or weakness?", "type": "yes_no"},
        {"id": "appetite", "question": "Have you lost your appetite?", "type": "yes_no"},
        {"id": "weight_change", "question": "Any recent weight changes?", "type": "yes_no"},
        {"id": "sleep_quality", "question": "How is your sleep quality?", "type": "text"},
        {"id": "energy_levels", "question": "How would you describe your energy levels?", "type": "text"},
        {"id": "body_aches", "question": "Do you have body aches?", "type": "yes_no"},
        {"id": "infection_history", "question": "Have you had any recent infections?", "type": "yes_no"},
        {"id": "medication_use", "question": "Are you currently taking any medications?", "type": "yes_no"},
        {"id": "recent_travel", "question": "Have you traveled recently?", "type": "yes_no"}
    ]
}