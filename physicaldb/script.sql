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

CREATE TABLE templates (
    template_id INT AUTO_INCREMENT PRIMARY KEY,
    day VARCHAR(20) NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT fk_templates_users 
        FOREIGN KEY (user_id) REFERENCES users(user_id) 
        ON DELETE CASCADE
);

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