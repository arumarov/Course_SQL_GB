USE homework_1;
/* 1. Выведите название, производителя и цену для товаров, 
количество которых превышает 2 (SQL - файл, скриншот, либо сам 
код) */
SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductCount > 2;

# 2. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM phones
WHERE Manufacturer = "Samsung";

# 3. С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE”)
# 3.1. Товары, в которых есть упоминание "Iphone"
SELECT *
FROM phones
WHERE ProductName LIKE "%iPhone%";

# 3.2. Товары, в которых есть упоминание "Galaxy"
SELECT *
FROM phones
WHERE ProductName LIKE "%Galaxy%";

# 3.3. Товары, в которых есть ЦИФРЫ
SELECT *
FROM phones
WHERE ProductName RLIKE "[0-9]";

# 3.4. Товары, в которых есть ЦИФРА "8"  
SELECT *
FROM phones
WHERE ProductName LIKE "%8%";