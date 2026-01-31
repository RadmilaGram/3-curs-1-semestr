/*CREATE TABLE UNIVERSITATE (
    UNIV_ID INT PRIMARY KEY, -- Уникальный идентификатор университета
    UNIV_DEN VARCHAR(100) NOT NULL, -- Название университета
    RATING INT, -- Рейтинг университета
    ORAS VARCHAR(50) -- Город, где находится университет
);
*/

/*CREATE TABLE PROFESOR (
    PR_ID INT PRIMARY KEY, -- Уникальный идентификатор профессора
    NUME VARCHAR(50) NOT NULL, -- Имя профессора
    PRENUME VARCHAR(50) NOT NULL, -- Фамилия профессора
    ORAS VARCHAR(50), -- Город проживания
    UNIV_ID INT, -- Идентификатор университета
    FOREIGN KEY (UNIV_ID) REFERENCES UNIVERSITATE(UNIV_ID) -- Связь с таблицей UNIVERSITATE
);
*/
/*CREATE TABLE CURS (
    CURS_ID INT PRIMARY KEY, -- Уникальный идентификатор курса
    CURS_DEN VARCHAR(100) NOT NULL, -- Название курса
    ORE INT NOT NULL, -- Количество часов
    SEMESTRU INT NOT NULL -- Номер семестра
);*/
/*CREATE TABLE STUDENT (
    ST_ID INT PRIMARY KEY, -- Уникальный идентификатор студента
    NUME VARCHAR(50) NOT NULL, -- Имя студента
    PRENUME VARCHAR(50) NOT NULL, -- Фамилия студента
    BURSA INT, -- Стипендия
    ANUL INT NOT NULL, -- Год обучения
    ORAS VARCHAR(50), -- Город проживания
    DATA_N DATE, -- Дата рождения
    UNIV_ID INT, -- Идентификатор университета
    FOREIGN KEY (UNIV_ID) REFERENCES UNIVERSITATE(UNIV_ID) -- Связь с таблицей UNIVERSITATE
);*/
/*CREATE TABLE NOTE_EXAM (
    EXAM_ID INT PRIMARY KEY, -- Уникальный идентификатор экзамена
    ST_ID INT, -- Идентификатор студента
    CURS_ID INT, -- Идентификатор курса
    NOTA INT, -- Оценка за экзамен
    DATA_EXAM DATE, -- Дата проведения экзамена
    FOREIGN KEY (ST_ID) REFERENCES STUDENT(ST_ID), -- Связь с таблицей STUDENT
    FOREIGN KEY (CURS_ID) REFERENCES CURS(CURS_ID) -- Связь с таблицей CURS
);*/

/*CREATE TABLE CURS_PROF (
    PR_ID INT, -- Идентификатор профессора
    CURS_ID INT, -- Идентификатор курса
    PRIMARY KEY (PR_ID, CURS_ID), -- Составной первичный ключ
    FOREIGN KEY (PR_ID) REFERENCES PROFESOR(PR_ID), -- Связь с таблицей PROFESOR
    FOREIGN KEY (CURS_ID) REFERENCES CURS(CURS_ID) -- Связь с таблицей CURS
);*/

-- 6
/*CREATE INDEX idx_anul ON STUDENT (ANUL);*/

-- 7
/*CREATE INDEX idx_data_exam ON NOTE_EXAM (DATA_EXAM);*/

-- 8
/*INSERT INTO CURS (CURS_ID, CURS_DEN, ORE, SEMESTRU)
VALUES (201, 'Algebra', 72, 4);*/

-- 9.0
/*INSERT INTO UNIVERSITATE (UNIV_ID, UNIV_DEN, RATING, ORAS)
VALUES (10, 'USB', 296, 'Bălți');*/
-- 9
/*INSERT INTO STUDENT (ST_ID, NUME, PRENUME, ANUL, ORAS, UNIV_ID)
VALUES (11, 'Osman', 'Nicolai', 1, 'Bălți', 10);*/

-- 10
/*DELETE FROM NOTE_EXAM
WHERE ST_ID = 100;*/

-- 11
/*UPDATE UNIVERSITATE
SET RATING = RATING + 5
WHERE ORAS = 'Cahul';*/

-- 12
/*UPDATE STUDENT
SET ORAS = 'Bălți'
WHERE NUME = 'Popescu';*/

-- 13
/*CREATE TABLE STUDENTI (
    ST_ID INT PRIMARY KEY, 
    NUME VARCHAR(50) NOT NULL,  
    PRENUME VARCHAR(50) NOT NULL,  
    BURSA INT,  -- Стипендия
    ANUL INT NOT NULL, 
    ORAS VARCHAR(50),
    DATA_N DATE, 
    UNIV_ID INT,
    FOREIGN KEY (UNIV_ID) REFERENCES UNIVERSITATE(UNIV_ID) 
);*/

/*INSERT INTO STUDENTI (ST_ID, NUME, PRENUME, BURSA, ANUL, ORAS, DATA_N, UNIV_ID)
SELECT ST_ID, NUME, PRENUME, BURSA, ANUL, ORAS, DATA_N, UNIV_ID
FROM STUDENT
WHERE ORAS = 'Chișinău';*/

-- 14
/*INSERT INTO STUDENTI (ST_ID, NUME, PRENUME, BURSA, ANUL, ORAS, DATA_N, UNIV_ID)
SELECT S.ST_ID, S.NUME, S.PRENUME, S.BURSA, S.ANUL, S.ORAS, S.DATA_N, S.UNIV_ID
FROM STUDENT S
WHERE S.ST_ID IN (
    SELECT ST_ID
    FROM NOTE_EXAM
    WHERE NOTA >= 5
    GROUP BY ST_ID
    HAVING COUNT(*) > 5
);*/

-- 15
/*ALTER TABLE CURS_PROF
DROP FOREIGN KEY curs_prof_ibfk_2;

ALTER TABLE CURS_PROF
ADD CONSTRAINT curs_prof_ibfk_2
FOREIGN KEY (CURS_ID) REFERENCES CURS(CURS_ID)
ON DELETE CASCADE;*/

/*DELETE FROM CURS
WHERE CURS_ID NOT IN (
    SELECT CURS_ID
    FROM NOTE_EXAM
    WHERE NOTA IS NOT NULL
);*/

-- 16
/*UPDATE STUDENT
SET BURSA = BURSA * 1.2
WHERE ST_ID IN (
    SELECT ST_ID
    FROM NOTE_EXAM
    GROUP BY ST_ID
    HAVING SUM(NOTA) > 50
);*/


-- 17
/*SELECT * FROM STUDENT;*/

-- 18 
/*SELECT DISTINCT ORAS
FROM student;*/

-- 19. Вывести имя и фамилию студентов с фамилией "Petrov"
/*SELECT NUME, PRENUME
FROM STUDENT
WHERE NUME = 'Petrov';*/

-- 20. Вывести список студентов из третьего года обучения со стипендией
/*SELECT NUME, PRENUME
FROM STUDENT
WHERE ANUL = 3 AND BURSA > 0;*/

-- 21. Вывести идентификатор курса, его название, семестр, в котором он преподается, и количество часов
/*SELECT CURS_ID, CURS_DEN, SEMESTRU, ORE
FROM curs;*/
 
-- 22. Вывести все записи из таблицы NOTE_EXAM для курсов с идентификатором 12
/*INSERT INTO CURS (CURS_ID, CURS_DEN, ORE, SEMESTRU)
VALUES (12, 'Biologie', 48, 3);*/

/*INSERT INTO NOTE_EXAM (EXAM_ID, ST_ID, CURS_ID, NOTA, DATA_EXAM)
VALUES
(1, 10, 12, 8, '2023-06-15'),
(2, 6, 12, 7, '2023-06-20'),
(3, 12, 12, 9, '2023-06-25');*/

/*SELECT *
FROM NOTE_EXAM
WHERE CURS_ID = 12;*/

-- 23. Вывести информацию из таблицы STUDENT, отсортировав по ANUL, PRENUME, NUME, BURSA
/*SELECT ANUL, PRENUME, NUME, BURSA
FROM STUDENT
ORDER BY ANUL, PRENUME, NUME, BURSA;*/

-- 24. Вывести название курса и количество часов для курсов, преподаваемых в 4 семестре
/*INSERT INTO CURS (CURS_ID, CURS_DEN, ORE, SEMESTRU)
VALUES
(101, 'Algebra', 72, 4),
(102, 'Istoria Artelor', 56, 4),
(103, 'Chimie Organica', 48, 4),
(104, 'Matematica Aplicata', 60, 4);*/

/*SELECT CURS_DEN, ORE
FROM CURS
WHERE SEMESTRU = 4;*/

-- 25. Вывести уникальные оценки студентов из таблицы NOTE_EXAM, избегая дублирования
/*SELECT DISTINCT NOTA
FROM NOTE_EXAM;*/

-- 26. Вывести имена студентов, которые учатся на 3-м или выше году обучения
/*SELECT NUME, PRENUME
FROM STUDENT
WHERE ANUL >= 3;*/

-- 27. Вывести имя, фамилию и год обучения студентов, у которых стипендия больше 140
/*SELECT NUME, PRENUME, ANUL
FROM STUDENT
WHERE BURSA > 140;*/

-- 28. Вывести список курсов, которые планировались более чем на 30 часов
/*SELECT CURS_DEN
FROM CURS
WHERE ORE > 30;*/

-- 29. Вывести список университетов, рейтинг которых превышает 300
/*SELECT UNIV_DEN
FROM UNIVERSITATE
WHERE RATING > 300;*/

-- 30. Отобразить имя, фамилию и год обучения студентов, у которых стипендия ≥ 100 и которые из Бельц.
/*SELECT NUME, PRENUME, ANUL
FROM STUDENT
WHERE BURSA >= 100 AND ORAS = 'Bălți';*/

-- 31. Вывести имена студентов с оценками 9 и 10
/*SELECT NUME
FROM STUDENT
WHERE ST_ID IN (
    SELECT ST_ID
    FROM NOTE_EXAM
    WHERE NOTA IN (9, 10)
);*/

-- 32. Вывести курсы с количеством часов более 30, но менее 40
/*SELECT CURS_DEN
FROM CURS
WHERE ORE > 30 AND ORE < 40;*/

-- 33. Вывести информацию о студентах, чьи имена начинаются на "P"
/*SELECT *
FROM STUDENT
WHERE NUME LIKE 'P%';*/

-- 34. Вывести код курсов экзаменов, которые прошли между 10 и 20 января 1999 года
/*INSERT INTO CURS (CURS_ID, CURS_DEN, ORE, SEMESTRU)
VALUES
(43, 'Matematica', 56, 3);*/
/*INSERT INTO NOTE_EXAM (EXAM_ID, ST_ID, CURS_ID, NOTA, DATA_EXAM)
VALUES
(301, 10, 12, 9, '1999-01-10'),
(302, 6, 22, 8, '1999-01-15'),
(303, 32, 43, 7, '1999-01-20');*/

/*SELECT DISTINCT CURS_ID
FROM NOTE_EXAM
WHERE DATA_EXAM BETWEEN '1999-01-10' AND '1999-01-20';*/

-- 35. Вывести информацию о курсах, на которых экзамены сдавали студенты с идентификаторами 12 и 32
/*SELECT DISTINCT CURS.*
FROM CURS
JOIN NOTE_EXAM ON CURS.CURS_ID = NOTE_EXAM.CURS_ID
WHERE NOTE_EXAM.ST_ID IN (12, 32);*/

-- 36. Вывести список курсов, названия которых начинаются на "I"
/*SELECT CURS_DEN
FROM CURS
WHERE CURS_DEN LIKE 'I%';*/

-- 37. Вывести информацию о студентах, чьи имена начинаются на "I" или "C"
/*SELECT *
FROM STUDENT
WHERE NUME LIKE 'I%' OR NUME LIKE 'C%';*/

-- 38. Вывести записи из таблицы NOTE_EXAM, где отсутствует значение для поля NOTA
/*SELECT *
FROM NOTE_EXAM
WHERE NOTA IS NULL;*/

-- 39. Вывести записи из таблицы NOTE_EXAM, где значение поля NOTA указано
/*SELECT *
FROM NOTE_EXAM
WHERE NOTA IS NOT NULL;*/

-- 40. Вывести информацию из таблицы STUDENT в одну строку с разделением через запятую и в верхнем регистре
/*SELECT CONCAT(ST_ID, ',', UPPER(NUME), ',', UPPER(PRENUME), ',', BURSA, ',', ANUL, ',', UPPER(ORAS), ',', DATA_N, ',', UNIV_ID) AS INFO
FROM student;*/

-- 41. Вывести информацию из таблицы STUDENT в следующем формате:"O.CASTA; localitatea – BĂLȚI; născută la 8.12.1981"
/*SELECT CONCAT(UPPER(LEFT(NUME, 1)), '.', UPPER(PRENUME), '; localitatea – ', UPPER(ORAS), '; născută la ', DATE_FORMAT(DATA_N, '%d.%m.%Y')) AS INFO
FROM STUDENT
WHERE NUME = 'Casta' AND PRENUME = 'Olga';*/

-- 42. Вывести информацию из таблицы STUDENT в следующем формате:"o.casta; localitatea – bălți; născută la 8-dec-1981"
/*SELECT CONCAT(LOWER(LEFT(NUME, 1)), '.', LOWER(PRENUME), '; localitatea – ', LOWER(ORAS), '; născută la ', DATE_FORMAT(DATA_N, '%d-%b-%Y')) AS INFO
FROM STUDENT
WHERE NUME = 'Casta' AND PRENUME = 'Olga';*/

-- 43. Вывести информацию из таблицы STUDENT в следующем формате: "Olga Casta a fost născută în anul 1981"
/*SELECT CONCAT(PRENUME, ' ', NUME, ' a fost născută în anul ', YEAR(DATA_N)) AS INFO
FROM STUDENT
WHERE NUME = 'Casta' AND PRENUME = 'Olga';*/

-- 44. Добавить условие к запросу из задания 43: студенты должны быть на 1, 2 или 4 году обучения
/*SELECT CONCAT(PRENUME, ' ', NUME, ' a fost născută în anul ', YEAR(DATA_N)) AS INFO
FROM STUDENT
WHERE NUME = 'Casta' AND PRENUME = 'Olga' AND ANUL IN (1, 2, 4);*/

-- 45. Вывести имена студентов со стипендией, равной 100, умноженной на 100
/*SELECT NUME, PRENUME, BURSA * 100 AS BURSA_EXTINSĂ
FROM STUDENT
WHERE BURSA = 100;*/

-- 46. Вывести информацию из таблицы UNIVERSITATE в следующем формате:"Cod-10; USB-or.Bălți; Reiting-296"
/*SELECT CONCAT('Cod-', UNIV_ID, '; ', UNIV_DEN, '-or.', ORAS, '; Reiting-', RATING) AS INFO
FROM UNIVERSITATE;*/

-- 47. Добавить условие: значение рейтинга округляется до первого символа
/*SELECT CONCAT('Cod-', UNIV_ID, '; ', UNIV_DEN, '-or.', ORAS, '; Reiting-', LEFT(RATING, 1)) AS INFO
FROM UNIVERSITATE;*/

-- 48. Определить среднюю оценку всех студентов
/*SELECT AVG(NOTA) AS AVERAGE_NOTA
FROM NOTE_EXAM;*/

-- 49. Определить количество студентов с сохраненной информацией (не NULL) в таблице STUDENT
/*SELECT COUNT(*) AS STUDENT_COUNT
FROM STUDENT
WHERE NUME IS NOT NULL AND PRENUME IS NOT NULL AND DATA_N IS NOT NULL;*/

-- 50. Определить максимальную оценку, полученную каждым студентом
/*SELECT ST_ID, MAX(NOTA) AS MAX_NOTA
FROM NOTE_EXAM
GROUP BY ST_ID;*/

-- 51. Определить количество студентов, сдавших экзамен по курсу с идентификатором 20
/*SELECT COUNT(DISTINCT ST_ID) AS STUDENT_COUNT
FROM NOTE_EXAM
WHERE CURS_ID = 20;*/

-- 52. Подсчитать количество различных курсов из таблицы NOTE_EXAM
/*SELECT COUNT(DISTINCT CURS_ID) AS DISTINCT_COURSES
FROM NOTE_EXAM;*/

-- 53. Вывести идентификатор студента и его минимальную оценку
/*SELECT ST_ID, MIN(NOTA) AS MIN_NOTA
FROM NOTE_EXAM
GROUP BY ST_ID;*/

-- 54. Вывести первого студента (по алфавиту), чье имя начинается с "I"
/*SELECT *
FROM STUDENT
WHERE NUME LIKE 'I%'
ORDER BY NUME ASC
LIMIT 1;*/

-- 55. Вывести название курса и максимальный семестр, в котором он преподавался
/*SELECT CURS_DEN, MAX(SEMESTRU) AS MAX_SEMESTRU
FROM CURS
GROUP BY CURS_DEN;*/

-- 56. Вывести дату проведения экзамена и количество студентов, сдавших этот экзамен
/*SELECT DATA_EXAM, COUNT(DISTINCT ST_ID) AS STUDENT_COUNT
FROM NOTE_EXAM
GROUP BY DATA_EXAM;*/

-- 57. Вывести среднюю оценку для каждого года обучения
/*SELECT ANUL, AVG(NOTA) AS AVERAGE_NOTA
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
GROUP BY ANUL;*/

-- 58. Определить среднюю оценку для каждого студента
/*SELECT STUDENT.ST_ID, STUDENT.NUME, STUDENT.PRENUME, AVG(NOTA) AS AVERAGE_NOTA
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
GROUP BY STUDENT.ST_ID, STUDENT.NUME, STUDENT.PRENUME;*/

-- 59. Определить среднюю оценку для каждого экзамена
/*SELECT CURS_ID, AVG(NOTA) AS AVERAGE_NOTA
FROM NOTE_EXAM
GROUP BY CURS_ID;*/

-- 60. Определить для каждого экзамена количество студентов, которые его сдали
/*SELECT CURS_ID, COUNT(DISTINCT ST_ID) AS STUDENT_COUNT
FROM NOTE_EXAM
GROUP BY CURS_ID;*/

-- 61. Определить для каждого года обучения количество курсов, которые изучались в течение этого года
/*SELECT ANUL, COUNT(DISTINCT CURS_ID) AS COURSE_COUNT
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
GROUP BY ANUL;*/

-- 62. Предположим, что стипендия была увеличена на 20%. Вывести идентификатор студента, его имя и увеличенную стипендию, упорядочив:
-- a) По стипендии:
/*SELECT ST_ID, NUME, BURSA * 1.2 AS BURSA_MARITĂ
FROM STUDENT
ORDER BY BURSA_MARITĂ DESC;*/
-- b) В алфавитном порядке по имени студента:
/*SELECT ST_ID, NUME, BURSA * 1.2 AS BURSA_MARITĂ
FROM STUDENT
ORDER BY NUME ASC;*/

-- 63. Определить максимальную и минимальную оценку для каждого студента из таблицы NOTE_EXAM
/*SELECT ST_ID, MAX(NOTA) AS MAX_NOTA, MIN(NOTA) AS MIN_NOTA
FROM NOTE_EXAM
GROUP BY ST_ID;*/

-- 64. Вывести список курсов в порядке убывания семестра и возрастания количества часов
/*SELECT SEMESTRU, CURS_DEN, CURS_ID, ORE
FROM CURS
ORDER BY SEMESTRU DESC, ORE ASC;*/

-- 65. Рассчитать сумму оценок студентов за экзамены и представить результат в порядке убывания
/*SELECT STUDENT.ST_ID, STUDENT.NUME, SUM(NOTA) AS SUM_NOTA
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
GROUP BY STUDENT.ST_ID, STUDENT.NUME
ORDER BY SUM_NOTA DESC;*/

-- 66. Определить среднюю оценку, максимальную и минимальную для студентов
/*SELECT STUDENT.ST_ID, STUDENT.NUME, AVG(NOTA) AS AVG_NOTA, MAX(NOTA) AS MAX_NOTA, MIN(NOTA) AS MIN_NOTA
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
GROUP BY STUDENT.ST_ID, STUDENT.NUME
ORDER BY AVG_NOTA DESC;*/

-- 67. Вывести информацию о студентах с фамилией "Popescu", у которых отсутствует информация о стипендии
/*SELECT ST_ID, NUME, PRENUME, BURSA
FROM STUDENT
WHERE NUME = 'Popescu' AND BURSA IS NULL;*/

-- 68. Вывести имена студентов, которые сдали экзамен по курсу с идентификатором 101 с оценкой выше средней
/*UPDATE CURS
SET CURS_DEN = 'Informatica', ORE = 56, SEMESTRU = 1
WHERE CURS_ID = 101;*/

/*INSERT INTO STUDENT (ST_ID, NUME, PRENUME, BURSA, ANUL, ORAS, DATA_N, UNIV_ID)
VALUES
(301, 'Popescu', 'Ion', 150, 1, 'Bălți', '1982-12-03', 10),
(302, 'Ionescu', 'Ana', 200, 2, 'Cahul', '1981-01-12', 10),
(303, 'Marin', 'Elena', 250, 3, 'Chișinău', '1980-07-08', 22),
(304, 'Dumitrescu', 'Alex', 100, 4, 'Bălți', '1979-10-14', 10);*/

/*INSERT INTO NOTE_EXAM (EXAM_ID, ST_ID, CURS_ID, NOTA, DATA_EXAM)
VALUES
(401, 301, 101, 7, '2023-06-10'),
(402, 302, 101, 9, '2023-06-11'),
(403, 303, 101, 10, '2023-06-12'),
(404, 304, 101, 8, '2023-06-13');*/

/*SELECT STUDENT.NUME, STUDENT.PRENUME
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
WHERE NOTE_EXAM.CURS_ID = 101 AND NOTE_EXAM.NOTA > (
    SELECT AVG(NOTA)
    FROM NOTE_EXAM
);*/

-- 69. Вывести имена студентов, которые получили на курсе с идентификатором 102 оценку выше средней
/*INSERT INTO STUDENT (ST_ID, NUME, PRENUME, BURSA, ANUL, ORAS, DATA_N, UNIV_ID)
VALUES
(501, 'Popescu', 'Maria', 200, 2, 'Bălți', '1983-03-15', 10),
(502, 'Ionescu', 'Andrei', 150, 1, 'Chișinău', '1984-05-20', 22),
(503, 'Marin', 'Elena', 250, 3, 'Cahul', '1982-11-30', 32),
(504, 'Dumitrescu', 'Alex', 100, 4, 'Bălți', '1981-01-10', 10);*/

/*INSERT INTO NOTE_EXAM (EXAM_ID, ST_ID, CURS_ID, NOTA, DATA_EXAM)
VALUES
(501, 501, 102, 8, '2023-05-15'),
(502, 502, 102, 9, '2023-05-16'),
(503, 503, 102, 6, '2023-05-17'),
(504, 504, 102, 7, '2023-05-18');*/

/*SELECT STUDENT.NUME, STUDENT.PRENUME
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
WHERE NOTE_EXAM.CURS_ID = 102 AND NOTE_EXAM.NOTA > (
    SELECT AVG(NOTA)
    FROM NOTE_EXAM
);*/

-- 70. Вывести количество курсов, по которым сдавали экзамены студенты, сдавшие более 20 экзаменов
/*SELECT COUNT(DISTINCT CURS_ID) AS COURSE_COUNT
FROM NOTE_EXAM
WHERE ST_ID IN (
    SELECT ST_ID
    FROM NOTE_EXAM
    GROUP BY ST_ID
    HAVING COUNT(*) > 20
);*/

-- 71. Вывести имя и идентификатор студентов с максимальной стипендией в их городе
/*SELECT NUME, PRENUME, ST_ID
FROM STUDENT
WHERE BURSA = (
    SELECT MAX(BURSA)
    FROM STUDENT AS S
    WHERE S.ORAS = STUDENT.ORAS
);*/

-- 72. Вывести имя и идентификатор студентов, которые живут в городе без университета
/*SELECT NUME, PRENUME, ST_ID
FROM STUDENT
WHERE ORAS NOT IN (
    SELECT ORAS
    FROM UNIVERSITATE
);
*/

-- 73. Вывести имя и идентификатор студентов, которые живут в городе университета, где они учатся
/*SELECT NUME, PRENUME, ST_ID
FROM STUDENT
WHERE ORAS IN (
    SELECT ORAS
    FROM UNIVERSITATE
    WHERE UNIVERSITATE.UNIV_ID = STUDENT.UNIV_ID
);
*/

-- 74. Вывести имена студентов, которые получили хотя бы одну отрицательную оценку
/*SELECT DISTINCT NUME, PRENUME
FROM STUDENT
WHERE ST_ID IN (
    SELECT ST_ID
    FROM NOTE_EXAM
    WHERE NOTA < 5
);
*/

-- 75. Вывести идентификаторы курсов, где экзамен сдавали более одного студента
/*SELECT CURS_ID
FROM NOTE_EXAM
GROUP BY CURS_ID
HAVING COUNT(DISTINCT ST_ID) > 1;
*/


-- 76. Вывести идентификаторы студентов, которые сдавали более одного экзамена
/*SELECT ST_ID
FROM NOTE_EXAM
GROUP BY ST_ID
HAVING COUNT(*) > 1;
*/

-- 77. Вывести студентов, которые учатся в университетах с рейтингом больше 300
/* SELECT STUDENT.NUME, STUDENT.PRENUME
FROM STUDENT
JOIN UNIVERSITATE ON STUDENT.UNIV_ID = UNIVERSITATE.UNIV_ID
WHERE UNIVERSITATE.RATING > 300;
*/

-- 78. Список студентов, которые живут в городе с университетом, но не учатся в этом университете
/*SELECT NUME, PRENUME, ORAS
FROM STUDENT
WHERE ORAS IN (SELECT ORAS FROM UNIVERSITATE)
  AND UNIV_ID NOT IN (SELECT UNIV_ID FROM UNIVERSITATE WHERE ORAS = STUDENT.ORAS);
*/

-- 79. Список курсов, на которых экзамены сдавал только один студент
/*SELECT CURS.CURS_DEN
FROM CURS
JOIN NOTE_EXAM ON CURS.CURS_ID = NOTE_EXAM.CURS_ID
GROUP BY CURS.CURS_ID
HAVING COUNT(DISTINCT NOTE_EXAM.ST_ID) = 1;
*/

-- 80. Информация о студентах, которые учатся в университете своего города
/*SELECT NUME, PRENUME, ORAS
FROM STUDENT
WHERE UNIV_ID IN (SELECT UNIV_ID FROM UNIVERSITATE WHERE ORAS = STUDENT.ORAS);
*/

-- 81. Идентификаторы студентов, получивших хотя бы одну оценку 6 декабря 1999 года
/*INSERT INTO NOTE_EXAM (EXAM_ID, ST_ID, CURS_ID, NOTA, DATA_EXAM)
VALUES
(601, 501, 101, 8, '1999-12-06'),
(602, 502, 102, 7, '1999-12-06'),
(603, 503, 103, 9, '1999-12-06'),
(604, 504, 104, 6, '1999-12-06');*/

/*SELECT DISTINCT ST_ID
FROM NOTE_EXAM
WHERE DATA_EXAM = '1999-12-06';
*/
-- 82. Университеты с рейтингом выше, чем у университета в Бельцах
/*SELECT UNIV_DEN, RATING
FROM UNIVERSITATE
WHERE RATING > (
    SELECT MAX(RATING)
    FROM UNIVERSITATE
    WHERE ORAS = 'Bălți'
);*/

-- 83. Университеты с рейтингом, равным или выше рейтинга USB Бельцы:
/*SELECT UNIV_DEN, RATING
FROM UNIVERSITATE
WHERE RATING >= (SELECT RATING FROM UNIVERSITATE WHERE UNIV_DEN = 'USB');
*/

-- 84. Студенты, живущие в городе, где нет университета
/*SELECT NUME, PRENUME, ORAS
FROM STUDENT
WHERE ORAS NOT IN (SELECT ORAS FROM universitate);
*/

-- 85. Названия курсов с оценками выше всех оценок по курсу с идентификатором 105
/*UPDATE CURS
SET CURS_DEN = 'Chimie', ORE = 40, SEMESTRU = 2
WHERE CURS_ID = 105;*/

/*INSERT INTO CURS (CURS_ID, CURS_DEN, ORE, SEMESTRU)
VALUES
(201, 'Matematica', 60, 1),
(202, 'Fizica', 50, 2),
(203, 'Biologie', 45, 3);*/

/*INSERT INTO NOTE_EXAM (EXAM_ID, ST_ID, CURS_ID, NOTA, DATA_EXAM)
VALUES
(801, 501, 105, 7, '2023-06-15'), -- Оценка по курсу с CURS_ID=105
(802, 502, 201, 9, '2023-06-16'), -- Оценка выше, чем по CURS_ID=105
(803, 503, 202, 8, '2023-06-17'), -- Оценка выше, чем по CURS_ID=105
(804, 504, 203, 6, '2023-06-18'); -- Оценка ниже
*/

/*SELECT DISTINCT CURS.CURS_DEN
FROM CURS
JOIN NOTE_EXAM ON CURS.CURS_ID = NOTE_EXAM.CURS_ID
WHERE NOTE_EXAM.NOTA > (SELECT MAX(NOTA) FROM NOTE_EXAM WHERE CURS_ID = 105);
*/


-- 86. Вывести имена студентов, которые сдавали экзамен, и идентификаторы курсов, на которых они сдавали экзамен
/*SELECT STUDENT.NUME, STUDENT.PRENUME, NOTE_EXAM.CURS_ID
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID;
*/

-- 87. Вывести информацию о студентах, которые сдавали экзамен, и идентификаторы курсов
/*SELECT DISTINCT STUDENT.ST_ID, STUDENT.NUME, STUDENT.PRENUME, NOTE_EXAM.CURS_ID
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID;
*/

-- 88. Вывести имена всех студентов, которые пытались сдавать экзамен, и названия курсов
/*SELECT STUDENT.NUME, STUDENT.PRENUME, CURS.CURS_DEN
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
JOIN CURS ON NOTE_EXAM.CURS_ID = CURS.CURS_ID;
*/

-- 89. Вывести список курсов для каждого студента, который получил оценку 9 или 10
/*SELECT STUDENT.ST_ID, STUDENT.NUME, STUDENT.PRENUME, CURS.CURS_DEN
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
JOIN CURS ON NOTE_EXAM.CURS_ID = CURS.CURS_ID
WHERE NOTE_EXAM.NOTA IN (9, 10);
*/

-- 90. Вывести названия курсов для студентов, которые получили хорошие оценки (8, 9, 10), с указанием имени студента, названия курса и полученной оценки
/*SELECT STUDENT.NUME, STUDENT.PRENUME, CURS.CURS_DEN, NOTE_EXAM.NOTA
FROM STUDENT
JOIN NOTE_EXAM ON STUDENT.ST_ID = NOTE_EXAM.ST_ID
JOIN CURS ON NOTE_EXAM.CURS_ID = CURS.CURS_ID
WHERE NOTE_EXAM.NOTA IN (8, 9, 10);
*/

-- 91. Вывести университеты с рейтингом выше 300, а также максимальную стипендию студентов этих университетов
/*SELECT UNIVERSITATE.UNIV_DEN, MAX(STUDENT.BURSA) AS MAX_BURSA
FROM UNIVERSITATE
JOIN STUDENT ON UNIVERSITATE.UNIV_ID = STUDENT.UNIV_ID
WHERE UNIVERSITATE.RATING > 300
GROUP BY UNIVERSITATE.UNIV_DEN;
*/

-- 92. Вывести список студентов (в алфавитном порядке) с рейтингом университета, где они учатся. Включить студентов без указанного университета
/*SELECT STUDENT.NUME, STUDENT.PRENUME, COALESCE(UNIVERSITATE.RATING, 'Не указан') AS RATING
FROM STUDENT
LEFT JOIN UNIVERSITATE ON STUDENT.UNIV_ID = UNIVERSITATE.UNIV_ID
ORDER BY STUDENT.NUME, STUDENT.PRENUME;
*/

-- 93. Вывести имена студентов с одинаковыми именами
/*SELECT NUME, PRENUME, COUNT(*)
FROM STUDENT
GROUP BY NUME, PRENUME
HAVING COUNT(*) > 1;
*/

-- 94. Вывести все пары студентов, живущих в одном городе, за исключением повторов и самих себя
/*SELECT S1.NUME AS STUDENT1, S2.NUME AS STUDENT2, S1.ORAS
FROM STUDENT S1
JOIN STUDENT S2 ON S1.ORAS = S2.ORAS AND S1.ST_ID < S2.ST_ID
WHERE S1.NUME <> S2.NUME;
*/

-- 95. Вывести список всех пар университетов, находящихся в одном городе
/*SELECT U1.UNIV_DEN AS UNIVERSITY1, U2.UNIV_DEN AS UNIVERSITY2, U1.ORAS
FROM UNIVERSITATE U1
JOIN UNIVERSITATE U2 ON U1.ORAS = U2.ORAS AND U1.UNIV_ID < U2.UNIV_ID;
*/

-- 96. Вывести университеты с рейтингом, равным или выше рейтинга университета в Бельцах, и их города
/*SELECT UNIV_DEN,li_s1 ORAS
FROM UNIVERSITATE
WHERE RATING >= (SELECT MAX(RATING) FROM UNIVERSITATE WHERE ORAS = 'Bălți');
*/












