/*INSERT INTO functii (ID_FUNCTIE, DENUMIRE_FUNCT, SALARIU_MIN, SALARIU_MAX)
VALUES 
    ('IT_PROG', 'Программист', 3000, 8000),
    ('SA_REP', 'Продавец', 4000, 5000),
    ('CLERK', 'Клерк', 2500, 5500),
    ('SA_MAN', 'Менеджер', 1000, 4000);*/
/*INSERT INTO personal (id_angajat, nume, prenume, id_functie, id_departament, salariu, data_angajare, id_manager, email)
VALUES 
    (101, 'Matos', 'Andrei', 'IT_PROG', 20, 15000.00, '1987-03-15', NULL, 'andrei.matos@example.com'),
    (102, 'Taylor', 'Maria', 'SA_REP', 50, 14000.00, '1989-04-10', 101, 'maria.taylor@example.com'),
    (103, 'Smith', 'John', 'CLERK', 30, 3000.00, '1994-06-25', 102, 'john.smith@example.com'),
    (104, 'Johnson', 'Emma', 'CLERK', 30, 6000.00, '1995-08-15', 103, 'emma.johnson@example.com'),
    (105, 'Brown', 'Michael', 'SA_MAN', 50, 11000.00, '1996-09-20', NULL, 'michael.brown@example.com'),
    (106, 'Williams', 'Sophia', 'SA_REP', 40, 12500.00, '1993-07-05', 105, 'sophia.williams@example.com'),
    (176, 'Greene', 'Laura', 'IT_PROG', 20, 13500.00, '1988-12-01', 101, 'laura.greene@example.com');*/
    
/*SELECT * FROM personal;*/

/*INSERT INTO Personal (id_angajat, nume, prenume, email, id_functie, id_departament, salariu, data_angajare, id_manager)
VALUES
    (1, 'Alexandru', 'Ion', 'alexandru.ion@example.com', 'IT_PROG', 10, 12000.00, '1994-05-01', NULL),
    (2, 'Beatrice', 'Maria', 'beatrice.maria@example.com', 'SA_REP', 20, 15000.00, '1995-06-15', 1),
    (3, 'Carmen', 'Ana', 'carmen.ana@example.com', 'CLERK', 30, 7000.00, '1996-07-10', 2),
    (4, 'Daniel', 'George', 'daniel.george@example.com', 'SA_MAN', 30, 8000.00, '1994-08-20', NULL),
    (5, 'Elena', 'Alexandra', 'elena.alexandra@example.com', 'SA_REP', 40, 9000.00, '1997-09-12', 4),
    (6, 'Michael', 'Smith', 'michael.smith@example.com', 'CLERK', 50, 3000.00, '1998-10-30', 3),
    (7, 'Paul', 'Constantin', 'paul.constantin@example.com', 'IT_PROG', 10, 6000.00, '2000-02-25', 1),
    (8, 'Ella', 'Maria', 'ella.maria@example.com', 'SA_REP', 20, 7500.00, '2001-11-10', 2);*/

/*INSERT INTO Personal (id_angajat, nume, prenume, email, id_functie, id_departament, salariu, data_angajare, id_manager)
VALUES
    (10, 'Bella', 'Maria', 'ella.maria@example.com', 'SA_REP', 30, 7500.00, '2001-11-10', 2);*/


/*INSERT INTO Clienti (ID_CLIENT, NUME_CLIENT, PRENUME_CLIENT, EMAIL_CLIENT)
VALUES
    (101, 'Popescu', 'Ion', 'ion.popescu@example.com'),
    (102, 'Ionescu', 'Maria', 'maria.ionescu@example.com'),
    (103, 'Enescu', 'George', 'george.enescu@example.com'),
    (104, 'Stancu', 'Elena', 'elena.stancu@example.com'),
    (105, 'Mihai', 'Alexandru', 'alexandru.mihai@example.com'),
    (106, 'Marin', 'Cristina', 'cristina.marin@example.com'),
    (107, 'Vasilescu', 'Andrei', 'andrei.vasilescu@example.com'),
    (108, 'Pavel', 'Simona', 'simona.pavel@example.com'),
    (109, 'Dumitrescu', 'Radu', 'radu.dumitrescu@example.com');*/
/*INSERT INTO Clienti (ID_CLIENT, NUME_CLIENT, PRENUME_CLIENT, EMAIL_CLIENT)
VALUES
   (161, 'Pavel', 'Simona', 'simona.pavel@example.com');*/
/*INSERT INTO Personal (ID_ANGAJAT, NUME, PRENUME, EMAIL, ID_FUNCTIE, ID_DEPARTAMENT, SALARIU, DATA_ANGAJARE, ID_MANAGER)
VALUES 
    (161, 'Popescu', 'Ion', 'popescu.ion@example.com', 'SA_MAN', 10, 12000.00, '2020-01-15', NULL);
*/

/*INSERT INTO Clienti (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
VALUES
    (300, 'John', 'Doe', '123456789', 5000.00, 'john.doe@example.com', '1990-05-12', 'Casatorit', 'M', 'Mediu'),
    (301, 'Jane', 'Smith', '987654321', 7000.00, 'jane.smith@example.com', '1985-07-18', 'Necasatorit', 'F', 'Ridicat'),
    (302, 'Michael', 'Brown', '456123789', 6000.00, 'michael.brown@example.com', '1992-10-25', 'Casatorit', 'M', 'Mediu'),
    (303, 'Sarah', 'Johnson', '789456123', 8000.00, 'sarah.johnson@example.com', '1987-04-15', 'Necasatorit', 'F', 'Ridicat'),
    (304, 'Emma', 'Davis', '951753852', 4000.00, 'emma.davis@example.com', '1995-03-22', 'Casatorit', 'F', 'Mediu'),
    (305, 'William', 'Garcia', '357159852', 7500.00, 'william.garcia@example.com', '1991-11-30', 'Necasatorit', 'M', 'Ridicat');
*/

/*INSERT INTO Produse (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
VALUES
    (1, 'Laptop', 'High-performance laptop', 'Electronics', 700.00, 650.00),
    (2, 'Monitor', '24-inch LED monitor', 'Electronics', 300.00, 280.00),
    (3, 'Mouse', 'Wireless mouse', 'Accessories', 50.00, 45.00),
    (4, 'Keyboard', 'Mechanical keyboard', 'Accessories', 100.00, 90.00),
    (5, 'Printer', 'Multifunction printer', 'Electronics', 200.00, 180.00);
*/

/*INSERT INTO rand_comenzi (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
VALUES
    (101, 1, 500.00, 3),  -- Пример строки заказа
    (102, 2, 400.00, 4),
    (103, 3, 250.00, 8),
    (104, 4, 300.00, 5),
    (105, 5, 450.00, 2);*/
    
/*INSERT INTO Regiuni (ID_REGIUNE, DENUMIRE_REGIUNE)
VALUES
    (1, 'Europa'),
    (2, 'America de Nord'),
    (3, 'Asia'),
    (4, 'Africa');*/
    
/*INSERT INTO Tari (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
VALUES
    ('RO', 'Romania', 1),
    ('US', 'United States', 2),
    ('UK', 'United Kingdom', 1);*/
    
/*INSERT INTO Locatii (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
VALUES
    (1, '123 Main St', '10001', 'New York', 'NY', 'US'),
    (2, '456 Sunset Blvd', '90001', 'Los Angeles', 'CA', 'US'),
    (3, '789 Lake Shore Dr', '60601', 'Chicago', 'IL', 'US'),
    (4, '101 Golden Gate Ave', '94101', 'San Francisco', 'CA', 'US');
*/

/*INSERT INTO Departamente (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
VALUES
    (10, 'HR', 100, 1),
    (20, 'IT', 101, 2),
    (30, 'Finance', 102, 3),
    (40, 'Marketing', 103, 4);*/
    
    
/*INSERT INTO Locatii (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
VALUES
    (7, '123 Oxford Rd', 'OX1 1AB', 'Oxford', 'Oxfordshire', 'UK'), -- Уникальный ID
    (8, '456 Cambridge Rd', 'CB2 1AA', 'Cambridge', 'Cambridgeshire', 'UK'),
    (9, '789 London Rd', 'W1 2AB', 'London', 'Greater London', 'UK');
*/

/*INSERT INTO Departamente (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
VALUES
    (50, 'HR', 100, 7), -- HR в Oxford
    (60, 'IT', 101, 8), -- IT в Cambridge
    (70, 'Finance', 102, 9); -- Finance в London


INSERT INTO Personal (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
    (100, 'John', 'Doe', 'john.doe@example.com', '123456789', '2020-01-15', 'HR_MANAGER', 5000.00, NULL, NULL, 50, 35), -- Работает в HR (Oxford)
    (101, 'Jane', 'Smith', 'jane.smith@example.com', '987654321', '2018-06-01', 'IT_PROG', 4500.00, 500.00, 100, 60, 30), -- Работает в IT (Cambridge)
    (102, 'Michael', 'Brown', 'michael.brown@example.com', '456123789', '2017-04-12', 'FIN_ANALYST', 4000.00, NULL, 101, 70, 40); -- Работает в Finance (London)
*/

INSERT INTO Personal (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIU, COMISION, ID_MANAGER, ID_DEPARTAMENT, varsta)
VALUES
    (200, 'Bill', 'Gates', 'bill.gates@example.com', '123456789', '2010-05-15', 'HR_MAN', 6000.00, NULL, NULL, 10, 65)
ON DUPLICATE KEY UPDATE
    PRENUME = 'Bill', 
    NUME = 'Gates',
    EMAIL = 'bill.gates@example.com',
    SALARIU = 6000.00;

    


