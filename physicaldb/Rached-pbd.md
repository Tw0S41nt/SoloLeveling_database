# Physical Database Design: Workout Database

---

## What a CREATE TABLE statement should include

- **Table name**, which should be unique within the schema and descriptive.
- **Column names**, each with a **data type** (`INT`, `VARCHAR(n)`, `DATE`, `DECIMAL(p,s)`) and a length or precision where applicable.
- **Nullability** (`NULL` or `NOT NULL`) for each column.
- **Default values** (`DEFAULT ...`) for columns that should be filled automatically.
- **Primary key**, which uniquely identifies each row. It can be a single column or a composite of several.
- **Foreign keys**, which link a column to the primary key of another table.
- **Other constraints**, such as `UNIQUE` and `CHECK`.
- **Auto-generated values**, such as `AUTO_INCREMENT` depending on the DBMS.

## Database constraints and their benefits

Constraints are rules the DBMS enforces on the data in a table.

Common ones:

| Constraint | Rule enforced |
| `PRIMARY KEY` | Values are unique and not null |
| `FOREIGN KEY` | Values must exist in the referenced table  |
| `NOT NULL` | A value is required |
| `UNIQUE` | No duplicate values in the columns |
| `CHECK` | Values must satisfy a condition |
| `DEFAULT` | A value is supplied when none is given |

**Benefits:**

- **Data integrity and accuracy:** bad data is rejected at the database level, no matter which application or person inserts it.
- **Referential integrity:** no orphan rows, such as a template pointing to a user who doesn't exist.
- **Consistency:** business rules live in one place instead of being repeated in every application.
- **Self-documenting schema:** relationships and rules are visible in the table definitions.
- **Query optimization:** primary key and unique constraints create indexes, and the optimizer can use constraint knowledge.

## Ways to insert data

1. **`INSERT INTO ... VALUES`**: one row, or several rows in one statement.
2. **`INSERT INTO ... SELECT`**: copy rows from another table or query result.
3. **`INSERT ... ON DUPLICATE KEY UPDATE`** or `MERGE`: insert a row, or update it if it already exists.

## Database roles and what they are used for

A **role** is a named collection of privileges (`SELECT`, `INSERT`, `UPDATE`, `DELETE`, `CREATE`) on database objects. Instead of granting privileges to each user one by one, you grant them to a role and then assign users to that role. 

Roles are used to have:

- **Permission management**.
- **Principle of least privilege**, so users get only what they need.
- **Separation of duties**.

## Different types of database users

- **Database administrator (DBA):** full control over the server, including security, backup, performance and schema.
- **Database developer/designer:** creates and modifies structures (tables, views, procedures).
- **Application user (service account):** the account an application uses to connect, usually with limited rights on specific tables.
- **End user:** interacts with data through an application, typically with no direct database access.
- **Read-only/analyst/reporting user:** can only query data (`SELECT`).

## Script 1: Create the database

```sql
CREATE DATABASE IF NOT EXISTS workout_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE workout_db;
```

**Description:** Creates the database that holds all the tables and selects it as the active one. `utf8mb4` supports all Unicode characters, such as accented names.

## Script 2: Create the `users` table

```sql
CREATE TABLE users (
    user_id     INT          NOT NULL AUTO_INCREMENT,
    name        VARCHAR(50)  NOT NULL,
    goal        VARCHAR(50),
    chest       TINYINT,
    biceps      TINYINT,
    triceps     TINYINT,
    traps       TINYINT,
    delts       TINYINT,
    back        TINYINT,
    quads       TINYINT,
    glutes      TINYINT,
    calves      TINYINT,
    hamstrings  TINYINT,
    CONSTRAINT pk_users PRIMARY KEY (user_id)
);
```

**Description:** Creates the table that stores each person using the system. `user_id` is the auto-incrementing primary key. `name` is required (`NOT NULL`), while `goal` and the muscle-group columns are optional, matching the diagram. The `TINYINT` muscle columns store a small numeric value per muscle group. This is a parent table with no foreign keys, so it can be created first.

## Script 3: Create the `exercises` table

```sql
CREATE TABLE exercises (
    exercise_id      INT           NOT NULL AUTO_INCREMENT,
    name             VARCHAR(50)   NOT NULL,
    description      VARCHAR(1000),
    image            VARCHAR(255),
    video            VARCHAR(255),
    body_part        VARCHAR(20),
    primary_muscle   VARCHAR(20),
    secondary_muscle VARCHAR(20),
    CONSTRAINT pk_exercises PRIMARY KEY (exercise_id)
);
```

**Description:** Creates the exercise library. Each exercise has a unique auto-generated ID and a required name. The description, media links , body part, and primary and secondary muscles.

## Script 4: Create the `templates` table

```sql
CREATE TABLE templates (
    template_id INT         NOT NULL AUTO_INCREMENT,
    day         VARCHAR(20) NOT NULL,
    user_id     INT         NOT NULL,
    CONSTRAINT pk_templates PRIMARY KEY (template_id),
    CONSTRAINT fk_templates_users
        FOREIGN KEY (user_id) REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```

**Description:** Creates the workout templates . The relationship is one-to-many: one user can own many templates, and each template belongs to exactly one user. The foreign key `user_id` references `users`, and it is `NOT NULL` so a template can't exist without an owner. `ON DELETE CASCADE` removes a user's templates when the user is deleted.

## Script 5: Create the `template_exercises` junction table

```sql
CREATE TABLE template_exercises (
    template_id INT NOT NULL,
    exercise_id INT NOT NULL,
    CONSTRAINT pk_template_exercises PRIMARY KEY (template_id, exercise_id),
    CONSTRAINT fk_te_templates
        FOREIGN KEY (template_id) REFERENCES templates (template_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_te_exercises
        FOREIGN KEY (exercise_id) REFERENCES exercises (exercise_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```

**Description:** Resolves the many-to-many relationship between templates and exercises, since a template contains many exercises and an exercise can appear in many templates. The **composite primary key** `(template_id, exercise_id)` prevents the same exercise from being added to a template twice. Both columns are also foreign keys, so every row must point to a real template and a real exercise. Deleting a template or exercise removes the matching link rows. This table must be created last, after both of its parents.

---