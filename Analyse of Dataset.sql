                                --Query 1
/* Top 10 highest revenue genarating products*/

SELECT product_id, sum(sale_price) as revenue
FROM df_orders
group by product_id
order by revenue desc
LIMIT 10

                                --Query 2
/* Top 5 selling products in each region */
with top_sales as(
select region, product_id, sum(sale_price) as revenue
FROM df_orders
group by region, product_id
order by region, revenue desc
)
select * from(
select * , row_number() over (partition by region order by revenue desc) as rownum
from top_sales
) A
where rownum <=5 


                                --Query 3
/* month over month comparison*/
with year_sales as(
select EXTRACT(year from order_date) as years, EXTRACT(month from order_date) as months, sum(sale_price) as sales 
from df_orders
group by years, months

)

select months,
COALESCE(sum(case when years = 2022 then sales else 0 end), 0) as sales_2022,
COALESCE(sum(case when years = 2023 then sales else 0 end), 0) as sales_2023
from year_sales
group by months
order by months


                                --Query 4
/*Month with highest sales each category*/
with month_sales as (
select category, EXTRACT(month from order_date) as months, sum(sale_price) as sales 
from df_orders 
group by months, category
)
select * from(
select * ,
row_number() over (partition by category order by sales desc) as rownum
from month_sales
) a
where rownum = 1


                                --Query 5
/*subcategory with highest profit*/

with year_sales as(
select sub_category, EXTRACT(year from order_date) as years, sum(sale_price) as sales 
from df_orders
group by sub_category, years

),

CTE as (
select sub_category,
COALESCE(sum(case when years = 2022 then sales else 0 end), 0) as sales_2022,
COALESCE(sum(case when years = 2023 then sales else 0 end), 0) as sales_2023
from year_sales
group by sub_category
)

select *,
(sales_2023 - sales_2022)*100/sales_2022 as Growth
from CTE
order by Growth desc
LIMIT 1