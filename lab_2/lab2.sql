-- 1
SELECT *
FROM Outcome
WHERE point >= 2;
-- ORDER BY out ASC;

-- 2
SELECT * 
FROM ships 
WHERE  class LIKE '%o';

-- 3
SELECT maker
FROM Laptop AS lp JOIN Product pr ON speed <= 500 AND type = 'Laptop' AND lp.model = pr.model;  

-- 4
SELECT distinct maker 
FROM product 
WHERE type = 'PC' AND maker = ANY (SELECT maker FROM product WHERE type = 'LAPTOP');

-- 5
SELECT distinct maker FROM product AS p JOIN pc ON p.model = pc.model
WHERE type='pc' AND speed <= 500;

-- 6
SELECT  name, DATE(date) AS date FROM Battles;

-- 7 ?
SELECT battle, class FROM Ships JOIN Outcomes ON ship = name;

-- 8
SELECT ship, country, numGuns
FROM classes
JOIN (SELECT ship, name, class FROM Outcomes JOIN ships WHERE result = 'damaged' AND ships.name = outcomes.ship) damagedShips
ON damagedShips.class = classes.class;

-- 9 


-- 10
SELECT AVG(price)
FROM (SELECT model, price FROM PC
UNION SELECT model, price FROM Laptop) pcLaptopPrice
JOIN (SELECT model FROM product WHERE maker = 'A') productModel;
