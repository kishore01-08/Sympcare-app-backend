import joblib
import pandas as pd
import os

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

model = joblib.load(os.path.join(BASE_DIR, "ml_models/disease_model.pkl"))
columns = joblib.load(os.path.join(BASE_DIR, "ml_models/columns.pkl"))

def build_vector(selected_symptoms):
    return [1 if c in selected_symptoms else 0 for c in columns]

def predict(symptoms):
    vector = build_vector(symptoms)

    probs = model.predict_proba([vector])[0]
    classes = model.classes_

    result = []
    for i in range(len(classes)):
        result.append({
            "name": classes[i],
            "prob": float(round(probs[i], 2))
        })

    # Sort highest first
    result.sort(key=lambda x: x["prob"], reverse=True)

    return result[:3]   # TOP 3
