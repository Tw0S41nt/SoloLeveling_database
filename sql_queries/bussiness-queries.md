# SQL queries for your group project theme:
```sql
SELECT *
FROM exercises;
```
Description: Returns all exercises

```sql
SELECT COUNT(*) AS total_users
FROM users;
```
Description:  Retrieve the total number of registered users in the system

```sql
SELECT 
    u.user_id,
    u.name AS user_name,
    t.template_id,
    t.day_of_week,
    COUNT(te.exercise_id) AS total_exercises
FROM users u
INNER JOIN templates t 
    ON u.user_id = t.user_id
LEFT JOIN template_exercises te 
    ON t.template_id = te.template_id
GROUP BY 
    u.user_id, 
    u.name, 
    t.template_id, 
    t.day_of_week
ORDER BY 
    u.user_id, 
    FIELD(
        t.day_of_week, 
        'Monday', 
        'Tuesday', 
        'Wednesday', 
        'Thursday', 
        'Friday', 
        'Saturday', 
        'Sunday'
    );
```

Description: This query performs an `INNER JOIN` between `users` and `templates`, and a `LEFT JOIN` with `template_exercises` to count the total number of assigned exercises per template for each user using `COUNT()`. The results are grouped by the user and template details. The results are then sorted by `user_id` and sequentially by the day of the week using the `FIELD()` function.
