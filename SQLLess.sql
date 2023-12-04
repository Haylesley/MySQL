-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS format_seconds;

DELIMITER //
CREATE FUNCTION format_seconds(seconds INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;

    SET days = seconds DIV 86400;
    SET seconds = seconds % 86400;

    SET hours = seconds DIV 3600;
    SET seconds = seconds % 3600;

    SET minutes = seconds DIV 60;
    SET seconds = seconds % 60;

    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
END //
DELIMITER ;

SELECT format_seconds(2213332);

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

SELECT number
FROM (
    SELECT 1 AS number UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5 UNION ALL
    SELECT 6 UNION ALL
    SELECT 7 UNION ALL
    SELECT 8 UNION ALL
    SELECT 9 UNION ALL
    SELECT 10
) AS numbers
WHERE number % 2 = 0;

