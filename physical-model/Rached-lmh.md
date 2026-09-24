## Physical Model Diagram

![Physical Model Schema Diagram](../Physical_model.png)

## Group Logical Model Link
* [Group Logical Model](../Logical_model.png)

### Conceptual/Logical vs. Physical Model
* **Conceptual Model:** High level view that sees key identities and relationships without much info.
* **Logical Model:** Includes all entities, keys, relationships, etc.
* **Physical Model:** Specifies exact data storage types, column sizes, indexes, default values, nullability constraints, foreign key referential integrity rules.

### Description of Physical Model

1. **`users` Table:** Stores user information, fitness goals, and target weekly set counts for each muscle group. Muscle counts default to `0` using `DEFAULT: 0` so empty targets start at zero instead of causing null errors in calculations.
2. **`templates` Table:** Stores workout routines assigned to specific days (such as "Leg Day" or "Push Day"). Every template belongs to a user through the `user_id` foreign key.
3. **`exercises` Table:** Acts as the master exercise library. Media fields (`image`, `video`) use `VARCHAR(255)` to hold link URLs, while execution instructions use `TEXT` so descriptions can be as long as needed.
4. **`template_exercises` Table:** Connects `templates` and `exercises` in a many-to-many relationship. It uses a combined primary key `(template_id, exercise_id)` to prevent the same exercise from being added twice to a single template.