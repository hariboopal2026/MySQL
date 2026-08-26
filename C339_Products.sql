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
