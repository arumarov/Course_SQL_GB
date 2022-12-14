CREATE DATABASE homework_6;

use homework_6;

/* 1. Создайте функцию, которая принимает кол-во сек и 
форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' */

DELIMITER $$
CREATE FUNCTION times(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE hour INT DEFAULT 0;
DECLARE minute INT DEFAULT 0;
DECLARE second INT DEFAULT 0;
DECLARE day INT DEFAULT 0;
DECLARE result VARCHAR(100) DEFAULT "";
SET day = num/(24*3600);
SET num = num%(24*3600);
SET hour = num/3600;
SET num = num%3600;
SET minute = num/60;
SET num = num%60;
SET second = num;
SET result = CONCAT(day, "  days", hour, " hours", minute, " minutes", second, " seconds");
RETURN result;
END $$
DELIMITER $$;

SELECT times(123456);
