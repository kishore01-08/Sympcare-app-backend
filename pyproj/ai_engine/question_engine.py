# question_engine.py

from .categories import get_category
from .questions import QUESTION_BANK, COMMON_QUESTIONS
from .analysis import validate_answer
import random 

class ChatEngine:
    def __init__(self, symptoms):
        self.symptoms = symptoms
        self.questions = self._generate_questions(symptoms)
        self.current_index = 0
        self.answers = {}

    def _generate_questions(self, symptoms):
        """
        Generates structured question list:
        - 1 to 2 questions per symptom category
        - No duplicates
        - Common questions at the end
        """

        questions = []
        seen_ids = set()


        for symptom in symptoms:
            category = get_category(symptom)
            category_qs = QUESTION_BANK.get(category, [])

            num_questions = random.randint(1, 2)

            selected_questions = random.sample(
                category_qs,
                min(num_questions, len(category_qs))
            )

            for q in selected_questions:
                if q["id"] not in seen_ids:
                    questions.append(q)
                    seen_ids.add(q["id"])

        for q in COMMON_QUESTIONS:
            if q["id"] not in seen_ids:
                questions.append(q)
                seen_ids.add(q["id"])

        return questions

    def get_current_question(self):
        """
        Returns current question object
        """
        if self.current_index < len(self.questions):
            return self.questions[self.current_index]
        return None

    def process_answer(self, answer):
        """
        Validates answer and controls flow
        """
        current_q = self.get_current_question()

        if not current_q:
            return {"status": "complete", "answers": self.answers}

        q_type = current_q["type"]
        q_id = current_q["id"]

        # Validate answer
        if validate_answer(answer, q_type):
            self.answers[q_id] = answer
            self.current_index += 1

            # If finished all questions
            if self.current_index >= len(self.questions):
                return {
                    "status": "complete",
                    "answers": self.answers
                }

            return {
                "status": "next",
                "question": self.get_current_question()["question"]
            }

        else:
            # ❌ Invalid answer → REPEAT SAME QUESTION
            return {
                "status": "repeat",
                "message": "Please provide a valid answer.",
                "question": current_q["question"]
            }