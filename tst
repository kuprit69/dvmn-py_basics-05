import os
import random
from faker import Faker
import file_operations
from letters_mapping import LETTERS_MAPPING 
from skills import SKILLS


def main():
    fake = Faker("ru_RU")
    output_folder = "cards"
    os.makedirs(output_folder, exist_ok=True)

    for _ in range(10):
        selected_skills = random.sample(SKILLS, 3)
        converted_skills = []

        for skill in selected_skills:
            new_text = ''.join(LETTERS_MAPPING.get(char, char) for char in skill)
            converted_skills.append(new_text)

        context = {
            "first_name": fake.first_name(),
            "last_name": fake.last_name(),
            "job": fake.job(),
            "town": fake.city(),
            "strength": random.randint(3, 18),
            "agility": random.randint(3, 18),
            "endurance": random.randint(3, 18),
            "energy": random.randint(3, 18),
            "intelligence": random.randint(3, 18),
            "luck": random.randint(3, 18),
            "skill_1": converted_skills[0],
            "skill_2": converted_skills[1],
            "skill_3": converted_skills[2]
        }

        output_path = os.path.join(output_folder, f"result_{i}.svg")
        file_operations.render_template("charsheet.svg", output_path, context)

if __name__ == '__main__':
    main()
