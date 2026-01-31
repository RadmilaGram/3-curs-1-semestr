-- 1. Не выполнится так как на предыдущих шагах мы таблицы angajati переименовали в personal
/*SELECT nume, id_functie, salariul AS sal
FROM Angajati;*/
-- 2. Запрос выполняется.
/*SELECT *
FROM Departamente;*/
-- 3. Нет, таблицы нет в базе данных.
/*SELECT *
FROM Salariu;*/
-- 4. Исправлены ошибки.
/*SELECT id_angajat, nume, 
       salariu * 12 AS 'salariu anual'
FROM personal;*/
-- 5.
-- Отобразить структуру таблицы:
/*DESCRIBE Departamente;
-- Отобразить содержимое таблицы:
SELECT * FROM Departamente;*/
-- 6.
/*DESCRIBE personal;*/
-- 7.
/*SELECT id_angajat AS 'Identificatorul', 
       nume AS 'Numele angajatului', 
       id_functie AS 'Funcția', 
       data_angajare AS 'Lucrează din'
FROM Personal;*/
-- 8.Отобразить данные с новыми названиями столбцов
/*SELECT id_angajat AS 'Identificatorul', 
       nume AS 'Numele angajatului', 
       id_functie AS 'Funcția', 
       data_angajare AS 'Data angajarii'
FROM personal;*/
-- 9. Список идентификаторов функций с и без дубликатов
-- С дубликатами:
/*SELECT id_functie 
FROM personal;*/

/*-- Без дубликатов:
SELECT DISTINCT id_functie 
FROM personal;*/
-- 10. Конкатенация имени и функции с разделителем
/*SELECT nume || ', ' || id_functie AS 'Angajat și funcție'
FROM personal;*/
-- 11. Отобразить все данные, разделенные запятыми
/*SELECT CONCAT(id_angajat, ',', nume, ',', prenume, ',', id_functie, ',', data_angajare) AS 'Informatii complete'
FROM personal;*/
-- 12. Выбрать всех сотрудников из таблицы
/*SELECT * FROM personal;*/
-- 13. Выбрать определенные столбцы из таблицы
/*SELECT id_angajat, nume, prenume, id_functie 
FROM personal;*/
-- 14.Отобразить имена и зарплаты сотрудников с зарплатой > 12000$
/*SELECT nume AS 'Nume', salariu AS 'Salariu'
FROM personal
WHERE salariu > 12000;*/
-- 15. Отобразить имя сотрудника и номер департамента для сотрудника с ID = 176
/*SELECT nume AS 'Nume', id_departament AS 'Numar Departament'
FROM personal
WHERE id_angajat = 176;*/
-- 16. Отобразить имена и зарплаты сотрудников, чья зарплата не в диапазоне 5000–12000$
/*SELECT nume AS 'Nume', salariu AS 'Salariu'
FROM personal
WHERE salariu NOT BETWEEN 5000 AND 12000;*/
-- 17. Отобразить имя, функцию и дату найма сотрудников с именами Matos и Taylor. Сортировать по дате
/*SELECT nume AS 'Nume', id_functie AS 'Funcție', data_angajare AS 'Data Angajarii'
FROM personal
WHERE nume IN ('Matos', 'Taylor')
ORDER BY data_angajare ASC;*/
-- 18. Отобразить имена и идентификаторы департаментов сотрудников из департаментов 20 и 50. Сортировать по имени
/*SELECT nume AS 'Nume', id_departament AS 'Departament'
FROM personal
WHERE id_departament IN (20, 50)
ORDER BY nume ASC;*/
-- 19. Изменить lab5_ex12.sql для вывода сотрудников с зарплатой 5000–12000$ в департаментах 20 или 50
/*SELECT nume AS 'Angajat', salariu AS 'Salariu_lunar'
FROM personal
WHERE salariu BETWEEN 5000 AND 12000
  AND id_departament IN (20, 50);*/
-- 20. Отобразить имя, функцию и дату найма сотрудников, нанятых с 20 февраля 1987 по 1 мая 1989
/*SELECT nume AS 'Nume', id_functie AS 'Funcție', data_angajare AS 'Data Angajarii'
FROM 
WHERE data_angajare BETWEEN '1987-02-20' AND '1989-05-01'
ORDER BY data_angajare ASC;*/


-- 21. Сотрудники, нанятые в 1994 году (две версии)
-- LIKE
/*SELECT nume AS 'Nume', data_angajare AS 'Data Angajarii'
FROM Personal
WHERE data_angajare LIKE '1994%';*/
-- YEAR()
/*SELECT nume AS 'Nume', data_angajare AS 'Data Angajarii'
FROM Personal
WHERE YEAR(data_angajare) = 1994;*/
-- 22. Сотрудники без менеджера
/*SELECT nume AS 'Nume', id_functie AS 'Funcție'
FROM Personal
WHERE id_manager IS NULL;*/
-- 23. Сотрудники, получающие комиссионные, отсортированные по зарплате и комиссиям
/*SELECT nume AS 'Nume', salariu AS 'Salariu', comision AS 'Comision'
FROM Personal
WHERE comision IS NOT NULL
ORDER BY salariu DESC, comision DESC;*/
-- 24. Удаление WHERE из предыдущего запроса
/*SELECT nume AS 'Nume', salariu AS 'Salariu', comision AS 'Comision'
FROM Personal
ORDER BY salariu DESC, comision DESC;*/
-- 25. Сотрудники с именами, содержащими буквы "a" и "e"
/*SELECT nume AS 'Nume'
FROM personal
WHERE nume LIKE '%a%' AND nume LIKE '%e%';*/
-- 26. Сотрудники с третьей буквой "A" в имени
/*SELECT nume AS 'Nume'
FROM Personal
WHERE nume LIKE '__a%';*/
-- 27. Сотрудники с двумя буквами "L" в имени, из департамента 30 или с менеджером 101
/*SELECT nume AS 'Nume'
FROM Personal
WHERE nume LIKE '%l%l%' AND (id_departament = 30 OR id_manager = 101);*/
-- 28. Сотрудники с функцией "clerk" или "rep" и зарплатой не равной 2500, 3500, 7000
/*SELECT nume AS 'Nume', id_functie AS 'Funcție', salariu AS 'Salariu'
FROM Personal
WHERE (id_functie LIKE '%clerk%' OR id_functie LIKE '%rep%')
  AND salariu NOT IN (2500, 3500, 7000);*/
-- 29. Сотрудники с зарплатой больше, чем пять раз превышающей комиссионные  
/*SELECT nume AS 'Nume', salariu AS 'Salariu', comision AS 'Comision'
FROM Personal
WHERE salariu > 5 * comision;*/
-- 30. Сотрудники с функцией, содержащей "CLERK"
/*SELECT nume AS 'Nume', id_functie AS 'Funcție'
FROM Personal
WHERE id_functie LIKE '%CLERK%';*/
-- 31. Заказы, завершенные сотрудником с ID 161 
/*SELECT *
FROM comenzi
WHERE id_angajat = 161;*/
-- 32. Онлайн-заказы после 1 января 2000 года
/*SELECT *
FROM Comenzi
WHERE DATA > '2000-01-01' AND MODALITATE = 'online';*/  
-- 33
/*SELECT 
    p.ID_ANGAJAT AS 'ID Angajat',
    p.NUME AS 'Nume',
    p.PRENUME AS 'Prenume',
    p.ID_MANAGER AS 'ID Manager',
    p.ID_DEPARTAMENT AS 'ID Departament',
    d.DENUMIRE_DEPARTAMENT AS 'Denumire Departament'
FROM 
    Personal p
INNER JOIN 
    Departamente d
ON 
    p.ID_DEPARTAMENT = d.ID_DEPARTAMENT;*/
-- 34. Текущая дата в разных форматах
-- Текущая дата в стандартном формате:
/*SELECT CURRENT_DATE() AS 'Data curentă';*/

-- Текущая дата и время:
/*SELECT NOW() AS 'Data și ora curentă';*/

-- Текущая дата в формате DD-MM-YYYY:
/*SELECT DATE_FORMAT(CURRENT_DATE(), '%d-%m-%Y') AS 'Format DD-MM-YYYY';*/

-- Текущая дата в формате YYYY/MM/DD:
/*SELECT DATE_FORMAT(CURRENT_DATE(), '%Y/%m/%d') AS 'Format YYYY/MM/DD';*/

-- 35. Отображение ID, имени, зарплаты и увеличенной зарплаты на 15,5%
/*SELECT 
    ID_ANGAJAT AS 'ID Angajat', 
    NUME AS 'Nume', 
    SALARIU AS 'Salariu', 
    ROUND(SALARIU * 1.155, 0) AS 'Salariu majorat'
FROM Personal;*/

-- 36. Добавление поля разницы между старой и новой зарплатой
/*SELECT 
    ID_ANGAJAT AS 'ID Angajat', 
    NUME AS 'Nume', 
    SALARIU AS 'Salariu', 
    ROUND(SALARIU * 1.155, 0) AS 'Salariu majorat', 
    ROUND(SALARIU * 1.155, 0) - SALARIU AS 'Majorare'
FROM Personal;*/

-- 37. Сотрудники с именами на "J", "A" или "M", и длина их имен
/*SELECT 
    UPPER(NUME) AS 'Nume Majuscule', 
    LENGTH(NUME) AS 'Lungime Nume'
FROM Personal
WHERE NUME LIKE 'J%' OR NUME LIKE 'A%' OR NUME LIKE 'M%'
ORDER BY NUME;*/

-- 38. Формирование строки с текущей и желаемой зарплатой
/*SELECT 
    CONCAT(PRENUME, ' ', NUME, ' câștigă ', SALARIU, ' lunar dar dorește ', SALARIU * 3, '.') AS 'Salariu ideal'
FROM Personal;*/

-- 39. Имена с преобразованием регистра и длина имен
-- like
/*SELECT 
    CONCAT(UPPER(SUBSTRING(PRENUME, 1, 1)), LOWER(SUBSTRING(PRENUME, 2))) AS 'Prenume',
    UPPER(NUME) AS 'Nume Majuscule',
    LENGTH(NUME) AS 'Lungime Nume'
FROM Personal
WHERE NUME LIKE 'J%' OR NUME LIKE 'M%' OR NUME LIKE '__A%'
ORDER BY LENGTH(NUME) DESC;*/
-- SUBSTR
/*SELECT 
    CONCAT(UPPER(SUBSTRING(PRENUME, 1, 1)), LOWER(SUBSTRING(PRENUME, 2))) AS 'Prenume',
    UPPER(NUME) AS 'Nume Majuscule',
    LENGTH(NUME) AS 'Lungime Nume'
FROM Personal
WHERE SUBSTR(NUME, 1, 1) IN ('J', 'M') OR SUBSTR(NUME, 3, 1) = 'A'
ORDER BY LENGTH(NUME) DESC;*/

-- 40. Сотрудники с именем "Steven" (нечувствительно к регистру и пробелам)
/*SELECT 
    ID_ANGAJAT AS 'ID Angajat', 
    NUME AS 'Nume', 
    ID_DEPARTAMENT AS 'ID Departament'
FROM Personal
WHERE TRIM(LOWER(PRENUME)) = 'steven';*/

-- 41. Сотрудники, чьи имена заканчиваются на 'e'
/*SELECT 
    ID_ANGAJAT AS 'Cod Angajat', 
    NUME AS 'Nume', 
    LENGTH(NUME) AS 'Lungime Nume', 
    INSTR(NUME, 'a') AS 'Pozitie A'
FROM Personal
WHERE NUME LIKE '%e';*/

-- 42. Сотрудники, которые проработали целое число недель
/*SELECT 
    ID_ANGAJAT AS 'Cod Angajat', 
    NUME AS 'Nume', 
    FLOOR(DATEDIFF(CURDATE(), DATA_ANGAJARE) / 7) AS 'Numar de Saptamani'
FROM Personal
WHERE DATEDIFF(CURDATE(), DATA_ANGAJARE) % 7 = 0;*/

-- 43. Сотрудники с увеличенной зарплатой
/*SELECT 
    ID_ANGAJAT AS 'Cod Angajat', 
    NUME AS 'Nume', 
    SALARIU AS 'Salariu', 
    ROUND(SALARIU * 1.15, 2) AS 'Salariu Nou', 
    ROUND(ROUND(SALARIU * 1.15, 2) / 100, 0) AS 'Numar Sute'
FROM Personal
WHERE SALARIU % 1000 != 0;*/

-- 44. Сотрудники, которые получают комиссионные
/*SELECT 
    NUME AS 'Nume Angajat', 
    RPAD(DATA_ANGAJARE, 30, ' ') AS 'Data Angajarii'
FROM Personal
WHERE COMISION IS NOT NULL;*/

-- 45. Продолжительность работы в месяцах
/*SELECT 
    NUME AS 'Nume', 
    CEIL(PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM DATA_ANGAJARE))) AS 'Months Worked'
FROM Personal
ORDER BY `Months Worked` DESC;*/

-- 46. Дата через 30 дней
/*SELECT 
    DATE_ADD(CURDATE(), INTERVAL 30 DAY) AS 'Data Peste 30 Zile';*/

-- 47. Количество дней до конца года
/*SELECT 
    DATEDIFF(LAST_DAY(CONCAT(YEAR(CURDATE()), '-12-31')), CURDATE()) AS 'Zile Pana la Sfarsitul Anului';*/

-- 48. a) Дата через 12 часов
/*SELECT 
    DATE_ADD(NOW(), INTERVAL 12 HOUR) AS 'Data Peste 12 Ore';*/
-- b) Дата через 5 минут
/*SELECT 
    DATE_ADD(NOW(), INTERVAL 5 MINUTE) AS 'Data Peste 5 Minute';*/

-- 49. Первая понедельник через 6 месяцев после найма
/*SELECT 
    CONCAT(PRENUME, ' ', NUME) AS 'Angajat', 
    DATA_ANGAJARE AS 'Data Angajarii', 
    DATE_ADD(
        DATE_ADD(DATA_ANGAJARE, INTERVAL 6 MONTH), 
        INTERVAL (CASE WHEN WEEKDAY(DATE_ADD(DATA_ANGAJARE, INTERVAL 6 MONTH)) <= 1 
                       THEN 1 - WEEKDAY(DATE_ADD(DATA_ANGAJARE, INTERVAL 6 MONTH)) 
                       ELSE 8 - WEEKDAY(DATE_ADD(DATA_ANGAJARE, INTERVAL 6 MONTH)) END) DAY
    ) AS 'Negociere'
FROM Personal;*/

-- 50. Количество месяцев с даты найма
/*SELECT 
    NUME AS 'Nume', 
    ROUND(PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM DATA_ANGAJARE)), 0) AS 'Luni Lucrate'
FROM Personal
ORDER BY `Luni Lucrate` DESC;*/

-- 51. День недели, в который началась работа
/*SELECT 
    NUME AS 'Nume', 
    DATA_ANGAJARE AS 'Data Angajarii', 
    DAYNAME(DATA_ANGAJARE) AS 'Zi'
FROM Personal
ORDER BY FIELD(DAYNAME(DATA_ANGAJARE), 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');*/

-- 52. Сотрудники и их комиссионные (или сообщение "Fara comision")
/*SELECT 
    NUME AS 'Nume', 
    IFNULL(CONCAT(COMISION, ' $'), 'Fara comision') AS 'Comision'
FROM Personal;*/

-- 53. Сотрудники с доходом более 10,000$
/*SELECT 
    NUME AS 'Nume', 
    SALARIU AS 'Salariu', 
    IFNULL(COMISION, 0) AS 'Comision', 
    (SALARIU + IFNULL(COMISION, 0)) AS 'Venit Lunar'
FROM Personal
WHERE (SALARIU + IFNULL(COMISION, 0)) > 10000;*/

-- 54. Зарплата после увеличения с использованием CASE
/*SELECT 
    NUME AS 'Nume', 
    ID_FUNCTIE AS 'Cod Functie', 
    SALARIU AS 'Salariu', 
    CASE 
        WHEN ID_FUNCTIE = 'IT_PROG' THEN SALARIU * 1.20
        WHEN ID_FUNCTIE = 'SA_REP' THEN SALARIU * 1.25
        WHEN ID_FUNCTIE = 'SA_MAN' THEN SALARIU * 1.35
        ELSE SALARIU
    END AS 'Salariu Renegociat'
FROM Personal;*/

-- 55. необходимо вывести сотрудников, не работающих в отделе IT_PROG и имеющих зарплату меньше, чем любая зарплата сотрудников из отдела IT_PROG, используйте оператор ANY.
/*SELECT 
    ID_ANGAJAT, 
    PRENUME, 
    ID_FUNCTIE, 
    SALARIU
FROM Personal
WHERE ID_FUNCTIE != 'IT_PROG'
  AND SALARIU < ANY (
      SELECT SALARIU 
      FROM Personal
      WHERE ID_FUNCTIE = 'IT_PROG'
  );*/

-- 56. необходимо отобразить сотрудников, не работающих в отделе IT_PROG, и имеющих зарплату меньше, чем каждая зарплата сотрудников из отдела IT_PROG, используйте оператор ALL.
/*SELECT 
    ID_ANGAJAT, 
    PRENUME, 
    ID_FUNCTIE, 
    SALARIU
FROM Personal
WHERE ID_FUNCTIE != 'IT_PROG'
  AND SALARIU < ALL (
      SELECT SALARIU 
      FROM Personal
      WHERE ID_FUNCTIE = 'IT_PROG'
  );*/

-- 57. Выбрать заказы, завершенные сотрудниками
/*SELECT 
    c.NR_COMANDA AS 'Număr Comandă', 
    c.DATA AS 'Data Comenzii', 
    p.ID_ANGAJAT AS 'ID Angajat', 
    p.NUME AS 'Nume Angajat', 
    c.STARE_COMANDA AS 'Stare Comandă'
FROM Comenzi c
INNER JOIN Personal p
ON c.ID_ANGAJAT = p.ID_ANGAJAT
WHERE c.STARE_COMANDA = 1;*/

-- 58. Выбрать заказы сотрудника Greene, выполненные в ноябре
/*SELECT 
    c.NR_COMANDA AS 'Număr Comandă', 
    c.DATA AS 'Data Comenzii', 
    p.NUME AS 'Nume Angajat', 
    c.STARE_COMANDA AS 'Stare Comandă'
FROM Comenzi c
INNER JOIN Personal p
ON c.ID_ANGAJAT = p.ID_ANGAJAT
WHERE p.NUME = 'Greene'
  AND MONTH(c.DATA) = 11
  AND c.STARE_COMANDA = 1;
*/

-- 59. Вычислить стоимость каждого продукта и отобразить детали
/*SELECT 
    p.DENUMIRE_PRODUS AS 'Denumire Produs', 
    p.PRET AS 'Preț', 
    d.CANTITATE AS 'Cantitate', 
    (d.CANTITATE * p.PRET) AS 'Valoare'
FROM Produse p
INNER JOIN DetaliiComenzi d
ON p.ID_PRODUS = d.ID_PRODUS;*/

-- 60. Выбрать продукты с общей стоимостью от 1000 до 2000
/*SELECT 
    p.DENUMIRE_PRODUS AS 'Denumire Produs', 
    r.PRET AS 'Preț', 
    r.CANTITATE AS 'Cantitate', 
    (r.CANTITATE * r.PRET) AS 'Valoare'
FROM rand_comenzi r
INNER JOIN Produse p
ON r.ID_PRODUS = p.ID_PRODUS
WHERE (r.CANTITATE * r.PRET) BETWEEN 1000 AND 2000;*/

-- 61. Показать ID продукта, название продукта и количество, даже если они не были заказаны (внешнее соединение)
/*SELECT 
    p.ID_PRODUS AS 'ID Produs',
    p.DENUMIRE_PRODUS AS 'Denumire Produs',
    COALESCE(r.CANTITATE, 0) AS 'Cantitate'
FROM Produse p
LEFT JOIN rand_comenzi r
ON p.ID_PRODUS = r.ID_PRODUS;*/

-- 62. Показать имя каждого сотрудника и имя его непосредственного начальника (соединение с той же таблицей)
/*SELECT 
    e1.NUME AS 'Angajat',
    e2.NUME AS 'Manager'
FROM Personal e1
LEFT JOIN Personal e2
ON e1.ID_MANAGER = e2.ID_ANGAJAT;*/

-- 63. Показать сотрудников, работающих в том же отделе, что и сотрудник Smith
/*SELECT 
    NUME 
FROM Personal
WHERE ID_DEPARTAMENT IN (
    SELECT ID_DEPARTAMENT 
    FROM Personal
    WHERE NUME = 'Smith'
);*/

-- 64. Показать продукты с самой низкой ценой за единицу
/*SELECT 
    DENUMIRE_PRODUS, PRET_LISTA
FROM Produse
WHERE PRET_LISTA = (
    SELECT MIN(PRET_LISTA) 
    FROM Produse
);*/

-- 65. Показать имя сотрудника, код и название отдела для всех сотрудников
/*SELECT 
    p.NUME AS 'Nume Angajat',
    d.ID_DEPARTAMENT AS 'Cod Departament',
    d.DENUMIRE_DEPARTAMENT AS 'Nume Departament'
FROM Personal p
INNER JOIN Departamente d
ON p.ID_DEPARTAMENT = d.ID_DEPARTAMENT;*/

-- 66. Показать названия должностей, которые есть в отделе 30
/*SELECT DISTINCT 
    ID_FUNCTIE
FROM Personal
WHERE ID_DEPARTAMENT = 30;*/

-- 67. Показать имя сотрудника, название отдела и местоположение для сотрудников, получающих комиссию
/*SELECT 
    p.NUME AS 'Nume Angajat',
    d.DENUMIRE_DEPARTAMENT AS 'Departament',
    CONCAT(l.ADRESA, ', ', l.ORAS, ', ', l.ZONA, ', ', l.ID_TARA) AS 'Locatie'
FROM Personal p
INNER JOIN Departamente d
ON p.ID_DEPARTAMENT = d.ID_DEPARTAMENT
INNER JOIN Locatii l
ON d.ID_LOCATIE = l.ID_LOCATIE
WHERE p.COMISION IS NOT NULL;*/

-- 68. Показать имя сотрудника и название отдела для сотрудников, у которых имя содержит букву "A"
/*SELECT 
    p.NUME AS 'Nume Angajat',
    d.DENUMIRE_DEPARTAMENT AS 'Departament'
FROM Personal p
INNER JOIN Departamente d
ON p.ID_DEPARTAMENT = d.ID_DEPARTAMENT
WHERE p.NUME LIKE '%A%';*/

-- 69. Показать имя, должность, код и название отдела для сотрудников, работающих в Oxford
/*SELECT 
    p.NUME AS 'Nume Angajat',
    p.ID_FUNCTIE AS 'Functie',
    d.ID_DEPARTAMENT AS 'Cod Departament',
    d.DENUMIRE_DEPARTAMENT AS 'Nume Departament'
FROM Personal p
INNER JOIN Departamente d
ON p.ID_DEPARTAMENT = d.ID_DEPARTAMENT
INNER JOIN Locatii l
ON d.ID_LOCATIE = l.ID_LOCATIE
WHERE l.ORAS = 'Oxford';*/

-- 70. Показать код и имя сотрудника, а также код и имя его начальника
/*SELECT 
    e1.ID_ANGAJAT AS 'Ang#',
    e1.NUME AS 'Angajat',
    e2.ID_ANGAJAT AS 'Mgr#',
    e2.NUME AS 'Manager'
FROM Personal e1
LEFT JOIN Personal e2
ON e1.ID_MANAGER = e2.ID_ANGAJAT;*/

-- 71. Показать всех сотрудников, включая тех, у кого нет начальника
/*SELECT 
    e1.ID_ANGAJAT AS 'Ang#',
    e1.NUME AS 'Angajat',
    e2.ID_ANGAJAT AS 'Mgr#',
    COALESCE(e2.NUME, 'Fara Manager') AS 'Manager'
FROM Personal e1
LEFT JOIN Personal e2
ON e1.ID_MANAGER = e2.ID_ANGAJAT;*/

-- 72. Показать имя сотрудника, код отдела и всех сотрудников, работающих в том же отделе
/*SELECT 
    e1.NUME AS 'Angajat',
    e1.ID_DEPARTAMENT AS 'Cod Departament',
    e2.NUME AS 'Colegi'
FROM Personal e1
INNER JOIN Personal e2
ON e1.ID_DEPARTAMENT = e2.ID_DEPARTAMENT
ORDER BY e1.NUME;*/

-- 73. Структура таблицы Jobs и информация о сотрудниках
/*SELECT 
    p.NUME AS 'Nume Angajat',
    p.ID_FUNCTIE AS 'Cod Functie',
    f.DENUMIRE_FUNCT AS 'Titlu Functie',
    d.DENUMIRE_DEPARTAMENT AS 'Nume Departament',
    p.SALARIU AS 'Salariu'
FROM Personal p
INNER JOIN Functii f
ON p.ID_FUNCTIE = f.ID_FUNCTIE
INNER JOIN Departamente d
ON p.ID_DEPARTAMENT = d.ID_DEPARTAMENT;*/


-- 74. Показать имя и дату найма сотрудников, нанятых после Gates
/*SELECT 
    NUME AS 'Nume Angajat', 
    DATA_ANGAJARE AS 'Data Angajarii'
FROM Personal
WHERE DATA_ANGAJARE > (
    SELECT DATA_ANGAJARE 
    FROM Personal 
    WHERE NUME = 'Gates'
);*/


-- 75. Показать имя и дату найма сотрудников, нанятых до своих начальников
/*SELECT 
    e1.NUME AS 'Angajat',
    e1.DATA_ANGAJARE AS 'Data_ang',
    e2.NUME AS 'Manager',
    e2.DATA_ANGAJARE AS 'Data_mgr'
FROM Personal e1
INNER JOIN Personal e2
ON e1.ID_MANAGER = e2.ID_ANGAJAT
WHERE e1.DATA_ANGAJARE < e2.DATA_ANGAJARE;
*/


