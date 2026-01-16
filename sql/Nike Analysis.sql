select * from customer;
--1.Find totalrevenue for each region
select region,round(sum(revenue)::Numeric,2) as total_revenue
from customer
group by region order by total_revenue desc;
--2.Find the top 5 products based on profit
select * from customer 
order by profit desc 
limit 5;
--3.Find average sale for each product line
select product_line,round(avg(mrp)::Numeric,2) as Avg_mrp 
from customer
group by product_line;
--4.Find the products where discount is greater than 40 but profit is negative
select * from customer 
where (discount_applied*100)>40 and profit<0 order by profit;
--5.find the average mrp for each product line
select product_line,round(avg(mrp)::Numeric,2) as MRP
from customer
group by product_line;
--6.Display the total number of orders placed through each sales channel.
select sales_channel,count(order_id) as orders
from customer group by sales_channel;
--7.Show all orders where the product was sold online and the region is “Delhi”.
select * from customer where region='Delhi';
--8.For each Gender_Category, calculate the average Discount_Applied.
select gender_category ,round(avg(discount_applied)::Numeric,2)
from customer
group by gender_category;
--9.Identify products where MRP is higher than the overall average MRP and Units_Sold > 3.
select * from customer 
where mrp>(select avg(mrp) from customer) and units_sold>3;
--10.Identify the Product_Name with the highest total Units_Sold.
select product_name , sum(units_sold) as sale 
from customer group by product_name order by sale desc;