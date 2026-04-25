DROP TABLE IF EXISTS employees, departments CASCADE;

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE,
    location VARCHAR(50),
    budget INT
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50),
    join_date DATE,
    performance_score INT,
    manager_id INT,
    dept_id INT,
    CONSTRAINT fk_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_name, location, budget)
SELECT
    'Dept_' || gs,
    (ARRAY['NY','LA','Chicago','Dallas','Seattle'])[floor(random()*5)+1],
    (random()*500000 + 50000)::int
FROM generate_series(1,80) AS gs;

INSERT INTO employees (
    first_name, last_name, email, department, salary, age, city,
    join_date, performance_score, manager_id, dept_id
)
SELECT
    'Name' || gs,
    'Surname' || gs,
    'user' || gs || '@test.com',
    (ARRAY['HR','IT','Finance','Sales','Marketing'])[floor(random()*5)+1],
    (random()*90000 + 30000)::int,
    (random()*30 + 20)::int,
    (ARRAY['NY','LA','Chicago','Dallas','Seattle'])[floor(random()*5)+1],
    CURRENT_DATE - (random()*1000)::int,
    (random()*5 + 1)::int,
    (random()*10 + 1)::int,
    (floor(random()*80) + 1)::int
FROM generate_series(1,100) AS gs;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT 
    e.id,
    e.first_name,
    e.last_name,
    e.salary,
    e.city,
    d.dept_name,
    d.location,
    d.budget
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
LIMIT 10;