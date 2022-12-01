use homework_2;

CREATE TABLE sales
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT sales(order_date, count_product)
VALUES ("2022-01-01", 156), ("2022-01-02", 180), ("2022-01-03", 21), ("2022-01-04", 124), ("2022-01-05", 341);
    
ALTER TABLE sales
ADD order_type VARCHAR(30);

UPDATE sales
SET order_type = "Маленький заказ"
WHERE count_product < 100;

UPDATE sales
SET order_type = "Средний заказ"
WHERE count_product > 100 AND count_product < 300;

UPDATE sales
SET order_type = "Большой заказ"
WHERE count_product > 300;

SELECT * FROM sales;