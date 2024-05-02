-- 4) Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?
-- The final output contains these fields, 
-- 						segment 
--                    	product_count_2020 
-- 						product_count_2021 
-- 						difference 

with product_count as (
	select 
		p.segment, 
		count(distinct case when s.fiscal_year = 2020 then product_code end) as product_count_2020,
		count(distinct case when s.fiscal_year = 2021 then product_code end) as product_count_2021
	from 
		dim_product p
	join 
		fact_sales_monthly s using (product_code)
	group by 
		segment)

select 	
	*,
    (product_count_2021 - product_count_2020) as difference
from 
	product_count
order by difference desc
    

