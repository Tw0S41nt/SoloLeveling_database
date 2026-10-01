Group physical model:
![alt text](../Physical_model.png)

Group's physical database:
[Link to script](https://github.com/Tw0S41nt/SoloLeveling_database/blob/main/script.sql)

- What is a SQL query?
  - A command that can retrieve, add, update, or delete data from a database.
- The parts of a SELECT statement
  - SELECT: specifies which column to retrieve data from
  - FROM: specifies which tables to retrieve data from
- How to filter a query
  - A query is filtered with WHERE clauses. A where clause tells a database to return only the rows that satisfy certain contains that the user specifies.
- What are database indexes and what are the benefits of them
  - A database index is a data structure that can help a database find data faster by using a table to store references to where specific data is located.

SQL queries:
- ```
  SELECT name, primary_muscle, secondary_muscle
  FROM exercises
  WHERE primary_muscle = 'triceps'
    OR secondary_muscle = 'triceps';
  ```
  Description: Returns exercises where triceps is the primary OR secondary muscle
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
