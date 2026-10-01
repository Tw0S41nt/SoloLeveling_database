Your group's Final version of your GROUP physical model:
<img width="1259" height="568" alt="image" src="https://github.com/user-attachments/assets/f9c69977-35cd-437d-908c-a65b2c3b40c2" />

Your group's scripts to create your group's physical database:
[Link to script](https://github.com/Tw0S41nt/SoloLeveling_database/blob/main/script.sql)

Descriptions of common database concepts:
- What is a SQL query?
  - A command that can retrieve, add, update, or delete data from a database.
- Describe the parts of a SELECT statement
  - SELECT: specifies which column(s) to retrieve data from
  - FROM: specifies which tables to retrieve data from
- Describe how to filter a query
  - A query is filtered with WHERE clauses. A where clause can tell a database to return only rows that satisfy certain contains like containing a specific value.
- What are database indexes and what are the benefits of them
  - A database index is a data structure that can help a database find data faster by using a table to store references to where specific data is located.

SQL queries for your group project theme: 
- ```
  SELECT name, description, primary_muscle
  FROM exercises
  WHERE body_part = 'chest';
  ```
  Description: Returns exercises where the body_part is chest.
- ```
  SELECT *
  FROM exercises;
  ```
  Description: Returns all exercises
- ```
  SELECT name, primary_muscle, secondary_muscle
  FROM exercises
  WHERE primary_muscle = 'triceps'
    OR secondary_muscle = 'triceps';
  ```
  Description: Returns exercises where triceps is the primary OR secondary muscle
