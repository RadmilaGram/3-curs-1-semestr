-- CREATE DATABASE IS31R;
-- USE lab_4_db;
-- CREATE TABLE clienti (
--    cod_client INT PRIMARY KEY, 
--    nume_client VARCHAR(50) NOT NULL, 
--    adresa VARCHAR(100), 
 --   telefon VARCHAR(15) 
-- );
/*CREATE TABLE produse (
    cod_produs INT PRIMARY KEY, -- Первичный ключ
    nume_produs VARCHAR(50) NOT NULL, -- Название товара
    pret DECIMAL(10, 2) NOT NULL, -- Цена товара
    stoc INT NOT NULL -- Количество на складе
);
*/
/*CREATE TABLE comenzi (
    cod_comanda INT PRIMARY KEY, -- Первичный ключ
    data_comanda DATE DEFAULT NULL, -- Дата заказа
    cod_client INT, -- Внешний ключ на таблицу клиентов
    cod_agent VARCHAR(3), -- Внешний ключ на таблицу агентов
    status VARCHAR(20) CHECK (status IN ('В обработке', 'Отправлен', 'Доставлен', 'Отменен')), -- Статус заказа
    FOREIGN KEY (cod_client) REFERENCES clienti(cod_client), -- Связь с клиентами
    FOREIGN KEY (cod_agent) REFERENCES agenti(Cod_agent) -- Связь с агентами
);*/
/*CREATE TABLE detalii_comenzi (
    cod_detaliu INT PRIMARY KEY, -- Первичный ключ
    cod_comanda INT, -- Внешний ключ на таблицу заказов
    cod_produs INT, -- Внешний ключ на таблицу товаров
    cantitate INT NOT NULL, -- Количество товара
    pret_total DECIMAL(15, 2), -- Итоговая стоимость
    FOREIGN KEY (cod_comanda) REFERENCES comenzi(cod_comanda), -- Связь с заказами
    FOREIGN KEY (cod_produs) REFERENCES produse(cod_produs) -- Связь с товарами
);*/

/*CREATE TABLE locatii (
    id_locatie INT PRIMARY KEY, -- Первичный ключ
    adresa VARCHAR(40), -- Адрес
    cod_postal VARCHAR(12), -- Почтовый индекс
    oras VARCHAR(30), -- Город
    zona VARCHAR(25), -- Зона
    id_tara CHAR(2), -- Внешний ключ, связанный с таблицей стран
    FOREIGN KEY (id_tara) REFERENCES tari(id_tara) -- Связь с таблицей `tari`
);*/

/*CREATE TABLE tari (
    id_tara CHAR(2) PRIMARY KEY, -- Первичный ключ
    denumire_tara VARCHAR(40), -- Название страны
    id_regiune INT, -- Внешний ключ, связанный с таблицей регионов
    FOREIGN KEY (id_regiune) REFERENCES regiuni(id_regiune)
);*/

/*CREATE TABLE regiuni (
    id_regiune INT PRIMARY KEY, -- Первичный ключ
    denumire_regiune VARCHAR(25) -- Название региона
);*/


/*CREATE TABLE departamente (
    id_departament INT PRIMARY KEY, -- Первичный ключ
    denumire_departament VARCHAR(30) NOT NULL, -- Название отдела
    id_manager VARCHAR(3), -- Внешний ключ, связанный с таблицей сотрудников
    id_locatie INT, -- Внешний ключ, связанный с таблицей локаций
    FOREIGN KEY (id_manager) REFERENCES angajati(Cod_agent), -- Исправленный внешний ключ
    FOREIGN KEY (id_locatie) REFERENCES locatii(id_locatie)
);*/


/*CREATE TABLE functii (
    id_functie VARCHAR(10) PRIMARY KEY, -- Первичный ключ
    denumire_funct VARCHAR(35), -- Название должности
    salariu_min DECIMAL(10, 2), -- Минимальная зарплата
    salariu_max DECIMAL(10, 2) -- Максимальная зарплата
);*/

/*CREATE TABLE istoric_functii (
    cod_agent VARCHAR(3), -- Внешний ключ на таблицу `angajati`
    data_inceput DATE NOT NULL, -- Дата начала работы
    data_sfasit DATE, -- Дата окончания работы
    id_functie VARCHAR(10), -- Внешний ключ на таблицу `functii`
    id_departament INT, -- Внешний ключ на таблицу `departamente`
    PRIMARY KEY (cod_agent, id_functie, data_inceput), -- Составной первичный ключ
    FOREIGN KEY (cod_agent) REFERENCES angajati(Cod_agent), -- Связь с таблицей `angajati`
    FOREIGN KEY (id_functie) REFERENCES functii(id_functie), -- Связь с таблицей `functii`
    FOREIGN KEY (id_departament) REFERENCES departamente(id_departament) -- Связь с таблицей `departamente`
);*/


/*CREATE TABLE rand_comenzi (
    cod_comanda INT, -- Внешний ключ на таблицу `comenzi`
    cod_produs INT, -- Внешний ключ на таблицу `produse`
    pret DECIMAL(10, 2), -- Цена товара
    cantitate INT, -- Количество
    PRIMARY KEY (cod_comanda, cod_produs), -- Составной первичный ключ
    FOREIGN KEY (cod_comanda) REFERENCES comenzi(cod_comanda), -- Связь с таблицей `comenzi`
    FOREIGN KEY (cod_produs) REFERENCES produse(cod_produs) -- Связь с таблицей `produse`
);
rand_comenzi*/



/*INSERT INTO Functii (ID_FUNCTIE, DENUMIRE_FUNCT, SALARIU_MIN, SALARIU_MAX)
VALUES
    ('MANAGER', 'Manager', 10000, 20000),
    ('DIRECTOR', 'Director', 15000, 25000),
    ('FINANCE', 'Financiar', 8000, 15000);*/


/*INSERT INTO Personal (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
    (100, 'Steven', 'King', 'steven.king@example.com', '123456789', '2000-06-17', 'MANAGER', 24000.00, NULL, NULL, 90, 45);*/
    
/*INSERT INTO Personal (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
    (200, 'Nancy', 'Greene', 'nancy.greene@example.com', '123456789', '2015-05-10', 'MANAGER', 12000.00, NULL, NULL, 90, 45),
    (201, 'John', 'Smith', 'john.smith@example.com', '987654321', '2018-07-20', 'IT_PROG', 9000.00, NULL, 200, 60, 38);
*/

INSERT INTO Clienti (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
VALUES
    (300, 'John', 'Doe', '123456789', 5000.00, 'john.doe@example.com', '1990-05-12', 'Casatorit', 'M', 'Mediu'),
    (301, 'Jane', 'Smith', '987654321', 7000.00, 'jane.smith@example.com', '1985-07-18', 'Necas', 'F', 'Ridicat'),
    (302, 'Michael', 'Brown', '456123789', 6000.00, 'michael.brown@example.com', '1992-10-25', 'Casatorit', 'M', 'Mediu'),
    (303, 'Sarah', 'Johnson', '789456123', 8000.00, 'sarah.johnson@example.com', '1987-04-15', 'Necas', 'F', 'Ridicat'),
    (304, 'Emma', 'Davis', '951753852', 4000.00, 'emma.davis@example.com', '1995-03-22', 'Casatorit', 'F', 'Mediu'),
    (305, 'William', 'Garcia', '357159852', 7500.00, 'william.garcia@example.com', '1991-11-30', 'Necas', 'M', 'Ridicat');

INSERT INTO Comenzi (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
VALUES
    (101, '2023-11-05 14:30:00', 'online', 300, 1, 200),
    (102, '2023-11-15 10:00:00', 'offline', 301, 1, 200),
    (103, '2023-10-25 09:45:00', 'online', 302, 1, 200),
    (104, '2023-11-20 13:15:00', 'online', 303, 1, 200),
    (105, '2023-09-10 12:00:00', 'offline', 304, 0, 200),
    (106, '2023-11-28 08:20:00', 'offline', 305, 1, 200);












   
