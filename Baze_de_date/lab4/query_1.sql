-- Создание таблицы fosti_agenti на основе таблицы personal
/*CREATE TABLE fosti_agenti AS
SELECT ID_ANGAJAT AS codagent, NUME AS numeagent, ID_FUNCTIE AS functie, ID_DEPARTAMENT AS codfirma
FROM PERSONAL;
*/
-- 4.1. Переименование таблицы angajati в personal
/*
-- 4.2. Добавление колонок email и varsta в таблицу personal
ALTER TABLE PERSONAL
ADD COLUMN email VARCHAR(50);

ALTER TABLE PERSONAL
ADD COLUMN varsta INT;

-- 4.3. Изменение типа данных колонки email
ALTER TABLE PERSONAL
MODIFY COLUMN email TEXT;

-- 4.4. Удаление колонки email
ALTER TABLE PERSONAL
DROP COLUMN email;

-- 4.5. Деактивация (путем добавления флага) для колонки functie
ALTER TABLE PERSONAL
ADD COLUMN functie_inactiva BOOLEAN DEFAULT FALSE;

-- 4.6. Удаление всех неактивных колонок (здесь функция имитируется как неактивная)
ALTER TABLE PERSONAL
DROP COLUMN functie_inactiva;

-- 4.7. Добавление ограничения на колонку varsta (например, минимальный возраст = 18)
ALTER TABLE PERSONAL
ADD CONSTRAINT chk_varsta CHECK (varsta >= 18);

-- 4.8. Деактивация ограничения на колонку varsta
ALTER TABLE PERSONAL
DROP CHECK chk_varsta;

-- 4.9. Удаление ограничения на колонку varsta
-- Ограничение уже удалено на предыдущем шаге.
-- 5. Удаление таблицы fosti_agenti

DROP TABLE IF EXISTS fosti_agenti;*/

/*-- 6.1. Удаление всех записей из таблицы personal
TRUNCATE TABLE PERSONAL;*/

/*-- 7.1. Создание таблицы salariati на основе структуры таблицы personal
CREATE TABLE SALARIATI LIKE personal;

INSERT INTO SALARIATI (ID_ANGAJAT, PRENUME, NUME, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
SELECT ID_ANGAJAT, PRENUME, NUME, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta
FROM PERSONAL
WHERE ID_DEPARTAMENT IN (20, 50);

-- 7.3. Добавление нового сотрудника с данными, вводимыми пользователем
-- Пример для ручного ввода значений
DELETE FROM SALARIATI WHERE ID_ANGAJAT = 1001;
INSERT INTO SALARIATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES (1001, 'Иван', 'Иванов', 'ivan.ivanov@example.com', '123456789', '2024-01-01', 'F123', 5000.00, 0.10, NULL, 30, 35); */

-- для начала вставим данные для таблицы salariati
/*INSERT INTO SALARIATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
(101, 'Иван', 'Петров', 'ivan.petrov@example.com', '1234567890', '2020-01-01', 'F1', 2500, 0.05, 122, 10, 30),
(102, 'Анна', 'Сидорова', 'anna.sidorova@example.com', '0987654321', '2021-06-01', 'F2', 2700, 0.07, 122, 50, 28),
(103, 'Олег', 'Иванов', 'oleg.ivanov@example.com', '1122334455', '2019-03-15', 'F3', 3500, 0.1, 125, 20, 35),
(104, 'Мария', 'Смирнова', 'maria.smirnova@example.com', '5566778899', '2022-10-10', 'F4', 2800, 0.08, 125, 50, 25),
(105, 'Сергей', 'Кузнецов', 'sergey.kuznetsov@example.com', '6677889900', '2020-05-20', 'F5', 4000, 0.15, NULL, 50, 40);
(122, 'Алексей', 'Павлов', 'alexey.pavlov@example.com', '111222333', '2020-02-15', 'F6', 500, 0.12, NULL, 20, 40);*/
-- 8.1 Увеличим зарплату сотрудников в таблице SALARIATI, у которых зарплата меньше 3000, на 100
/*UPDATE SALARIATI
SET SALARIU = SALARIU + 100
WHERE SALARIU < 3000;*/
-- 8.2 Обновим зарплату сотрудников, чьим менеджером является сотрудник с ID = 122, установив зарплату сотрудника с ID = 125
-- 
/*UPDATE SALARIATI
SET SALARIU = (SELECT SALARIU FROM (SELECT * FROM SALARIATI) AS SubQuery WHERE ID_ANGAJAT = 125)
WHERE ID_MANAGER = 122;*/
-- 8.3 Обновить зарплату и комиссию сотрудников из SALARIATI на значения сотрудника с ID_ANGAJAT = 167 из PERSONAL, если их зарплата меньше зарплаты сотрудника с ID_ANGAJAT = 173 и они работают в департаменте 50.
/*INSERT INTO FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCT, SALARIU_MIN, SALARIU_MAX)
VALUES 
('F1', 'Manager', 3000, 6000),
('F2', 'Developer', 2500, 5000),
('F3', 'Analyst', 2000, 4500),
('F4', 'Tester', 1500, 4000),
('F5', 'HR', 2000, 4500),
('F0', 'Intern', 1500, 2000);

INSERT INTO PERSONAL (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
(125, 'Тест', 'Тестович', 'test@example.com', '123456789', '2023-01-01', 'F0', 5000, 0.1, NULL, 10, 30),
(167, 'Сергей', 'Иванов', 'sergey.ivanov@example.com', '987654321', '2022-02-15', 'F1', 4500, 0.08, NULL, 50, 32),
(173, 'Анна', 'Петрова', 'anna.petrova@example.com', '876543210', '2021-06-20', 'F2', 4700, 0.1, NULL, 50, 29);
*/

/*UPDATE SALARIATI
SET SALARIU = (SELECT SALARIU FROM PERSONAL WHERE ID_ANGAJAT = 167),
    COMISION = (SELECT COMISION FROM PERSONAL WHERE ID_ANGAJAT = 167)
WHERE SALARIU < (SELECT SALARIU FROM PERSONAL WHERE ID_ANGAJAT = 173)
  AND ID_DEPARTAMENT = 50;*/

-- 9.1. Удалить сотрудников из таблицы SALARIATI, у которых ID_MANAGER равен 122 или 123:
-- данные
/*INSERT INTO SALARIATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
(301, 'Сергей', 'Петров', 'sergey.petrov@example.com', '999888777', '2015-05-10', 'F2', 3200, 0.10, 125, 20, 40),
(302, 'Елена', 'Смирнова', 'elena.smirnova@example.com', '111222333', '2014-03-22', 'F3', 2800, 0.08, NULL, 30, 35);*/
/*DELETE FROM SALARIATI
WHERE ID_MANAGER IN (122, 123);
-- 9.2. Удалить сотрудников, нанятых до 2016 года:
Копировать код
DELETE FROM SALARIATI
WHERE YEAR(DATA_ANGAJARE) < 2016;

-- 9.3. Удалить всех сотрудников и отменить транзакцию:
-- Начинаем транзакцию:
START TRANSACTION;
-- Удаляем всех сотрудников:
DELETE FROM salariati;
-- Проверяем, нужно ли отменить изменения, если да, то выполняем команду отмены:
ROLLBACK;
-- Если удаление нужно подтвердить, используем:
COMMIT;*/




