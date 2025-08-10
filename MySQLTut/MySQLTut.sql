-- https://www.youtube.com/watch?v=XqIk2PwP0To&ab_channel=DerekBanas

CREATE TABLE customer(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NOT NULL,
company VARCHAR(60) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL,
zip MEDIUMINT UNSIGNED NOT NULL,
phone VARCHAR(20) NOT NULL,
birth_date DATE NULL,
sex ENUM('M', 'F') NOT NULL,
date_entered TIMESTAMP NOT NULL,
id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE sales_person(
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
email VARCHAR(60) NOT NULL,
street VARCHAR(50) NOT NULL,
city VARCHAR(40) NOT NULL,
state CHAR(2) NOT NULL,
zip MEDIUMINT UNSIGNED NOT NULL,
phone VARCHAR(20) NOT NULL,
birth_date DATE NULL,
sex ENUM('M', 'F') NOT NULL,
date_hired TIMESTAMP NOT NULL,
id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE product_type(
name VARCHAR(30) NOT NULL,
id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE product(
type_id INT UNSIGNED NOT NULL,
FOREIGN KEY (type_id) REFERENCES product_type(id),
name VARCHAR(60) NOT NULL,
supplier VARCHAR(30) NOT NULL,
description BLOB NOT NULL,
id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE item(
product_id INT UNSIGNED NOT NULL,
FOREIGN KEY (product_id) REFERENCES product(id),
size INT UNSIGNED NOT NULL,
color VARCHAR(30) NOT NULL,
picture VARCHAR(255) NOT NULL,
price DECIMAL(6,2) NOT NULL,
id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE sales_order(
customer_id INT UNSIGNED NOT NULL,
sales_person_id INT UNSIGNED NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (sales_person_id) REFERENCES sales_person(id),
time_order_taken TIMESTAMP NOT NULL,
purchase_order_number INT UNSIGNED NOT NULL,
credit_card_number VARCHAR(16) NOT NULL,
credit_card_exp_month TINYINT UNSIGNED NOT NULL,
credit_card_exp_year TINYINT UNSIGNED NOT NULL,
credit_card_cvv TINYINT UNSIGNED NOT NULL,
name_on_card VARCHAR(60) NOT NULL,

id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE sales_item(
item_id INT UNSIGNED NOT NULL,
sales_order_id INT UNSIGNED NOT NULL,
FOREIGN KEY (item_id) REFERENCES item(id),
FOREIGN KEY (sales_order_id) REFERENCES sales_order(id),
quantity INT UNSIGNED NOT NULL,
discount DECIMAL(3,2) NULL DEFAULT 0.00,
taxable BOOL NOT NULL DEFAULT 0,
sales_tax_rate DECIMAL(5,2) NOT NULL DEFAULT 000.00,

id INT UNSIGNED NOT NULL
AUTO_INCREMENT PRIMARY KEY
);

ALTER TABLE sales_item ADD day_of_week VARCHAR(8);

ALTER TABLE sales_item MODIFY day_of_week VARCHAR(9) NOT NULL;

ALTER TABLE sales_item DROP COLUMN day_of_week;

CREATE TABLE transaction_type(
    name VARCHAR(30) NOT NULL,
    payment_type VARCHAR(30) NOT NULL,
    id INT UNSIGNED NOT NULL
    AUTO_INCREMENT PRIMARY KEY
);

RENAME TABLE transaction_type TO transaction;

CREATE INDEX transaction_id ON transactions (name);

CREATE INDEX transaction_id ON transaction(name);

CREATE INDEX transaction_id_2 ON transaction(name, payment_type);

DROP TABLE transaction;

INSERT INTO product_type(name, id)
    VALUES('Business', NULL),
        ('Casual', NULL),
        ('Athletic', NULL);

SELECT * FROM product_type;

INSERT INTO product
    VALUES(1, 'Business Suit', 'Tailor Co.', 'A formal business suit.', NULL),
        (2, 'Casual Shirt', 'Shirt Makers', 'A casual button-up shirt.', NULL),
        (3, 'Running Shoes', 'Shoe Corp.', 'Comfortable running shoes.', NULL),
        (1, 'Formal Pants', 'Tailor Co.', 'Matching pants for the business suit.', NULL),
        (2, 'Casual Jeans', 'Denim Works', 'Comfortable casual jeans.', NULL),
        (3, 'Sports Jacket', 'Active Wear', 'Lightweight jacket for athletic activities.', NULL),
        (1, 'Business Shoes', 'Shoe Corp.', 'Formal shoes for business attire.', NULL),
        (2, 'Casual Sneakers', 'Shoe Corp.', 'Relaxed sneakers for everyday wear.', NULL);

SELECT * FROM product;

INSERT INTO customer
    VALUES('Stephen', 'Giang', 'StephenG753@Gmail.com', 'Tech Corp.', '123 Tech Street', 'Tech City', 'CA', 90210, '123-456-7890', '1985-06-15', 'M', CURRENT_TIMESTAMP, NULL),
        ('Jane', 'Doe', 'jane.doe@example.com', 'Design Studio', '456 Creative Ave', 'Art City', 'NY', 10001, '987-654-3210', '1990-03-22', 'F', CURRENT_TIMESTAMP, NULL),
        ('John', 'Smith', 'john.smith@example.com', 'Smith Enterprises', '789 Business Blvd', 'Commerce City', 'TX', 75001, '555-123-4567', '1980-11-05', 'M', CURRENT_TIMESTAMP, NULL),
        ('Emily', 'Johnson', 'emily.johnson@example.com', 'Health Co.', '321 Wellness Way', 'Healthy City', 'FL', 33101, '444-555-6666', '1992-07-19', 'F', CURRENT_TIMESTAMP, NULL),
        ('Michael', 'Brown', 'michael.brown@example.com', 'Tech Solutions', '654 Innovation Rd', 'Techville', 'WA', 98001, '333-444-5555', '1988-09-12', 'M', CURRENT_TIMESTAMP, NULL),
        ('Sarah', 'Davis', 'sarah.davis@example.com', 'Fashion House', '987 Style St', 'Fashion City', 'IL', 60601, '222-333-4444', '1995-01-25', 'F', CURRENT_TIMESTAMP, NULL),
        ('David', 'Wilson', 'david.wilson@example.com', 'Construction Inc.', '123 Build Ln', 'Construct City', 'CA', 90211, '111-222-3333', '1983-04-10', 'M', CURRENT_TIMESTAMP, NULL),
        ('Laura', 'Martinez', 'laura.martinez@example.com', 'Education Hub', '456 Learn Blvd', 'Knowledge City', 'MA', 02101, '777-888-9999', '1991-08-30', 'F', CURRENT_TIMESTAMP, NULL),
        ('James', 'Garcia', 'james.garcia@example.com', 'Auto World', '789 Drive Ave', 'Car City', 'MI', 48201, '666-777-8888', '1987-02-14', 'M', CURRENT_TIMESTAMP, NULL),
        ('Olivia', 'Anderson', 'olivia.anderson@example.com', 'Foodies', '321 Gourmet Rd', 'Food City', 'OR', 97001, '555-666-7777', '1993-12-05', 'F', CURRENT_TIMESTAMP, NULL);

SELECT * FROM customer;

INSERT INTO sales_person
    VALUES('Alice', 'Walker', 'alice.walker@example.com', '123 Main St', 'Cityville', 'CA', 90001, '123-456-7890', '1985-05-20', 'F', CURRENT_TIMESTAMP, NULL),
        ('Bob', 'Johnson', 'bob.johnson@example.com', '456 Elm St', 'Townsville', 'TX', 75001, '987-654-3210', '1978-11-15', 'M', CURRENT_TIMESTAMP, NULL),
        ('Charlie', 'Brown', 'charlie.brown@example.com', '789 Oak St', 'Villagetown', 'NY', 10001, '555-123-4567', '1990-03-10', 'M', CURRENT_TIMESTAMP, NULL),
        ('Diana', 'Prince', 'diana.prince@example.com', '321 Maple St', 'Metropolis', 'IL', 60601, '444-555-6666', '1988-07-25', 'F', CURRENT_TIMESTAMP, NULL),
        ('Ethan', 'Hunt', 'ethan.hunt@example.com', '654 Pine St', 'Capitol City', 'WA', 98001, '333-444-5555', '1983-09-12', 'M', CURRENT_TIMESTAMP, NULL);

SELECT * FROM sales_person;

ALTER TABLE sales_order MODIFY purchase_order_number BIGINT UNSIGNED NOT NULL;

ALTER TABLE sales_order MODIFY credit_card_cvv SMALLINT UNSIGNED NOT NULL;

INSERT INTO item
    VALUES(1, 40, 'Black', 'black_suit.jpg', 199.99, NULL),
        (2, 38, 'Blue', 'blue_shirt.jpg', 49.99, NULL),
        (3, 42, 'White', 'white_shoes.jpg', 89.99, NULL),
        (4, 36, 'Gray', 'gray_pants.jpg', 79.99, NULL),
        (5, 34, 'Dark Blue', 'dark_blue_jeans.jpg', 59.99, NULL),
        (6, 44, 'Red', 'red_jacket.jpg', 129.99, NULL),
        (7, 41, 'Brown', 'brown_shoes.jpg', 149.99, NULL),
        (8, 39, 'Green', 'green_sneakers.jpg', 69.99, NULL),
        (1, 40, 'Navy', 'navy_suit.jpg', 209.99, NULL),
        (2, 38, 'Pink', 'pink_shirt.jpg', 39.99, NULL),
        (3, 42, 'Black', 'black_running_shoes.jpg', 99.99, NULL),
        (4, 36, 'Beige', 'beige_pants.jpg', 89.99, NULL),
        (5, 34, 'Light Blue', 'light_blue_jeans.jpg', 49.99, NULL),
        (6, 44, 'Yellow', 'yellow_jacket.jpg', 139.99, NULL),
        (7, 41, 'Black', 'black_business_shoes.jpg', 159.99, NULL),
        (8, 39, 'White', 'white_sneakers.jpg', 79.99, NULL),
        (1, 40, 'Charcoal', 'charcoal_suit.jpg', 219.99, NULL),
        (2, 38, 'Purple', 'purple_shirt.jpg', 29.99, NULL),
        (3, 42, 'Gray', 'gray_running_shoes.jpg', 109.99, NULL),
        (4, 36, 'Black', 'black_pants.jpg', 99.99, NULL),
        (5, 34, 'Indigo', 'indigo_jeans.jpg', 69.99, NULL),
        (6, 44, 'Orange', 'orange_jacket.jpg', 149.99, NULL),
        (7, 41, 'Tan', 'tan_business_shoes.jpg', 169.99, NULL),
        (8, 39, 'Blue', 'blue_sneakers.jpg', 89.99, NULL),
        (1, 40, 'Silver', 'silver_suit.jpg', 229.99, NULL),
        (2, 38, 'Teal', 'teal_shirt.jpg', 19.99, NULL),
        (3, 42, 'Navy', 'navy_running_shoes.jpg', 119.99, NULL),
        (4, 36, 'White', 'white_pants.jpg', 109.99, NULL),
        (5, 34, 'Gray', 'gray_jeans.jpg', 79.99, NULL),
        (6, 44, 'Black', 'black_jacket.jpg', 159.99, NULL);

SELECT * FROM item;

ALTER TABLE sales_order MODIFY credit_card_exp_year SMALLINT UNSIGNED NOT NULL;

INSERT INTO sales_order
    VALUES(1, 1, CURRENT_TIMESTAMP, 10001, '1234567812345678', 12, 2025, 123, 'Stephen Giang', NULL),
        (2, 2, CURRENT_TIMESTAMP, 10002, '2345678923456789', 11, 2024, 234, 'Jane Doe', NULL),
        (3, 3, CURRENT_TIMESTAMP, 10003, '3456789034567890', 10, 2026, 345, 'John Smith', NULL),
        (4, 4, CURRENT_TIMESTAMP, 10004, '4567890145678901', 9, 2023, 456, 'Emily Johnson', NULL),
        (5, 5, CURRENT_TIMESTAMP, 10005, '5678901256789012', 8, 2027, 567, 'Michael Brown', NULL),
        (6, 1, CURRENT_TIMESTAMP, 10006, '6789012367890123', 7, 2025, 678, 'Sarah Davis', NULL),
        (7, 2, CURRENT_TIMESTAMP, 10007, '7890123478901234', 6, 2024, 789, 'David Wilson', NULL),
        (8, 3, CURRENT_TIMESTAMP, 10008, '8901234589012345', 5, 2026, 890, 'Laura Martinez', NULL),
        (9, 4, CURRENT_TIMESTAMP, 10009, '9012345690123456', 4, 2023, 901, 'James Garcia', NULL),
        (10, 5, CURRENT_TIMESTAMP, 10010, '0123456701234567', 3, 2027, 123, 'Olivia Anderson', NULL);

SELECT * FROM sales_order;

DELETE FROM sales_item;

INSERT INTO sales_item
    VALUES(1, 1, 2, 0.45, 7.50, 5.00, NULL),
        (2, 1, 3, 0.78, 10.00, 6.00, NULL),
        (3, 2, 1, 0.12, 15.00, 7.50, NULL),
        (4, 2, 2, 0.67, 20.00, 10.00, NULL),
        (5, 3, 4, 0.34, 25.00, 12.50, NULL),
        (6, 3, 5, 0.89, 30.00, 15.00, NULL),
        (7, 4, 6, 0.23, 35.00, 17.50, NULL),
        (8, 4, 7, 0.56, 40.00, 20.00, NULL),
        (9, 5, 8, 0.91, 45.00, 22.50, NULL),
        (10,5, 1 ,0.15 ,50.00 ,25.00, NULL),
        (11, 6, 2, 0.20, 10.00, 5.00, NULL),
        (12, 6, 3, 0.30, 15.00, 7.50, NULL),
        (13, 7, 4, 0.40, 20.00, 10.00, NULL),
        (14, 7, 5, 0.50, 25.00, 12.50, NULL),
        (15, 8, 6, 0.60, 30.00, 15.00, NULL),
        (16, 8, 7, 0.70, 35.00, 17.50, NULL),
        (17, 9, 8, 0.80, 40.00, 20.00, NULL),
        (18, 9, 9, 0.90, 45.00, 22.50, NULL),
        (19, 10, 10, 0.10, 50.00, 25.00, NULL),
        (20, 1, 11, 0.25, 55.00, 27.50, NULL),
        (21, 2, 12, 0.35, 60.00, 30.00, NULL),
        (22, 3, 13, 0.45, 65.00, 32.50, NULL),
        (23, 4, 14, 0.55, 70.00, 35.00, NULL),
        (24, 5, 15, 0.65, 75.00, 37.50, NULL),
        (25, 6, 16, 0.75, 80.00, 40.00, NULL),
        (26, 7, 17, 0.85, 85.00, 42.50, NULL),
        (27, 8, 18, 0.95, 90.00, 45.00, NULL),
        (28, 9, 19, 0.05, 95.00, 47.50, NULL),
        (29, 10, 20, 0.15, 100.00, 50.00, NULL),
        (30, 1, 21, 0.25, 105.00, 52.50, NULL);


SELECT * FROM sales_item;

SELECT * FROM sales_item WHERE discount > 0.15;

SELECT time_order_taken, customer_id FROM sales_order WHERE time_order_taken > '2025-03-27';

SELECT * FROM sales_item WHERE discount > 0.15 ORDER BY discount DESC LIMIT 1, 5;

SELECT CONCAT(first_name, ' ', last_name) AS name, phone, state
FROM customer WHERE state = 'TX';

SELECT product_id, SUM(price) AS Value
FROM item
WHERE product_id = 1

SELECT DISTINCT state
FROM customer
WHERE state IN ('CA', 'TX')
ORDER BY state;

SELECT item_id, price, quantity
FROM item INNER JOIN sales_item
ON item.id = sales_item.item_id
AND price > 120
ORDER BY item_id;

SELECT sales_order.id, sales_item.id, item.id, item.picture, sales_item.quantity, item.price,
(sales_item.quantity * item.price) AS Total
FROM sales_order
JOIN sales_item ON sales_order.id = sales_item.sales_order_id
JOIN item ON sales_item.item_id = item.id
WHERE sales_order.id = 1;

SELECT item_id, price
FROM item, sales_item
WHERE item.id = sales_item.item_id
AND price > 120
ORDER BY item_id;

SELECT item_id, price
FROM item
JOIN sales_item ON item.id = sales_item.item_id
WHERE price > 120
ORDER BY item_id;

SELECT product.id, name, supplier, item.id, price
FROM product LEFT JOIN item
ON product.id = item.product_id
ORDER BY name;

SELECT sales_order_id, quantity, product_id
FROM item CROSS JOIN sales_item
ORDER BY sales_order_id;

SELECT id, first_name, last_name, street, city, zip, birth_date
FROM customer
WHERE MONTH(birth_date) = 12
UNION
SELECT id, first_name, last_name, street, city, zip, birth_date
FROM sales_person
WHERE MONTH(birth_date) = 9
ORDER BY birth_date;

SELECT product_id, price
FROM item
WHERE price IS NOT NULL;

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'M%'

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'J___'

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'D%' OR last_name LIKE '%n';

SELECT first_name, last_name
FROM customer
WHERE first_name REGEXP '^M';

SELECT MONTH(birth_date) AS Month, COUNT(*) As Amount
FROM customer
GROUP BY Month
HAVING Amount > 1
ORDER BY Month;

SELECT customer_id, company, COUNT(*) AS Purchases
FROM sales_order
JOIN customer
ON sales_order.customer_id = customer.id
GROUP BY customer_id;

SELECT COUNT(*) AS Amount,
SUM(price) AS Total,
ROUND(AVG(price), 2) AS Avg,
MIN(price) AS Min,
MAX(price) AS Max
FROM item;

CREATE VIEW purchase_order_overview AS
SELECT sales_order.purchase_order_number, customer.company,
product.supplier, product.name, item.price, sales_item.quantity,
(sales_item.quantity * item.price) AS Total,
CONCAT(sales_person.first_name, ' ', sales_person.last_name) AS SalesPersonName
FROM sales_order
JOIN sales_item ON sales_order.id = sales_item.sales_order_id
JOIN item ON item.id = sales_item.item_id
JOIN product ON product.id = item.product_id
JOIN customer ON customer.id = sales_order.customer_id
JOIN sales_person ON sales_person.id = sales_order.sales_person_id;

SELECT * FROM purchase_order_overview;

DROP VIEW IF EXISTS purchase_order_overview;

CREATE VIEW purchase_order_overview_updatable AS
SELECT sales_order.purchase_order_number, customer.company,
product.supplier, product.name, item.price, sales_item.quantity,
sales_person.first_name, sales_person.last_name
FROM sales_order
JOIN sales_item ON sales_order.id = sales_item.sales_order_id
JOIN item ON item.id = sales_item.item_id
JOIN product ON product.id = item.product_id
JOIN customer ON customer.id = sales_order.customer_id
JOIN sales_person ON sales_person.id = sales_order.sales_person_id;

SELECT * FROM purchase_order_overview_updatable;

SELECT *, (quantity * price) AS Total
FROM purchase_order_overview_updatable;

USE `Tutorial - sales_db`;
DROP PROCEDURE IF EXISTS get_customers;
CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customer;
END
CALL get_customers();

DROP PROCEDURE IF EXISTS get_supplier_value;
CREATE PROCEDURE get_supplier_value(IN supplier VARCHAR(30))
BEGIN
  DECLARE supplier_name VARCHAR(30);
  DECLARE price_sum DECIMAL(8,2);
  SELECT product.supplier, SUM(item.price)
  INTO supplier_name, price_sum
  FROM product INNER JOIN item
  ON product.id = item.product_id
  WHERE product.supplier = supplier
  GROUP BY product.supplier;
  SELECT CONCAT(supplier_name, ' Inventory Value: $', price_sum) As Output;
END
CALL get_supplier_value('Shoe Corp.');

DROP PROCEDURE IF EXISTS get_all_supplier_values;
CREATE PROCEDURE get_all_supplier_values()
BEGIN
  SELECT product.supplier, SUM(item.price)
  FROM product INNER JOIN item
  ON product.id = item.product_id
  GROUP BY product.supplier;
END
CALL get_all_supplier_values();

DROP PROCEDURE IF EXISTS get_customer_birthday;
CREATE PROCEDURE get_customer_birthday(
    IN p_birth_month INT,
    OUT p_bd_month INT, OUT p_db_day INT,
    OUT p_first_name VARCHAR(30), OUT p_last_name VARCHAR(30),
    OUT p_phone_num VARCHAR(20))
BEGIN
    SELECT MONTH(birth_date), DAY(birth_date), first_name, last_name, phone
    INTO p_bd_month, p_db_day, p_first_name, p_last_name, p_phone_num
    FROM customer
    WHERE MONTH(birth_date) = p_birth_month
    LIMIT 1;

    SELECT MONTH(birth_date), DAY(birth_date), first_name, last_name, phone
    FROM customer
    WHERE MONTH(birth_date) = p_birth_month;
END
CALL get_customer_birthday(3, @p_bd_month, @p_db_day, @p_first_name, @p_last_name, @p_phone_num);
SELECT @p_bd_month, @p_db_day, @p_first_name, @p_last_name, @p_phone_num;

DROP PROCEDURE IF EXISTS check_month_orders_IF;
CREATE PROCEDURE check_month_orders_IF(IN pin_month INT)
BEGIN
    DECLARE total_orders INT;
    SELECT COUNT(purchase_order_number) INTO total_orders
    FROM sales_order
    WHERE MONTH(time_order_taken) = pin_month;

    IF total_orders > 5 THEN
        SELECT CONCAT(total_orders, ' Orders: Doing Good') As Output;
    ELSEIF total_orders < 5 THEN
        SELECT CONCAT(total_orders, ' Orders: Doing Bad') As Output;
    ELSE
        SELECT CONCAT(total_orders, ' Orders: On Target') As Output;
    END IF;
END
CALL check_month_orders_IF(3);

DROP PROCEDURE IF EXISTS check_month_orders_CASE;
CREATE PROCEDURE check_month_orders_CASE(IN pin_month INT)
BEGIN
    DECLARE total_orders INT;
    SELECT COUNT(purchase_order_number) INTO total_orders
    FROM sales_order
    WHERE MONTH(time_order_taken) = pin_month;

    CASE
        WHEN total_orders < 1 THEN
            SELECT CONCAT(total_orders, ' Orders: Doing Bad') As Output;
        WHEN total_orders > 1 < 21 THEN
            SELECT CONCAT(total_orders, ' Orders: Doing OK') As Output;
        WHEN total_orders = 5 THEN
            SELECT CONCAT(total_orders, ' Orders: On Target') As Output;
        ELSE
            SELECT CONCAT(total_orders, ' Orders: Doing Good') As Output;
    END CASE;
END
CALL check_month_orders_CASE(3);

DROP PROCEDURE IF EXISTS while_loop_test;
CREATE PROCEDURE while_loop_test(IN i INT)
BEGIN
    DECLARE j INT DEFAULT 0;
    DECLARE total_sum INT DEFAULT 0;
    WHILE j < i DO
        SET total_sum = total_sum + j;
        SET j = j + 1;
    END WHILE;
    SELECT total_sum;
END
CALL while_loop_test(3);

DROP PROCEDURE IF EXISTS for_loop_test;
CREATE PROCEDURE for_loop_test(IN i INT)
BEGIN
    DECLARE j INT DEFAULT 0;
    DECLARE total_sum INT DEFAULT 0;
    REPEAT
        SET total_sum = total_sum + j;
        SET j = j + 1;
    UNTIL j >= i
    END REPEAT;

    SELECT total_sum;
END
CALL for_loop_test(3);


DROP PROCEDURE IF EXISTS get_companies;
CREATE PROCEDURE get_companies(INOUT p_company_list VARCHAR(1000))
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE p_company_name VARCHAR(30) DEFAULT '';
    DECLARE company_cursor
        CURSOR FOR SELECT company FROM customer;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN company_cursor;
    get_company: LOOP
        FETCH company_cursor INTO p_company_name;
        IF finished = 1 THEN
            LEAVE get_company;
        END IF;
        SET p_company_list = CONCAT(p_company_name, ', ', p_company_list);
    END LOOP get_company;
    CLOSE company_cursor;
END

SET @p_company_list = ''
CALL get_companies(@p_company_list);
SELECT @p_company_list;

DROP PROCEDURE IF EXISTS create_product_type;
CREATE PROCEDURE create_product_type(IN prod_name VARCHAR(30), IN prod_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT CONCAT('You Tried to Use a Pre-Existing KEY: ', prod_id) AS Error;
    END;
    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        SELECT CONCAT('Unknown Error') as Error;
    END;
    INSERT INTO product_type(name, id)
    VALUES(prod_name, prod_id);
    SELECT * FROM product_type;
END;

CALL create_product_type('Business Casual', 2);

DROP PROCEDURE IF EXISTS insert_product_type;
CREATE PROCEDURE insert_product_type(IN prod_name VARCHAR(30), IN prod_id INT)
BEGIN
    DECLARE name_in_table INT;
    DECLARE duplicate_name CONDITION FOR SQLSTATE '50000';
    DECLARE EXIT HANDLER FOR duplicate_name
    BEGIN
        SELECT CONCAT('Duplicate Name: ', prod_name) AS Error;
    END;
    SET name_in_table = (SELECT COUNT(*) FROM product_type WHERE name = prod_name);
    IF name_in_table > 0 THEN
        SIGNAL duplicate_name;
    ELSE
        INSERT INTO product_type(name, id)
        VALUES(prod_name, prod_id);
        SELECT * FROM product_type;
    END IF;
END;

CALL insert_product_type('Business1', 4);

DROP PROCEDURE IF EXISTS insert_sales_item;
CREATE PROCEDURE insert_sales_item()
BEGIN
    DECLARE sql_error TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        SET sql_error = TRUE;
    START TRANSACTION;
        INSERT INTO sales_item
            VALUES(1, 1, 2, 0.45, 7.50, 5.00, 1),
                (2, 1, 3, 0.78, 10.00, 6.00, NULL),
                (3, 2, 1, 0.12, 15.00, 7.50, NULL);
        IF sql_error = FALSE THEN
            COMMIT;
            SELECT 'Sales Item Inserted';
        ELSE
            ROLLBACK;
            SELECT 'Sales Item NOT Inserted';
        END IF;
END;

CALL insert_sales_item();

DROP FUNCTION IF EXISTS get_order_total;
CREATE FUNCTION get_order_total(p_sales_order_id INT)
RETURNS DECIMAL(6,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE total DECIMAL(6,2);
    SELECT SUM(price * quantity) As Total INTO total
    FROM sales_item JOIN sales_order
    ON sales_item.item_id = sales_order.id
    JOIN item on item.id = sales_item.item_id
    WHERE sales_order.id = p_sales_order_id
    GROUP BY sales_order.id
    ORDER by sales_order.id;
    RETURN total;
END;

SELECT sales_order.id, get_order_total(sales_order.id) AS Total
FROM sales_order
ORDER BY sales_order.id;

DROP PROCEDURE IF EXISTS customer_in_db;
CREATE PROCEDURE customer_in_db(f_name VARCHAR(30), l_name VARCHAR(30))
BEGIN
    DECLARE match_found INT;
    SELECT COUNT(*) INTO match_found
    FROM customer
    WHERE first_name = f_name AND last_name = l_name;
    IF match_found > 0 THEN
        SIGNAL SQLSTATE '50000'
        SET MESSAGE_TEXT = 'Customer Already Exists';
    END IF;
END;

CREATE TRIGGER customers_before_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
    CALL customer_in_db(NEW.first_name, NEW.last_name);
END;

INSERT INTO customer(first_name, last_name)
    VALUES('Stephen', 'Giang');