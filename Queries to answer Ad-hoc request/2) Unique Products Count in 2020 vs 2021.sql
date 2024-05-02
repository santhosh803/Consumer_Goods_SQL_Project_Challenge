-- 2) What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
-- 			unique_products_2020 
-- 			unique_products_2021 
-- 			percentage_chg

with product_count as (
	select 
		count(distinct case when fiscal_year = 2020 then product_code end) as unique_products_2020,
		count(distinct case when fiscal_year = 2021 then product_code end) as unique_products_2021
	from
		fact_sales_monthly)
    
select 
	*,
    concat(
		round((unique_products_2021/unique_products_2020 * 100) - 100, 2),"%") as percentage_chg
from 
	product_count