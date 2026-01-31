CREATE DATABASE Product_db;
USE Product_db;

CREATE TABLE Product(
	model INT PRIMARY KEY,
	maker CHAR(1),
	type_product VARCHAR(20)
);

CREATE TABLE PC (
	model INT PRIMARY KEY,
	speed INT,
	ram INT,
	hd INT,
	price DECIMAL(10,2)
);

CREATE TABLE Laptop(
	model INT PRIMARY KEY,
	speed INT,
	ram INT,
	hd INT,
	screen INT,
	price DECIMAL (10,2)
);

CREATE TABLE Printer(
	model INT PRIMARY KEY,
	color BOOLEAN,
	type_printer VARCHAR(20),
	price DECIMAL(10, 2)
);

INSERT INTO product (model, maker, type_product) VALUES
(3001, 'B', 'Printer'),
(1001, 'A', 'PC'),
(2001, 'C', 'Laptop'),
(2003, 'L', 'Laptop');

INSERT INTO pc (model, speed, ram, hd, price) VALUES
(1001, 300, 1024, 250, 2114),
(1002, 142, 512, 250, 955),
(1003, 320, 2048, 160, 1049);

INSERT INTO laptop (model, speed, ram, hd, screen, price) VALUES
(2001, 200, 1024, 250, 15, 2114),
(2002, 173, 512, 80, 24, 955),
(2003, 183, 2048, 60, 20, 1049),
(2004, 53, 1024, 80, 25, 600);

INSERT INTO printer (model, color, TYPE_printer, price) VALUES
(3001, TRUE, 'inl-jet', 99),
(3002, FALSE, 'laser', 239),
(3003, TRUE, 'laser', 899);

-- 1
SELECT model FROM pc WHERE speed > 150;

-- 2
SELECT model FROM printer WHERE color = TRUE;

-- 3
SELECT model, price FROM pc UNION
SELECT model, price FROM laptop UNION
SELECT model, price FROM printer;

-- 4
SELECT DISTINCT p1.maker
FROM product p1
WHERE p1.type_product = 'Laptop' AND p1.maker NOT IN(
	SELECT DISTINCT p2.maker
	FROM product p2
	WHERE p2.type_product = 'PC'
);

-- 5 
SELECT DISTINCT p.speed
FROM PC p
JOIN Laptop l ON p.speed = l.speed;

-- 6
SELECT product.maker, pc.price FROM product
JOIN pc ON product.model = pc.model;

-- 7
SELECT DISTINCT product.maker FROM product
JOIN laptop ON product.model = laptop.model
WHERE laptop.hd >= 1024;

-- 8 
SELECT model, price FROM laptop WHERE price <= 600;

-- 9
SELECT model, type_printer, price FROM printer WHERE color = TRUE AND price <= 100;

-- 10
SELECT laptop.model, laptop.screen FROM laptop
JOIN product ON laptop.model = product.model WHERE product.maker = 'L';

-- 11
SELECT pc.model, pc.price FROM pc
JOIN product ON pc.model = product.model
WHERE pc.speed >= 280 AND product.maker = 'A';

-- 12
SELECT maker FROM product
GROUP BY maker HAVING COUNT(DISTINCT model) >= 2;






