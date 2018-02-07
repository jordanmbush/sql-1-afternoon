-- =======================================
-- TABLE - PEOPLE
-- =======================================

DROP TABLE person;
/* Create a table called Person that records a person's ID, Name, Age, Height ( in cm ), City, FavoriteColor.
ID should be an auto-incrementing id/primary key - Use type: INTEGER PRIMARY KEY AUTOINCREMENT */
CREATE TABLE person (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(60),
  age SMALLINT,
  height SMALLINT,
  city VARCHAR(128),
  favoriteColor VARCHAR(60)
  );
/* Add 5 different people into the Person database.
Remember to not include the ID because it should auto-increment. */
INSERT INTO person (name, age, height, city, favoriteColor)
VALUES
	('Jordan', 26, 100, 'Phoenix', 'White'),
    ('Jimmy', 25, 101, 'Tempe', 'Blue'),
    ('Jerry', 27, 103, 'Chandler', 'Orange'),
    ('Janice', 28, 104, 'Glendale', 'White'),
    ('Jordan', 15, 105, 'Surprise', 'Green');
/* List all the people in the Person table by Height from tallest to shortest. */
SELECT * FROM person ORDER BY height DESC;
/* List all the people in the Person table by Height from shortest to tallest. */
SELECT * FROM person ORDER BY height ASC;
/* List all the people in the Person table by Age from oldest to youngest. */
SELECT * FROM person ORDER BY age DESC;
/* List all the people in the Person table older than age 20. */
SELECT * FROM person WHERE age > 20;
/* List all the people in the Person table that are exactly 18. */
SELECT * FROM person WHERE age = 18;
/* List all the people in the Person table that are less than 20 and older than 30. */
SELECT * FROM person WHERE (age < 20 AND age > 30);
/* List all the people in the Person table that are not 27 (Use not equals). */
SELECT * FROM person WHERE age <> 27;
/* List all the people in the Person table where their favorite color is not red. */
SELECT * FROM person WHERE favoriteColor <> 'red';
/* List all the people in the Person table where their favorite color is not red and is not blue. */
SELECT * FROM person WHERE (favoriteColor <> 'red' AND favoriteColor <> 'blue');
/* List all the people in the Person table where their favorite color is orange or green. */
SELECT * FROM person WHERE (favoriteColor = 'orange' OR favoriteColor = 'green');
/* List all the people in the Person table where their favorite color is orange, green or blue (use IN). */
SELECT * FROM person WHERE favoriteColor IN ('orange', 'green', 'blue');
/* List all the people in the Person table where their favorite color is yellow or purple (use IN). */
SELECT * FROM person WHERE favoriteColor IN ('yello', 'purple');


-- =======================================
-- TABLE - ORDERS
-- =======================================
/* Create a table called Orders that records: PersonID, ProductName, ProductPrice, Quantity. */
CREATE TABLE orders (
    PersonID INTEGER,
    ProductName VARCHAR(120),
    ProductPrice DECIMAL,
    Quantity INTEGER
);
/* Add 5 Orders to the Orders table.
Make orders for at least two different people.
PersonID should be different for different people. */
INSERT INTO orders (PersonID, ProductName, ProductPrice, Quantity)
VALUES (1, 'Coffee', 250, 34),
    (1, 'Donuts', 5, 3),
    (2, 'Cereal', 50, 4),
    (2, 'Milk', 25, 1);
/* Select all the records from the Orders table. */
SELECT * FROM orders;
/* Calculate the total number of products ordered. */
SELECT SUM(Quantity) FROM orders;
/* Calculate the total order price. */
SELECT SUM(Quantity * ProductPrice) FROM orders;
/* Calculate the total order price by a single PersonID. */
SELECT SUM(Quantity * ProductPrice) FROM orders WHERE PersonID = 1;

-- =======================================
-- TABLE - ARTIST
-- =======================================
-- Add 3 new Artists to the Artist table. ( It's already created )
INSERT INTO artist (artistID, name)
VALUES (1, 'jordan'),
    (2, 'jordan'),
    (3, 'jordan');
-- Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10;
-- Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name ASC LIMIT 5;
-- Select all artists that start with the word "Black".
SELECT * FROM artist WHERE name LIKE 'Black%';
-- Select all artists that contain the word "Black".
SELECT * FROM artist WHERE name LIKE '%Black%';

-- =======================================
-- TABLE - INVOICE
-- =======================================
-- Count how many orders were made from the USA.
SELECT COUNT(Total) FROM Invoice WHERE BillingCountry = 'USA';
-- Find the largest order total amount.
SELECT total FROM Invoice ORDER BY total DESC LIMIT 1;
-- Find the smallest order total amount.
SELECT total FROM Invoice ORDER BY total ASC LIMIT 1;
-- Find all orders bigger than $5.
SELECT * FROM Invoice WHERE total > 5;
-- Count how many orders were smaller than $5.
SELECT COUNT(total) FROM Invoice WHERE total < 5;
-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(total) FROM Invoice WHERE BillingCity IN ('CA', 'TX', 'AZ');
-- Get the average total of the orders.
SELECT AVG(total) FROM Invoice;
-- Get the total sum of the orders.
SELECT SUM(total) FROM Invoice;