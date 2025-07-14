create database zepto_company;
use zepto_company;

#-----Data Exploration------------------------

#1. count of rows
select count(*) from zepto_company.zepto_v2;

#2. Zepto company Data
select * from zepto_company.zepto_v2
limit 10;

#checking the null values.
select * from zepto_v2
where Category is null
or
name is null
or
mrp is null
or
discountPercent is null
or 
availableQuantity is null
or 
discountedSellingPrice is null
or
weightInGms is null
or 
outOfStock is null
or
quantity is null; 

# Data Analysis & Insights
#1. Different Product Category?

select distinct(Category) as Product_Category from zepto_v2
order by Product_Category;

#2. Product stock vs outofstock?
select count(Category) as Stock_Count,outOfStock  from zepto_v2
group by outOfStock;

#3. Product name present mutiple times?
select distinct(name), availableQuantity as Available_Quantity from zepto_v2
order by name
limit 20;

#-------------------------Data Cleaning-----------------------------------------------------------
#1. Product with price = 0
select * from zepto_v2
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto_v2
where mrp = 0;

#Sql safe mode using the fix error.
set sql_safe_updates = 0;

#3. Convert paisa into rupees?
update zepto_v2
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

#-----------------Business Insights--------------------------------------

select * from zepto_v2 ;
#1. Find the top 10 best value product based on the discount percentage?
select name as Top_10_Product, discountPercent from zepto_v2
order by discountPercent desc
limit 10; 

#2. What are the product high mrp but out of stock?
select name as Product,mrp as High_MRP,outOfStock from zepto_v2
where mrp > 300
order by High_MRP desc;

#3. Calculate estimate revenue for each category?
select sum(discountedSellingPrice * availableQuantity) as Revenue, Category from zepto_v2
group by Category
order by Revenue desc;


#4. Find all product when mrp is greater than 500$ and discount is less than 10%?
select name,mrp,discountPercent,discountedSellingPrice from zepto_v2
where mrp > 500 and discountPercent < 10
order by mrp desc ;

#5. Identify the top5 categories offering the heighest average discount percentage?
select Category, round(avg(discountPercent),2) as Avg_higest_dis from zepto_v2
group by Category
order by Avg_higest_dis desc
limit 5;

#6. Find the price per gram for products above 100g and sort by best value?
select distinct(name) as Product, discountedSellingPrice, weightInGms,
round(discountedSellingPrice/weightInGms,2) as Price_per_gram from zepto_v2
where weightInGms>=100
order by Price_per_gram desc;

#7. Group the product into categories like low, median, bulk?
select name as Product, mrp, Category,
case when mrp < 100 then 'Low'
	when mrp < 200 then 'Median'
    else 'Bulk'
    end as Categories
    from zepto_v2;

#8. What is the total inventory weight per category?
select Category,sum(availableQuantity*weightInGms) as Total_Inventory from zepto_v2
group by Category
order by Total_Inventory desc;



