# Database Model Summary

## Conceptual Model
![Conceptual Model Diagram](./Conceptual%20Model/Conceptual_model.png)
**Description:** 
This conceptual model represents the high-level business logic for our workout application. It identifies core entities including Users, Workout Templates, and Exercises, outlining the relationships between users creating templates and assigning specific exercise activities.

---

## Logical Model
![Logical Model Diagram](./Logical%20Model/Logical_model.png)
**Description:** 
The logical model formalizes entity structures into relational tables. Primary keys (PK) and foreign keys (FK) establish cardinalities between entities, such as the one-to-many relationship between Users and Templates.

---

## Physical Model
![Physical Model Diagram](./Physical%20Model/Physical_model.png)
 [physical_model.dbml](./Physical%20Model/physical_model.physical_model.dbml)

**Description:** 
The physical model maps our logical schema directly to MariaDB storage engine specifications. Columns now define exact sizing constraints (e.g., `VARCHAR(255)`, `TINYINT(1)`), explicit `NOT NULL` rules, and auto-incrementing primary keys.