/*DESCRIBE departamente
SELECT *
FROM departamente*/
/*SELECT NUME, ID_FUNCTIE, DATA_ANGAJARE AS 'Lucrea din', ID_ANGAJAT
FROM angajati 
SELECT distinct ID_FUNCTIE
FROM angajati
SELECT concat(NUME ,' ', ID_FUNCTIE) AS 'Angajat functie'
FROM angajati
SELECT NUME +';'+ ID_FUNCTIE AS 'Angajat functie'
FROM angajati
SELECT PRENUME, NUME, SALARIUL
FROM angajati
WHERE SALARIUL>12000
SELECT NUME, PRENUME, SALARIUL
FROM angajati
WHERE SALARIUL not BETWEEN 5000 AND 12000
ORDER BY salariul;
SELECT NUME, PRENUME, ID_DEPARTAMENT
FROM angajati
WHERE ID_DEPARTAMENT not IN(20,50)
ORDER BY NUME

SELECT NUME, DATA_ANGAJARE
FROM angajati
WHERE DATA_ANGAJARE LIKE '%1994%'

SELECT NUME, DATA_ANGAJARE
FROM angajati
WHERE year(DATA_ANGAJARE)=1994 

SELECT NUME, PRENUME
FROM angajati
WHERE NUME LIKE '__a%'

SELECT NUME, PRENUME
FROM angajati
WHERE PRENUME LIKE '%l%l%' AND (ID_DEPARTAMENT = 30 
		OR ID_MANAGER = 101) 

SELECT NUME, PRENUME, angajati.ID_MANAGER, angajati.ID_DEPARTAMENT,
	DENUMIRE_DEPARTAMENT
FROM angajati INNER JOIN departamente
ON angajati.ID_DEPARTAMENT = departamente.ID_DEPARTAMENT 		

SELECT CONCAT(Upper(SUBSTRING(NUME,1,1)),SUBSTRING(NUME,2)), NUME, 
		LENGTH(NUME)AS 'Lungine nume'
FROM angajati
WHERE nume LIKE 'J%' OR nume LIKE 'M%'
		OR nume LIKE '__a%'
ORDER BY LENGTH(NUME)*/		
/*Să se afişeze codul salariatului, numele, salariul, salariul mărit cu 15%, exprimat cu două
zecimale şi numărul de sute al salariului nou rotunjit la 2 zecimale. Etichetaţi ultimele două
coloane “Salariu nou”, respectiv “Numar sute”. Se vor lua în considerare salariaţii al căror
salariu nu este divizibil cu 1000.		*/

SELECT 
    ID_ANGAJAT AS 'Cod Salariat', 
    NUME AS 'Nume', 
    SALARIUL AS 'Salariu', 
    ROUND(SALARIUL * 1.15, 2) AS 'Salariu nou', 
    ROUND(ROUND(SALARIUL * 1.15, 2) / 100, 0) AS 'Numar sute'
FROM 
    angajati
WHERE 
    SALARIUL % 1000 <> 0;
    
SELECT NUME, ID_FUNCTIE, SALARIUL, 
CASE
    WHEN ID_FUNCTIE = 'IT_PROG' 
	 THEN SALARIUL + (SALARIUL * 0.2)
    WHEN ID_FUNCTIE = 'SA_REP' 
	 THEN SALARIUL + (SALARIUL * 0.25)
    WHEN ID_FUNCTIE = 'SA_MEN' 
	 THEN SALARIUL + (SALARIUL * 0.2)
    ELSE SALARIUL
END
FROM angajati; 

SELECT NUME, PRENUME, ID_DEPARTAMENT
FROM angajati
WHERE ID_DEPARTAMENT = 
		(SELECT distinct ID_DEPARTAMENT
			FROM angajati
			WHERE NUME LIKE '%Smith%')  
			
			