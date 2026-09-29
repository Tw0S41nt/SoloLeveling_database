# Physical Database Initial Concepts & Setup

## Link to Physical Model
* [Group Physical Database Model](/physical-model/Physical_model.png) 

---

## Physical Database Concepts

### 1. Information Included in a `CREATE TABLE` Statement
A `CREATE TABLE` SQL statement defines the structure of a database table. It typically includes:
* **Table Name:** A unique identifier for the table within the database schema.
* **Column Definitions:** Each column's name along with its assigned data type (e.g., `INTEGER`, `VARCHAR(100)`, `TEXT`).
* **Constraints:** Specific rules applied to columns, such as `NOT NULL` or default values.
* **Primary Key:** Specifications identifying the column or combination of columns that uniquely identify each row.
* **Foreign Key:** Explicit definitions linking child table columns to parent table primary keys, establishing relationships and enforcing referential integrity.

### 2. Database Constraints and Their Benefits
Database constraints are rules enforced on data columns or tables to maintain data consistency and prevent invalid data entries. Key types include `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, and `CHECK`.

**Benefits:**
* **Data Integrity & Consistency:** Guarantees that stored data follows predefined schema rules.
* **Referential Integrity:** Prevents orphaned records in child tables (e.g., stopping a template from linking to a nonexistent user).
* **Error Prevention:** Catches and rejects invalid entries at the database level before they hit application storage.

### 3. Ways to Insert Data into a Database
* **Single-Row `INSERT`:** Explicitly inserting a single record into specified columns (e.g., `INSERT INTO users (name) VALUES ('John');`).
* **Multi-Row Batch `INSERT`:** Inserting multiple records within a single SQL statement.
* **`INSERT INTO ... SELECT`:** Populating a table directly using the query result set from another table.

### 4. Database Roles and Their Uses
Database roles are named collections of access privileges used to simplify permission management across users.

**Uses:**
* **Simplified Access Control:** Administrators assign permissions to roles (e.g., `read_only_user`, `app_developer`, `db_admin`) rather than granting individual privileges to each user account.

### 5. Different Types of Database Users
* **Superuser / Database Administrator (DBA):** Has unrestricted control over the entire database instance, managing schemas, user permissions, security, and backups.
* **Application / Service Accounts:** Programmatic users utilized by backend APIs and services to execute CRUD queries on tables.
* **Developer Users:** Human accounts assigned to software engineers for writing schemas, testing migrations, and debugging.
* **Read-Only / Reporting Users:** Accounts restricted solely to `SELECT` operations for business intelligence, reporting, or auditing without permission to alter data.

---

## Database Initialization Scripts

### Script Execution Order
1. `01_create_users.sql` — Parent table storing user profiles and muscle target metrics.
2. `02_create_exercises.sql` — Catalog table storing exercise definitions, media links, and target muscles.
3. `03_create_templates.sql` — Routine table storing workout templates linked to `users`.
4. `04_create_template_exercises.sql` — Junction table defining the many-to-many relationship between `templates` and `exercises`.

### `01_create_users.sql`
```sql
-- Table: users
-- Script Order: 01
-- Description: Stores user profile information, personal goals, and muscle target metrics.

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    goal VARCHAR(50),
    chest TINYINT,
    biceps TINYINT,
    triceps TINYINT,
    traps TINYINT,
    delts TINYINT,
    back TINYINT,
    quads TINYINT,
    glutes TINYINT,
    calves TINYINT,
    hamstrings TINYINT
);
```

### `02_create_exercises.sql`
```sql
-- Script Order: 02
-- Table: exercises
-- Description: Stores master list of exercises, muscle targeting details, and video/image links.

CREATE TABLE exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(1000),
    image VARCHAR(255),
    video VARCHAR(255),
    body_part VARCHAR(20),
    primary_muscle VARCHAR(20),
    secondary_muscle VARCHAR(20)
);
```

### `03_create_templates.sql`
```sql
-- Script Order: 03
-- Table: templates
-- Description: Stores user workout routines, linked via foreign key to users(user_id).

CREATE TABLE templates (
    template_id INT AUTO_INCREMENT PRIMARY KEY,
    day VARCHAR(20) NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT fk_templates_users 
        FOREIGN KEY (user_id) REFERENCES users(user_id) 
        ON DELETE CASCADE
);
```
### `04_create_template_exercises.sql`
```sql
-- Script Order: 04
-- Table: template_exercises
-- Description: Junction table resolving the many-to-many relationship between templates and exercises.

CREATE TABLE template_exercises (
    template_id INT NOT NULL,
    exercise_id INT NOT NULL,
    PRIMARY KEY (template_id, exercise_id),
    CONSTRAINT fk_te_templates 
        FOREIGN KEY (template_id) REFERENCES templates(template_id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_te_exercises 
        FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id) 
        ON DELETE CASCADE
);
```