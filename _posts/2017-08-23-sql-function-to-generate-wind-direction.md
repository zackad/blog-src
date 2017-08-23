---
layout: post
title: SQL Function to Generate Wind Direction
---
Based on [Robert Sharp][so-answer] answer on [stack overflow question][so-question], this function is tested on MySQL version 5.7.

```sql
DELIMITER //

-- Using single parameter to determine wind direction name
-- with number in decimal degree or integer
CREATE FUNCTION `get_wind_direction`(`number` DOUBLE)
    -- Return value as varchar
    RETURNS varchar(5) CHARSET utf8
    LANGUAGE SQL
    DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SET `number` = `number` % 360;
return case
        when `number` between 0 and 11.25 then 'N'
        when `number` between 11.25 and 33.75 then 'NNE'
        when `number` between 33.75 and 56.25 then 'NE'
        when `number` between 56.25 and 78.25 then 'ENE'
        when `number` between 78.25 and 101.25 then 'E'
        when `number` between 101.25 and 123.75 then 'ESE'
        when `number` between 123.75 and 146.25 then 'SE'
        when `number` between 146.25 and 168.75 then 'SSE'
        when `number` between 168.75 and 191.25 then 'S'
        when `number` between 191.25 and 213.75 then 'SSW'
        when `number` between 213.75 and 236.25 then 'SW'
        when `number` between 236.25 and 258.75 then 'WSW'
        when `number` between 258.75 and 281.25 then 'W'
        when `number` between 281.25 and 303.75 then 'WNW'
        when `number` between 303.75 and 326.25 then 'NW'
        when `number` between 326.25 and 348.75 then 'NNW'
        else 'N'
    end;
END //
DELIMITER ;
```

Example :

```sql
mysql> select get_wind_direction(123);
+-------------------------+
| get_wind_direction(123) |
+-------------------------+
| ESE                     |
+-------------------------+
1 row in set (0,00 sec)

mysql> select get_wind_direction(32.54);
+---------------------------+
| get_wind_direction(32.54) |
+---------------------------+
| NNE                       |
+---------------------------+
1 row in set (0,00 sec)


```

[so-answer]: https://stackoverflow.com/a/39277268/6265296
[so-question]: https://stackoverflow.com/questions/14736464/determining-cardinal-compass-direction-between-points
