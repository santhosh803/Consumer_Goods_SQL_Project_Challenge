-- 7) Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
-- The final report contains these columns: 
-- 			Month 
-- 			Year 
-- 			Gross sales Amount

select 
	monthname(date) as Month,
	s.fiscal_year as Year,
    concat(round(sum(sold_quantity * gross_price)/1000000, 2), "M") as "Gross Sales Amount"
from 
	fact_sales_monthly s
join 
	dim_customer c using (customer_code)
join 
	fact_gross_price g using (product_code)
where 
	customer = "Atliq Exclusive"
group by 
	Month, Year
order by Year