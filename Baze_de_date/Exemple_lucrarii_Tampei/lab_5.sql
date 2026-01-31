USE hr;

-- 1
SELECT first_name, job_id, salary AS sal FROM employees;

-- 2
SELECT * FROM departments;

-- 3
SELECT employee_id, salary FROM employees;

-- 4
SELECT employee_id, first_name, salary * 12 AS salariu_anual FROM employees;

-- 5
-- structura tabelului
DESCRIBE departments;
-- cintinutul 
SELECT * 
FROM departments;

-- 6
DESCRIBE employees;

-- 7
SELECT employee_id, first_name, job_id, hire_date AS "Lucrează din"
FROM employees;

-- 8
SELECT 
    employee_id AS "Identificatorul", 
    first_name AS "Numele angajatului", 
    job_id AS "Funcția", 
    hire_date AS "Data angajării"
FROM employees;

-- 9
-- cu duplicate
SELECT job_id 
FROM employees;
-- fara duplicate
SELECT DISTINCT job_id 
FROM employees;

-- 10
SELECT 
    CONCAT(first_name, ', ', job_id) AS "Angajat și Funcție"
FROM employees;

-- 11
SELECT 
    CONCAT(employee_id, ', ', first_name, ', ', last_name, ', ', email, ', ', phone_number, ', ', hire_date, ', ', job_id, ', ', salary, ', ', commission_pct, ', ', manager_id, ', ', department_id) AS "Informații complete"
FROM employees;

-- 12
SELECT * 
FROM employees;

-- 13
-- cu clauza where si order by
SELECT employee_id, first_name, last_name, job_id FROM employees
WHERE salary > 10000
ORDER BY last_name;
-- cu substitutii ampresand
SET @salariu_minim = 10000;
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary > @salariu_minim
ORDER BY last_name;

-- 14
SELECT first_name, salary FROM employees
WHERE salary > 12000;

-- 15
SELECT first_name, department_id FROM employees
WHERE employee_id = 176;

-- 16
SELECT first_name, salary FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 17
SELECT first_name, job_id, hire_date
FROM employees
WHERE last_name IN ('Matos', 'Taylor')
ORDER BY hire_date;

-- 18
SELECT first_name, department_id FROM employees
WHERE department_id IN (20, 50)
ORDER BY first_name;

-- 19
SELECT first_name AS "Angajat", salary AS "Salariu_lunar"
FROM employees
WHERE salary BETWEEN 5000 AND 12000
  AND department_id IN (20, 50);

-- 20
SELECT first_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN '1987-02-20' AND '1989-05-01'
ORDER BY hire_date;

-- 21
-- utilizand like
SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '1994%';
-- utilizand year()
SELECT first_name, hire_date FROM employees
WHERE YEAR(hire_date) = 1994;

-- 22
SELECT first_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 23
SELECT first_name, salary, commission_pct FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- 24
SELECT first_name, salary, commission_pct
FROM employees
ORDER BY salary DESC, commission_pct DESC;

-- 25
SELECT first_name
FROM employees
WHERE first_name LIKE '%a%' AND first_name LIKE '%e%';

-- 26
SELECT first_name
FROM employees
WHERE first_name LIKE '__A%';

-- 27
SELECT first_name
FROM employees
WHERE first_name LIKE '%L%L%'
  AND (department_id = 30 OR manager_id = 101);

-- 28
SELECT first_name, job_id, salary FROM employees
WHERE (job_id LIKE '%CLERK%' OR job_id LIKE '%REP%')
  AND salary NOT IN (2500, 3500, 7000);

-- 29
SELECT first_name, salary, commission_pct FROM employees
WHERE salary > (salary * commission_pct * 5);

-- 30
SELECT first_name AS "Nume", job_id AS "Funcția"
FROM employees
WHERE job_id LIKE '%CLERK%';

-- 33
SELECT 
    e.employee_id AS "ID Angajat",
    e.first_name AS "Nume",
    e.last_name AS "Prenume",
    e.manager_id AS "ID Manager",
    e.department_id AS "ID Departament",
    d.department_name AS "Denumire Departament"
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 34
SELECT 
    CURRENT_DATE AS "Data Curentă",
    DATE_FORMAT(CURRENT_DATE, '%d-%m-%Y') AS "DD-MM-YYYY",
    DATE_FORMAT(CURRENT_DATE, '%M %d, %Y') AS "Luna Zi, An",
    DATE_FORMAT(CURRENT_DATE, '%Y/%m/%d') AS "YYYY/MM/DD";

-- 35
SELECT employee_id, first_name, salary,
    ROUND(salary * 1.155) AS "Salariu Majorat"
FROM employees;

-- 36
SELECT employee_id, first_name, salary,
    ROUND(salary * 1.155) AS "Salariu Majorat",
    ROUND(salary * 1.155) - salary AS "Majorare"
FROM employees;

-- 37
SELECT 
    UPPER(first_name) AS "Nume",
    LENGTH(first_name) AS "Lungime Nume"
FROM employees
WHERE first_name LIKE 'J%' OR first_name LIKE 'A%' OR first_name LIKE 'M%'
ORDER BY first_name;

-- 38
SELECT 
    CONCAT(first_name, ' ', last_name, ' câștigă ', salary, ' lunar, dar dorește ', salary * 3) AS "Salariu Ideal"
FROM employees;

SELECT 
    first_name || ' ' || last_name || ' câștigă ' || salary || ' lunar, dar dorește ' || salary * 3 AS "Salariu Ideal"
FROM employees;

-- 39
-- utilizand like
SELECT 
    CONCAT(UPPER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(first_name, 2))) AS "Prenume",
    UPPER(last_name) AS "Nume",
    LENGTH(last_name) AS "Lungime Nume"
FROM employees
WHERE first_name LIKE 'J%' OR first_name LIKE 'M%' OR first_name LIKE '__A%'
ORDER BY LENGTH(last_name) DESC;
-- utilizand substr
SELECT 
    CONCAT(UPPER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(first_name, 2))) AS "Prenume",
    UPPER(last_name) AS "Nume",
    LENGTH(last_name) AS "Lungime Nume"
FROM employees
WHERE SUBSTR(first_name, 1, 1) IN ('J', 'M') OR SUBSTR(first_name, 3, 1) = 'A'
ORDER BY LENGTH(last_name) DESC;

-- 40
SELECT 
    employee_id AS "Cod Angajat",
    TRIM(first_name) AS "Prenume",
    UPPER(last_name) AS "Nume",
    department_id AS "Cod Departament"
FROM employees
WHERE UPPER(TRIM(first_name)) = 'STEVEN';

-- 41
SELECT 
    employee_id AS "Cod Angajat",
    first_name AS "Nume",
    LENGTH(first_name) AS "Lungime Nume",
    INSTR(first_name, 'a') AS "Pozitie 'a'"
FROM employees
WHERE first_name LIKE '%e';

-- 42
SELECT employee_id, first_name, hire_date,
FLOOR(DATEDIFF(CURDATE(), hire_date) / 7) AS "Săptămâni Lucrate"
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) % 7 = 0;

-- 43
SELECT employee_id, first_name, salary,
    ROUND(salary * 1.15, 2) AS "Salariu Nou",
    FLOOR(ROUND(salary * 1.15, 2) / 100) AS "Numar Sute"
FROM employees
WHERE MOD(salary, 1000) != 0;

-- 44
SELECT 
    first_name AS "Nume Angajat",
    RPAD(hire_date, 20, ' ') AS "Data Angajarii"
FROM employees
WHERE commission_pct IS NOT NULL;

-- 45
SELECT 
    last_name AS "Nume",
    CEIL(PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM hire_date))) AS "Months_Worked"
FROM employees
ORDER BY "Months_Worked" DESC;

-- 46
SELECT 
    DATE_FORMAT(DATE_ADD(CURDATE(), INTERVAL 30 DAY), '%M %d, %Y %H:%i:%s') AS "Data Peste 30 Zile";

-- 47
SELECT 
    DATEDIFF(LAST_DAY(CURDATE()), CURDATE()) AS "Zile Rămase";
SELECT 
    DATE_ADD(NOW(), INTERVAL 12 HOUR) AS "Data Peste 12 Ore";
SELECT 
    DATE_ADD(NOW(), INTERVAL 5 MINUTE) AS "Data Peste 5 Minute";

-- 48
SELECT 
    CONCAT(first_name, ' ', last_name) AS "Nume Prenume",
    hire_date AS "Data Angajării",
    DATE_ADD(hire_date, INTERVAL 6 MONTH) + INTERVAL (8 - WEEKDAY(DATE_ADD(hire_date, INTERVAL 6 MONTH))) % 7 DAY AS "Negociere"
FROM employees;

-- 49
SELECT last_name,
    CEIL(PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM hire_date))) AS "Luni Lucrate"
FROM employees
ORDER BY "Luni Lucrate";

-- 50
SELECT 
    last_name AS "Nume",
    hire_date AS "Data Angajării",
    CASE DAYOFWEEK(hire_date)
        WHEN 1 THEN 'Duminică'
        WHEN 2 THEN 'Luni'
        WHEN 3 THEN 'Marți'
        WHEN 4 THEN 'Miercuri'
        WHEN 5 THEN 'Joi'
        WHEN 6 THEN 'Vineri'
        WHEN 7 THEN 'Sâmbătă'
    END AS "Zi"
FROM employees
ORDER BY FIELD(DAYOFWEEK(hire_date), 2, 3, 4, 5, 6, 7, 1);

-- 51
SELECT last_name,
    CASE 
        WHEN commission_pct IS NULL THEN 'Fără comision'
        ELSE CONCAT(commission_pct * 100, '%')
    END AS "Comision"
FROM employees;

-- 52
SELECT last_name, salary, commission_pct, (salary + NVL(salary * commission_pct, 0)) AS "Venit Lunar"
FROM employees
WHERE (salary + NVL(salary * commission_pct, 0)) > 10000;

-- 53
SELECT last_name, job_id, salary,
    CASE 
        WHEN job_id = 'IT_PROG' THEN salary * 1.20
        WHEN job_id = 'SA_REP' THEN salary * 1.25
        WHEN job_id = 'SA_MAN' THEN salary * 1.35
        ELSE salary
    END AS "Salariu Renegociat"
FROM employees;

-- 54
SELECT salary 
FROM employees 
WHERE job_id = 'IT_PROG';

SELECT 
    employee_id AS "ID_Angajat",
    first_name AS "Prenume",
    job_id AS "ID_Funcție",
    salary AS "Salariu"
FROM employees
WHERE job_id != 'IT_PROG'
  AND salary < ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG');

SELECT 
    employee_id AS "ID_Angajat",
    first_name AS "Prenume",
    job_id AS "ID_Funcție",
    salary AS "Salariu"
FROM employees
WHERE job_id != 'IT_PROG'
  AND salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG');


-- 55
SELECT  employee_id, first_name, job_id, salary,
FROM employees
WHERE job_id != 'IT_PROG'
  AND salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG');

-- 56
SELECT 
    e.last_name AS "Angajat",
    m.last_name AS "Șef"
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 57
SELECT 
    e.last_name AS "Nume Angajat"
FROM employees e
WHERE e.department_id = (SELECT department_id FROM employees WHERE last_name = 'Smith');

-- 58
SELECT e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 59
SELECT DISTINCT 
    j.job_title AS "Titlu Job"
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.department_id = 30;

-- 60
SELECT 
    e.last_name AS "Nume Angajat",
    d.department_name AS "Nume Departament",
    l.city AS "Locație"
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

-- 61
SELECT 
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.last_name LIKE '%A%';

-- 62
SELECT 
    e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Oxford';

-- 63/64
SELECT 
    e.employee_id AS "Ang#",
    e.last_name AS "Angajat",
    m.employee_id AS "Mgr#",
    m.last_name AS "Manager"
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 65
SELECT 
    e1.last_name AS "Angajat",
    e1.department_id AS "Cod Departament",
    e2.last_name AS "Coleg"
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id != e2.employee_id;

-- 66
DESCRIBE jobs;
SELECT 
    e.last_name AS "Nume",
    e.job_id AS "Cod Funcție",
    j.job_title AS "Titlu Funcție",
    d.department_name AS "Nume Departament",
    e.salary AS "Salariu"
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id;

-- 67
SELECT 
    e.last_name AS "Nume",
    e.hire_date AS "Data Angajării"
FROM employees e
WHERE e.hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Gates');

-- 68
SELECT 
    e.last_name AS "Angajat",
    e.hire_date AS "Data_ang",
    m.last_name AS "Manager",
    m.hire_date AS "Data_mgr"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
