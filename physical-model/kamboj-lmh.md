## Physical Model Diagram

![Physical Model Schema Diagram](../Physical_model.png)

## Group Logical Model Link
* [Group Logical Model](../Logical_model.png)

### Conceptual/Logical vs. Physical Model
* **Conceptual Model:** High-level view that identifies key entities and their business relationships without technical details.
* **Logical Model:** Defines entities, attributes, primary/foreign keys, and data relationships independently of any specific database software.
* **Physical Model:** Platform-dependent implementation model tailored to a specific Database Management System (DBMS). It specifies exact data storage types, column sizes, indexes, default values, nullability constraints, foreign key referential integrity rules.

### Common Data Types (MariaDB)
* **`INT` / `INTEGER`:** Standard 4-byte integer used for auto-incrementing surrogate primary keys, foreign keys, and integer counts.
* **`VARCHAR(N)`:** Variable-length character string with a defined max limit. Used for names, titles.
* **`TEXT`:** Variable-length string used for storing unstructured text or long descriptions without requiring a pre-specified length constraint.
* **`DATETIME` / `TIMESTAMP`:** Date and time values formatted as `YYYY-MM-DD HH:MM:SS`.

### Default & Null Values
* **`NULL` vs. `NOT NULL`:** `NOT NULL` requires a column to contain a valid value upon record insertion, ensuring required attributes (e.g., entity names or foreign keys) are never left blank. `NULL` permits optional attributes.
* **`DEFAULT`:** Specifies a fallback value automatically applied by the database engine during record creation if no value is explicitly supplied.

### Check Constraints
* **Check Constraints (`CHECK`):** Evaluates boolean conditions on table columns during `INSERT` or `UPDATE` operations to maintain domain integrity. If a record violates the rule (e.g., verifying `volume_count >= 0`), the DBMS rejects the write operation.