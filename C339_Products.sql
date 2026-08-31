select database();

create database Products;
use Products;

create table prod(prod_id varchar(10) primary key,
prod_name varchar(20),category varchar(20),price float);

insert into prod values('P001','Laptop','Electronics',25000),
('P002','Mobile','Electronics',20000),
('P003','Table','Furniture',7000),
('P004','Chair','Furniture',500),
('P005','Pen','Stationary',150);

select * from prod;

-- Only Products
select prod_name from prod;

select * from prod where price<>20000;

select * from prod where category='Furniture' and 
price>1000;

select * from prod where category='Furniture' or 
price>1000;

select * from prod where category!='Furniture';
select * from prod where not category='Furniture';


select * from prod where prod_id ='P001' or prod_id='P003';
select * from prod where prod_id in('P001','P003');
select * from prod where prod_id not in('P001','P003');




desc prod;

select * from prod;

select * from prod where prod_name like '%L';




select * from prod where price>=20000 and price<=25000;

select * from prod where price between 20000 and 25000;


select prod_name from prod order by prod_name;
select * from prod order by category desc,price asc;

select * from prod where prod_id not in('P002','P004');

select * from prod;

select category from prod;
select distinct category from prod;

insert into prod values('P006','Pencil','Stationary',null);

-- Missing price
select * from prod where price is null;
select * from prod where price is not null;

select * from prod limit 2;
select * from prod limit 2 offset 2;

use sakila;

select city from city;

select * from city limit 20 offset 30;

select * from city limit 30,20;


select * from city where city like 'S%';
select * from city where city like '%S';
select * from city where city like '__M%';
select * from city where city like '%pol%';
select * from city where city like 'S__M%';


use products;

select * from prod;

-- WHEN bio IS NULL THEN 'Incomplete Profile'


SELECT 
prod_id,
prod_name,
price,
CASE
   when price>12000 then "Best"
   when price >10000 then "Average"
   ELSE 'Low'
END AS Status
FROM prod;



SELECT 
prod_id,
prod_name,
price,
CASE
when price is null then 0
   when price>12000 then "Best"
   when price >10000 then "Average"
   ELSE 'Low'
END AS Status
FROM prod;


-- Window Functions

select prod_name,price,
sum(price) over() as "TotPrice"
from prod;

select prod_name,price,
avg(price) over() as "AvgPrice"
from prod;

select prod_name,price,
sum(price) over() as "TotPrice"
from prod;

select prod_name,price,
count(price) over() as "TotPrice count"
from prod;

select prod_name,price,
max(price) over() as "MaxPrice"
from prod;


select prod_name,price,
row_number() over() as "Row Order"
from prod;

update prod set price=20000 where prod_id='P003';

select * from prod;

select prod_name,price,
rank() over(order by price desc) as "Ranks"
from prod;

select prod_name,price,
dense_rank() over(order by price desc) as "Ranks"
from prod;

select prod_name,category,price,
dense_rank() over(partition by category order by price desc) as "Ranks"
from prod;

select * from prod;

select prod_name,price,category,
rank() over(order by price desc) as "Ranks"
from prod;


use products;

show tables;
select prod_name as Productname from prod;
select * from prod where length(prod_name)=5;

select * from prod where length(prod_name)>5 and length(prod_name)<=7;

select prod_name,price from prod;

select distinct 
category from prod;

select count(category) from prod;
select count(distinct category) as No_of_Category from prod;


alter table prod add column discount decimal(7,2);

select * from prod;
update prod set discount=price*10/100 ;
update prod set discount=price*10/100 where category='Furniture';

alter table prod change column prod_name Productname varchar(20);


use bankingdb;

select * from Accounts order by balance desc limit 2;
select * from Accounts order by balance desc limit 1 offset 1;

select * from Accounts;









use products;
select * from prod;

select sum(price) as Total_Amount from prod;
select avg(price) as Average_Amount from prod;
select count(price) as "Total number of products" from prod;
select min(price) as Min_Amount from prod;
select max(price) as Max_Amount from prod;


select category,sum(price) as Total_Amount from prod group by category;
select category,avg(price) as Total_Amount from prod group by category;
select category,count(price) as Total_Amount from prod group by category;
select category,max(price) as Total_Amount from prod group by category;
select category,min(price) as Total_Amount from prod group by category;


select category,sum(price) as TP from prod group by category having
sum(price)>40000;

select category,sum(price) as TP from prod group by category having
TP<40000;

select category,count(*) as Total_Amount from prod group by category;

delete from prod where prod_id='P005';

select category,count(*) as TC from prod group by category having
TC=2;


-- Math Functions
select sqrt(81);
select ceil(9.2);
select floor(9.2);
select round(1.23456,2);
select round(1.2978,2);
select power(5,2);
select pow(2,3);

select abs(-5);

select 5%2;
select mod(6,4) as 'modulous value';


-- String Functions

select length('Hello');
select upper("sql");
select lower("SQl");

select substring("Microsoft Excel",3);
-- Partname
select substring("Microsoft Excel",1,5);
select right("Microsoft Excel",4);
select left("Microsoft Excel",4);

-- select " hello";
select trim("         hello");
select reverse("Hai");

-- String
select concat("Hari","Boopal");
select concat("Hari",' ' ,"Boopal");
select replace("MySQL","M","K");

-- Math
select sin(90);
select cos(90);
select tan(90);
select log10(100); 
select log2(8);

SELECT CONCAT(
UPPER(LEFT(empname, 1)),
LOWER(RIGHT(empname, LENGTH(empname) - 1))
) AS capitalized_name
FROM emp;

SELECT CONCAT(
UPPER(LEFT("hari", 1)),
LOWER(RIGHT("hari", LENGTH("hari") - 1))
) AS capitalized_name;






select now();
select curdate();
select curtime();
select year(curdate());
select month(curdate());
select day(curdate());
select hour(now());
select minute(now());
select second(now());
select date_add(curdate(),interval 7 day);
select date_add(curdate(),interval 7 month);
select date_add(curdate(),interval 3 year);
select date_add(curdate(),interval -7 day);
select date_add(curdate(),interval -7 month);
select date_add(curdate(),interval -3 year);
select date_sub(curdate(),interval 3 day);


select date_format(curdate(),'%d-%m-%Y');
select dayname(curdate());
select monthname(curdate());



SELECT CONCAT(
UPPER(LEFT(empname, 1)),
LOWER(RIGHT(empname, LENGTH(empname) - 1))
) AS capitalized_name
FROM emp;




select monthname(curdate());
select dayname(curdate());

select timestampdiff(year,'2007-09-19',curdate());
select timestampdiff(month,'2007-09-19',curdate());
select timestampdiff(day,'2007-09-19',curdate());

-- Date Functions - These functions analyze dates and time.
SELECT
CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

SELECT
CustomerID,
month(DateOfBirth) AS BirthMonth
FROM customers;

SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- Comparision Functions
-- Categorize customers as Adult or Young based on their birth year.

SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

select * from customers;

update customers set phone=null where customerID=103;
select * from customers;

select firstname,ifnull(phone,"Not Available") as Phone from customers;

select max(DateofBirth) from customers;

select greatest(DateofBirth,2) from customers;

select * from customers;

-- select greatest("Hello","Hi","Helcome");
select least("Hello","Hi","Welcome");
Select ascii('$');

select greatest('1999-09-08','1999-12-04');
select least('1999-09-08','1999-12-04');

SELECT
    FirstName,
    NULLIF(FirstName,'Priyaa') AS Result
FROM Customers;

select * from customers;




select * from customers;
select * from Accounts;






















select empname,timestampdiff(month,doj,now()) as Month from employee;
select empname,timestampdiff(year,doj,now()) as Year from employee;
select empname,timestampdiff(day,doj,now()) as Days from employee;

select timestampdiff(day,'1997-05-03',now());
