create table if not exists `PASSENGER`(
	`Passenger_name` varchar(30),
    `Category` varchar(10) ,
	`Gender` varchar(10),
	`Boarding_City` varchar(30),
    `Destination_City` varchar(30),
    `Distance` int,
    `Bus_Type` varchar(30)
    
);
create table if not exists `PRICE`(
	`Bus_Type` varchar(30),
    `Distance` int,
	`Price` int
	);
commit;
select * from price;
select * from passenger;



