
--create database
create database backend_sql_mastery;

--create table user
create table users(
id serial primary key,
name varchar(100) not null,
email varchar(100) not null,
created_at timestamp default current_timestamp);


--order table 
create table orders(
id serial primary key,
user_id int not null,
order_date timestamp default current_timestamp,
total_amount numeric(10,2) not null,
constraint fk_user
foreign key (user_id)
references users(id)
on delete cascade);


--order item table 
create table order_items(
id serial primary key,
order_id int not null,
product_name varchar(150) not null,
quantity int not null check (quantity > 0),
price numeric(10,2) not null check(price > 0 ),
constraint fk_order
foreign key (order_id)
references orders(id)
on delete cascade);


select * from order_items;
select * from orders;
select * from users;
