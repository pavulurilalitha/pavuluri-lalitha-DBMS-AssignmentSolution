-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?

SELECT COUNT(CASE WHEN (Gender) = 'F' THEN 1 END) Female FROM passenger WHERE Distance >=600;

-- 4) Find the minimum ticket price for Sleeper Bus. 
select MIN(Price) FROM  PRICE WHERE bus_type='Sleeper';

-- 5) Select passenger names whose names start with character 'S' 
SELECT * FROM passenger WHERE Passenger_name LIKE 's%';

-- 6). Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output.

SELECT Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = p2.Distance and p1.Bus_type = p2.Bus_type;


-- 7). What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KMs. 

SELECT p1.Passenger_name, p1.Boarding_city, p1.Destination_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE p1.Distance = 1000 and p1.Bus_type = 'Sitting' and p1.Distance = 1000 and p1.Bus_type = 'Sitting';


-- 8). What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price FROM passenger p1, price p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;


-- 9).List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order

SELECT DISTINCT distance FROM passenger ORDER BY Distance desc;


-- 10). Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables.
SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;


-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise
CREATE PROCEDURE getDistance(out distance INT,inout price INT)
BEGIN
select distance,price from price
case when price>1000 then 'expensive'
when price between 500 and 1000 then 'Average' 
when price < 500 then 'Cheap' end As category from price
	
END$$
DELIMITER ;

call getDistance(@distance,1000);





