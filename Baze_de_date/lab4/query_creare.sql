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

CREATE TABLE istoric_functii (
    cod_agent VARCHAR(3), -- Внешний ключ на таблицу `angajati`
    data_inceput DATE NOT NULL, -- Дата начала работы
    data_sfasit DATE, -- Дата окончания работы
    id_functie VARCHAR(10), -- Внешний ключ на таблицу `functii`
    id_departament INT, -- Внешний ключ на таблицу `departamente`
    PRIMARY KEY (cod_agent, id_functie, data_inceput), -- Составной первичный ключ
    FOREIGN KEY (cod_agent) REFERENCES angajati(Cod_agent), -- Связь с таблицей `angajati`
    FOREIGN KEY (id_functie) REFERENCES functii(id_functie), -- Связь с таблицей `functii`
    FOREIGN KEY (id_departament) REFERENCES departamente(id_departament) -- Связь с таблицей `departamente`
);


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


/*USE is31r;
-- Таблица REGIUNI
CREATE TABLE REGIUNI (
    ID_REGIUNE INT PRIMARY KEY,
    DENUMIRE_REGIUNE VARCHAR(25) NOT NULL
);

-- Таблица TARI
CREATE TABLE TARI (
    ID_TARA CHAR(2) PRIMARY KEY,
    DENUMIRE_TARA VARCHAR(40) NOT NULL,
    ID_REGIUNE INT NOT NULL,
    FOREIGN KEY (ID_REGIUNE) REFERENCES REGIUNI(ID_REGIUNE)
);

-- Таблица LOCATII
CREATE TABLE LOCATII (
    ID_LOCATIE INT PRIMARY KEY,
    ADRESA VARCHAR(40) NOT NULL,
    COD_POSTAL VARCHAR(10) NOT NULL,
    ORAS VARCHAR(25) NOT NULL,
    ZONA VARCHAR(25) NOT NULL,
    ID_TARA CHAR(2) NOT NULL,
    FOREIGN KEY (ID_TARA) REFERENCES TARI(ID_TARA)
);

-- Таблица FUNCTИИ
CREATE TABLE FUNCTII (
    ID_FUNCTIE VARCHAR(10) PRIMARY KEY,
    DENUMIRE_FUNCT VARCHAR(35) NOT NULL,
    SALARIU_MIN INT NOT NULL,
    SALARIU_MAX INT NOT NULL
);

-- Таблица ANGAJATI
CREATE TABLE ANGAJATI (
    ID_ANGAJAT INT PRIMARY KEY,
    PRENUME VARCHAR(20) NOT NULL,
    NUMЕ VARCHAR(25) NOT NULL,
    TELEФОН VARCHAR(20),
    EMAIL VARCHAR(50),
    DATA_ANGAJARE DATE NOT NULL,
    ID_FUNCTIE VARCHAR(10) NOT NULL,
    SALARIU DECIMAL(8,2) NOT NULL,
    COMISION DECIMAL(5,2),
    ID_MANAGER INT,
    ID_DEPARTAMENT INT,
    FOREIGN KEY (ID_FUNCTIE) REFERENCES FUNCTII(ID_FUNCTIE),
    FOREIGN KEY (ID_MANAGER) REFERENCES ANGAJATI(ID_ANGAJAT)
);

-- Таблица DEPARTAMENTE
CREATE TABLE DEPARTAMENTE (
    ID_DEPARTAMENT INT PRIMARY KEY,
    DENUMIRE_DEPARTAMENT VARCHAR(30) NOT NULL,
    ID_MANAGER INT,
    ID_LOCATIE INT NOT NULL,
    FOREIGN KEY (ID_MANAGER) REFERENCES ANGAJATI(ID_ANGAJAT),
    FOREIGN KEY (ID_LOCATIE) REFERENCES LOCATII(ID_LOCATIE)
);

-- Таблица ISTORIC_FUNCTII
CREATE TABLE ISTORIC_FUNCTII (
    ID_ANGAJAT INT NOT NULL,
    DATA_INCEPUT DATE NOT NULL,
    DATA_SFARSIT DATE,
    ID_FUNCTIE VARCHAR(10) NOT NULL,
    ID_DEPARTAMENT INT NOT NULL,
    FOREIGN KEY (ID_ANGAJAT) REFERENCES ANGAJATI(ID_ANGAJAT),
    FOREIGN KEY (ID_FUNCTIE) REFERENCES FUNCTII(ID_FUNCTIE),
    FOREIGN KEY (ID_DEPARTAMENT) REFERENCES DEPARTAMENTE(ID_DEPARTAMENT),
    PRIMARY KEY (ID_ANGAJAT, DATA_INCEPUT)
);

-- Таблица CLIENTI
CREATE TABLE CLIENTI (
    ID_CLIENT INT PRIMARY KEY,
    PRENUME_CLIENT VARCHAR(20) NOT NULL,
    NUME_CLIENT VARCHAR(20) NOT NULL,
    TELEФОН VARCHAR(20),
    LIMITA_CREDIT DECIMAL(8,2),
    EMAIL_CLIENT VARCHAR(30),
    DATA_NASTERE DATE,
    STAREA_CIVILA VARCHAR(10),
    SEX CHAR(1),
    NIVEL_VENITURI VARCHAR(20)
);

-- Таблица PRODUSE
CREATE TABLE PRODUSE (
    ID_PRODUS INT PRIMARY KEY,
    DENUMIRE_PRODUS VARCHAR(50) NOT NULL,
    DESCRIERE VARCHAR(200),
    CATEGORIE VARCHAR(40),
    PRET_LISTA DECIMAL(8,2) NOT NULL,
    PRET_MIN DECIMAL(8,2) NOT NULL
);

-- Таблица COMENZI
CREATE TABLE COMENZI (
    NR_COMANDA INT PRIMARY KEY,
    DATA TIMESTAMP NOT NULL,
    MODALITATE VARCHAR(20),
    ID_CLIENT INT NOT NULL,
    STARE_COMANDA TINYINT,
    ID_ANGAJAT INT NOT NULL,
    FOREIGN KEY (ID_CLIENT) REFERENCES CLIENTI(ID_CLIENT),
    FOREIGN KEY (ID_ANGAJAT) REFERENCES ANGAJATI(ID_ANGAJAT)
);

-- Таблица RAND_COMENZI
CREATE TABLE RAND_COMENZI (
    NR_COMANDA INT NOT NULL,
    ID_PRODUS INT NOT NULL,
    PRET DECIMAL(8,2) NOT NULL,
    CANTITATE INT NOT NULL,
    FOREIGN KEY (NR_COMANDA) REFERENCES COMENZI(NR_COMANDA),
    FOREIGN KEY (ID_PRODUS) REFERENCES PRODUSE(ID_PRODUS),
    PRIMARY KEY (NR_COMANDA, ID_PRODUS)
);
*/
