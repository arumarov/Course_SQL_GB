CREATE DATABASE homework_5;

use homework_5;

CREATE TABLE cars
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(10),
    `Cost` VARCHAR(10)
);


INSERT INTO cars(Name, Cost)
VALUES
	("Audi", 52642),
    ("Mercedes", 57127),
    ("Skoda", 9000),
    ("Volvo", 29000),
    ("Bentley", 35000),
    ("Citroen", 21000),
    ("Hummer", 41400),
    ("Volkswagen", 21600);
    
  -- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW NewCars AS
 SELECT *
 FROM cars
 WHERE cost < 25000;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW NewCars AS
 SELECT *
 FROM cars
 WHERE cost < 30000;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW NewCars1 AS
 SELECT *
 FROM cars
 WHERE name = "Skoda" OR name = "Audi";

/* 4.Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы 
вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции 
LEAD . Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить 
результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу 
после нее. */

CREATE TABLE train
(
	`train_id_integer` INT NOT NULL,
    `Station_character_varying` VARCHAR(20),
    `Station_time_without_time_zone` TIME
);

INSERT INTO train(train_id_integer, Station_character_varying, Station_time_without_time_zone)
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
    (120, "San Jose", "13:30:00");
    
SELECT
	train_id_integer,
    Station_character_varying,
    Station_time_without_time_zone,
    TIMEDIFF
    (
    LEAD(Station_time_without_time_zone) OVER(PARTITION BY train_id_integer ORDER BY train_id_integer) AS "Time_to_Next_Station_Interval",
    "Station_time_without_time_zone"
    )
FROM train;