CREATE DATABASE EvidentaComenzi;
USE EvidentaComenzi;
CREATE TABLE firme (
    codfirma INT(2) NOT NULL,
    denfirma VARCHAR(20) NOT NULL,
    loc VARCHAR(20),
    zona VARCHAR(15),
    CONSTRAINT PKey_firme PRIMARY KEY (codfirma),
    CONSTRAINT FZONA_CK CHECK (zona IN ('Moldova', 'Ardeal', 'Banat', 'Muntenia', 'Dobrogea', 'Transilvania'))
);

CREATE TABLE agenti (
    codagent VARCHAR(3) NOT NULL,
    numeagent VARCHAR(25) NOT NULL,
    dataang DATE DEFAULT CURRENT_DATE,
    datanast DATE,
    functia VARCHAR(20),
    codfirma INT(2),
    CONSTRAINT pk_agent PRIMARY KEY (codagent),
    CONSTRAINT FK_agenti FOREIGN KEY (codfirma) REFERENCES firme(codfirma)
);

CREATE TABLE clienti (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nume_client VARCHAR(50) NOT NULL,
    telefon VARCHAR(15),
    email VARCHAR(50),
    adresa VARCHAR(100),
    oras VARCHAR(50),
    tara VARCHAR(50)
);

CREATE TABLE angajati (
    id_angajat INT AUTO_INCREMENT PRIMARY KEY,
    nume_angajat VARCHAR(50) NOT NULL,
    functie VARCHAR(50),
    departament VARCHAR(50),
    data_angajarii DATE,
    id_manager INT,
    salariu DECIMAL(10, 2)
);

CREATE TABLE produse (
    id_produs INT AUTO_INCREMENT PRIMARY KEY,
    nume_produs VARCHAR(50) NOT NULL,
    descriere TEXT,
    pret DECIMAL(10, 2) NOT NULL,
    stoc INT NOT NULL
);

CREATE TABLE comenzi (
    id_comanda INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,angajati
    id_angajat INT NOT NULL,
    data_comenzii DATE DEFAULT CURRENT_DATE,
    status_comanda VARCHAR(20),
    total DECIMAL(10, 2),
    FOREIGN KEY (id_client) REFERENCES clienti(id_client),
    FOREIGN KEY (id_angajat) REFERENCES angajati(id_angajat)
);

CREATE TABLE detalii_comenzi (
    id_detaliu INT AUTO_INCREMENT PRIMARY KEY,
    id_comanda INT NOT NULL,
    id_produs INT NOT NULL,
    cantitate INT NOT NULL,
    pret_unitar DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_comanda) REFERENCES comenzi(id_comanda),
    FOREIGN KEY (id_produs) REFERENCES produse(id_produs)
);

CREATE TABLE depozite (
    id_depozit INT AUTO_INCREMENT PRIMARY KEY,
    nume_depozit VARCHAR(50),
    locatie VARCHAR(100),
    capacitate INT
);


CREATE TABLE stocuri (
    id_stoc INT AUTO_INCREMENT PRIMARY KEY,
    id_depozit INT NOT NULL,
    id_produs INT NOT NULL,
    cantitate INT NOT NULL,
    FOREIGN KEY (id_depozit) REFERENCES depozite(id_depozit),
    FOREIGN KEY (id_produs) REFERENCES produse(id_produs)
);


CREATE TABLE fosti_agenti AS
SELECT codagent, numeagent, functia, codfirma
FROM agenti
WHERE 1=0;

-- 4.1 
RENAME TABLE agenti TO personal;

-- 4.2 
ALTER TABLE personal ADD email VARCHAR(50), ADD varsta INT;

-- 4.3 
ALTER TABLE personal MODIFY email TEXT;

-- 4.4 
ALTER TABLE personal DROP COLUMN email;

-- 4.5
ALTER TABLE personal DROP COLUMN functia;

-- 4.6
ALTER TABLE personal DROP COLUMN dataang;
ALTER TABLE personal DROP COLUMN datanast;
-- 4.7 
ALTER TABLE personal ADD CONSTRAINT CK_Varsta CHECK (varsta >= 18);

-- 4.8 
ALTER TABLE personal DROP CHECK CK_Varsta;

-- 5
DROP TABLE fosti_agenti;

-- 6
TRUNCATE TABLE personal;

-- 7.1
CREATE TABLE salariati LIKE angajati;
INSERT INTO salariati SELECT * FROM angajati WHERE departament IN (20, 30, 50); -- 7.2
COMMIT;
INSERT INTO salariati (id_angajat, nume_angajat, functie, departament,id_manager, data_angajarii, salariu) 
VALUES
    (121, 'Popescu Ion', 'Inginer', 20, 122, '2023-01-15', 4500.00),
    (178, 'Ionescu Maria', 'Manager', 30, 135, '2022-07-10', 7500.00),
    (173, 'Georgescu Ana', 'Analist', 50, 123, '2010-03-20', 5200.00),
    (167, 'Dumitrescu Vlad', 'Tehnician', 50, 140, '2020-11-05', 2800.00),
    (125, 'Marinescu Elena', 'Consultant', 30, 122, '2024-06-01', 6100.00);
 -- 7.3

-- 8.1
UPDATE salariati SET salariu = salariu + 100 WHERE salariu < 3000;

-- 8.2
UPDATE salariati SET salariu = (SELECT salariu FROM angajati WHERE id_angajat = 125) WHERE id_manager = 122;

-- 8.3 
UPDATE salariati s
JOIN angajati a ON s.departament = 50
SET s.salariu = a.salariu
WHERE a.id_angajat = 167
  AND s.salariu < (SELECT salariu FROM angajati WHERE id_angajat = 173);

-- 9.1 
DELETE FROM salariati WHERE id_manager IN (122, 123);

-- 9.2 
DELETE FROM salariati WHERE YEAR(data_angajarii) < 2016;

-- 9.3 
DELETE FROM salariati;
ROLLBACK;
