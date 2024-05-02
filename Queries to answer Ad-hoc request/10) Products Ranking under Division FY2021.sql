-- 10) Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields, 
-- 		division 
-- 		product_code 
-- 		product 
-- 		total_sold_quantity 
-- 		rank_order


with product_ranking_under_division_FY21 as (
	select 
		division, 
		s.product_code,
		product,
		sum(sold_quantity) as total_sold_quantity,
		rank() over(partition by division order by sum(sold_quantity) desc) as rank_order
	from 
		fact_sales_monthly s
	join 
		dim_product p using (product_code)
    where 
		fiscal_year = 2021
	group by 
		division, s.product_code, product)
    
select
	*
from 
	product_ranking_under_division_FY21
where 
	rank_order<=3