--sample user

insert into users(name,email) values
('Pratham','pratham17@gmail.com'),
('Chintu','chintu17@gmail.com'),
('Chetan','chetan17@gmail.com'),
('Nishant','nishant17@gmail.com')


--Sample orders

insert  into orders(user_id,total_amount) values
(1,3000.00),
(2,4500.00),
(4,2000.00),
(1,10000.00)


-- sample order items

insert into order_items (order_id,product_name,quantity,price) values
(1,'Shirt',2,1500),
(2,'Pant',2,2000),
(2,'belt',1,500),
(4,'Shoe',1,2500),
(1,'Nike Shoe',1,6000),
(1,'joggers',2,4000)

select * from users;
select * from order_items oi ;
select * from orders;

select distinct(name) from users u  join orders o on u.id = o.user_id order by 1 desc;

select distinct(name) from users u left join orders o on u.id = o.user_id where o.id is null  order by 1 desc;

select u.id,u.name, sum(o.total_amount ::numeric) as totalamount from users u join orders o on u.id = o.user_id 
group by u.id,u.name order by 2 desc;

select u.id, sum(o.total_amount ::numeric) as totalamount from users u join orders o on u.id = o.user_id 
group by u.id order by 2 desc limit 2;


--greater than avg
--simple way
select * from orders where total_amount > (select avg(total_amount) from orders);

--using join with subquery
select u.name, o.total_amount  
from users u
join orders o
on u.id = o.user_id 
join(select avg(total_amount) as total_amount  
from orders)
avg_table
 on o.total_amount > avg_table.total_amount 

 --having 
 
select u.name ,o.total_amount 
from users u 
join orders o
on u.id = o.user_id 
group by u.name , o.total_amount 
having o.total_amount >(
select avg(	total_amount) from orders);


