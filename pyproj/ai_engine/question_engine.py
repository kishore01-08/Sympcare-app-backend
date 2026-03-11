import random
from .categories import get_category
from .questions import QUESTION_BANK, COMMON_QUESTIONS

def generate_questions(symptoms):
    """
    Generates a list of questions for the chat based on symptoms.
    - Includes 2 mandatory common questions (Pain and Days).
    - Picks relevant questions from categories related to symptoms.
    - Ensures no repeats and a limit of 5 total questions.
    """
    questions = []

    # 1. Start with the mandatory common questions
    # COMMON_QUESTIONS[0] is Pain, COMMON_QUESTIONS[1] is Days
    questions.extend(COMMON_QUESTIONS)

    # 2. Collect potential category-specific questions
    category_questions = []
    seen_questions = set(questions) # To avoid duplicates
    
    # Get categories for all symptoms
    categories = set()
    for s in symptoms:
        categories.add(get_category(s))
    
    # Pool all questions from relevant categories
    for cat in categories:
        for q in QUESTION_BANK.get(cat, []):
            if q not in seen_questions:
                category_questions.append(q)
    
    # 3. Shuffle category questions to provide variety in different chats
    random.shuffle(category_questions)
    
    # 4. Add up to 3 more relevant questions to reach a total of 5
    # (2 common + 3 specific = 5 total)
    questions.extend(category_questions[:3])

    return questions
