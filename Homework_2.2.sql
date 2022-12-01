use homework_2;

CREATE TABLE orders
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(3) NOT NULL,
    amount DECIMAL(6,2) NOT NULL,
    order_status VARCHAR(10) NOT NULL
);


INSERT orders(employee_id, amount, order_status)
VALUES ("e03", 15.00, "OPEN"), ("e01", 25.50, "OPEN"), ("e05", 100.70, "CLOSED"), ("e02", 22.18, "OPEN"), ("e04", 9.50, "CANSELLED");

ALTER TABLE orders
ADD full_order_status VARCHAR(30);

SELECT  order_status,
CASE order_status
	WHEN "OPEN" THEN "Order is in open state"
    WHEN "CLOSED" THEN "Order is closed"
    ELSE "Order is cancelled"
END as full_order_status
FROM orders;
