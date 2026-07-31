create database superstore;

use superstore;

select * from sales_data;

show tables;

rename table samplesuperstore_clean_data to sales_data;

select * from sales_data limit 10;

select * from sales_data;

desc sales_data;

select count(*)  as total_records from sales_data;

select count(distinct State) as total_states from sales_data;

select distinct state from sales_data order by state;

select count(distinct city) from sales_data;
select distinct state from sales_data order by state;

select * from sales_data where state = "California";

show columns from sales_data;

select round(sum(sales),2) as total_sales from sales_data;

select round(sum(profit),2) as total_profit from sales_data;

select count(*) as total_orders from sales_data;

select round(avg(sales),2) as avg_sales from sales_data;

-- max sales in which state
select round(sum(sales),2) as total_sales from sales_data group by state order by total_sales desc;

-- top 10 state

select state, round(sum(sales),2) as total_sales from sales_data group by state order by total_sales desc limit 10; 

select state, round(sum(sales),2) as total_sales from sales_data group by state order by total_sales desc;

-- max 5 
select state, round(sum(sales),2) as total_sales from sales_data group by state order by total_sales desc limit 5;

-- state wise  profit
select state, round(sum(profit),2) as total_profit from sales_data group by state order by total_profit desc ;

-- top 10 city by sales
select city, round(sum(sales),2) as total_sales from sales_data group by city order  by total_sales desc limit 10;

-- catogery performence
select category, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from sales_data group by category order by total_sales desc;


-- region performance
select region, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from sales_data
group by region order by total_sales desc;

-- category wise sales and profit
select category, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from sales_data
group by category order by total_sales desc;

--  sub-category performence
select `Sub-Category`, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from sales_data 
group by `Sub-Category` order by total_sales desc; 

-- segment performance 
select segment, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit from sales_data 
group by segment order by total_sales desc;
desc sales_data;
-- ship mode analysis
ALTER TABLE sales_data 
CHANGE COLUMN `ï»¿Ship Mode` `Ship Mode` VARCHAR(50);
select `Ship Mode`, count(*) as total_orders, round(sum(sales),2) as total_sales from sales_data 
group by `Ship Mode` order by total_orders desc ; 

-- state profit >10,000
select state, round(sum(profit),2) as total_profit from sales_data
group by state having sum(profit)>10000  order by total_profit desc;
 
-- catrgory sales >5,00,000
select category, round(sum(sales),2) as total_sales from sales_data 
group by category having sum(sales) > 500000 order by total_sales  desc; 

-- cities>100 orders
select city, count(*) as total_orders from sales_data 
group by city having count(*)>100 order by total_orders desc;

-- profit status
select 'order id' , sales, profit, 
case 
when profit > 0 then'Profit'
when profit < 0 then'Loss'
else 'No Profit No Loss'
end as profit_status from sales_data; 

-- profit and loss orders

select case
when profit >0 then 'Profit'
when profit <0 then 'Loss'
else 'No Profit No Loss'
end as profit_status,
count(*) as total_orders from sales_data group by profit_status ;

-- discount category 
select 'order id'discount,
case
when discount = 0 then 'No'
when discount <=0.2 then 'Low discount'
else 'High Discount'
end as discount_category from sales_data;

-- custmoer classify 
select sales,
case 
when sales >1000 then 'high value'
when sales >=500 then'medium value'
else 'low value'
end as sales_status from sales_data;

-- sales grater then avg. salary
select sales from sales_data where sales >
( select avg(sales) from sales_data);

-- profit greater then avg profit 
select profit from sales_data where profit >
(
select avg(profit) from sales_data
);

-- sales bleow then avg sales
select sales from sales_data where sales<
(
 select avg(sales) from sales_data
);

-- state having total sale greater than 50000
select state , round(sum(sales),2) as total_sales from sales_data
group by state having sum(sales)>50000 order by total_sales desc;

-- order with max profit
select * from sales_data order by profit desc limit 1;

-- order with min profit
select * from sales_data order by profit asc limit 1;

-- top 5 cities by profit 
select city, round(sum(profit),2) as total_profit from sales_data
 group by city order by total_profit desc limit 5;
 
 -- state having lose
 select state, round(sum(profit),2) as total_profit from sales_data
 group by state having sum(profit) < 0 order by total_profit;
 
 -- highest avg discount by category
 select category, round(avg(discount),2) as avg_discount from sales_data
 group by category order by avg_discount desc;
 
 -- highest avg discount by state 
 select state, round(avg(discount),2) as avg_discount from sales_data
 group by state order by avg_discount desc;
 
 -- top 10 state by quntity sold
 select state, sum(quantity) as total_quantity from sales_data
 group by state order by total_quantity desc limit 10;
 
 -- version check 
 select version();
 
 -- row numr() analysis
 select state, sales , row_number() over(order by sales desc) as row_num from sales_data;
 
 -- top 10 highest sale with row_num
 select state, sales, row_number() over(order by sales desc) as row_num from sales_data order by sales desc limit 10;
 
 -- dense rank analysis
 select state, sales, dense_rank() over(order by sales desc) 
as sales_rank from sales_data;


-- state wise total sales CTE
with state_sales as
(
select state, round(sum(sales),2) as total_sales
from sales_data group by state
) 
select * from state_sales order by total_sales desc;

with state_sales as
(
select state, round(sum(sales),2) as total_sales from sales_data group by state
)
 select * from state_sales  where total_sales >  100000;
 
 -- top 5 state_profit CTE
 with state_profit as
 (
 select state, round(sum(profit),2) as total_profit from sales_data group by state
 )
select * from state_profit order by total_profit desc limit 5;

-- sql views
 create view state_sales_view as select state,
 round(sum(sales),2) as total_sales from sales_data group by state;
 
 select * from state_sales_view;
