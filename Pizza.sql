SELECT * FROM [Pizza].[dbo].[pizza_sales]

--Total Revenue
select sum(total_price) as Total_revenue  from [Pizza].[dbo].[pizza_sales]

--Average Order Value
select (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value from [Pizza].[dbo].[pizza_sales]

--Total pizza's sold
select sum(quantity) as total_pizza_sold from [Pizza].[dbo].[pizza_sales]

--Orders placed
select count(distinct(order_id)) from [Pizza].[dbo].[pizza_sales]

--Average pizza per order
select (sum(quantity)/count(distinct(order_id))) from [Pizza].[dbo].[pizza_sales] 

--Daily Trend
SELECT DATENAME(weekday, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM [Pizza].[dbo].[pizza_sales]
GROUP BY DATENAME(weekday, order_date)
Order BY total_orders desc

--Hourly Trend
SELECT DATENAME(hour, order_time) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM [Pizza].[dbo].[pizza_sales]
GROUP BY DATENAME(hour, order_time)
Order BY total_orders desc

--percentage of sales by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [Pizza].[dbo].[pizza_sales]) AS DECIMAL(10,2)) AS PCT
FROM [Pizza].[dbo].[pizza_sales]
group by pizza_category
order by PCT desc

--percentage of sales by pizza size
SELECT pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [Pizza].[dbo].[pizza_sales]) AS DECIMAL(10,2)) AS PCT
FROM [Pizza].[dbo].[pizza_sales]
group by pizza_size
order by PCT desc

--total pizzas sold by the category
SELECT pizza_category, sum(quantity) as total
from [Pizza].[dbo].[pizza_sales]
group by pizza_category
order by total desc

--best 5 selling pizza
SELECT TOP 5 pizza_name, sum(quantity) as total
from [Pizza].[dbo].[pizza_sales]
group by pizza_name
order by total desc

--worst 5 worst selling pizza
SELECT TOP 5 pizza_name, sum(quantity) as total
from [Pizza].[dbo].[pizza_sales]
group by pizza_name
order by total asc