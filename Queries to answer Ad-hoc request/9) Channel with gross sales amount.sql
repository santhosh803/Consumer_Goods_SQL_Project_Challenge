-- 9) Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
-- The final output contains these fields, 
-- 			channel 
-- 			gross_sales_mln percentage

with gross_sales as (
	select 
		channel,
		round(sum(s.sold_quantity * g.gross_price)/1000000, 2) as gross_sales_mln
	from 
		fact_sales_monthly s
	join 
		fact_gross_price g
	on 
		s.product_code=g.product_code and s.fiscal_year=g.fiscal_year
	join 
		dim_customer c using (customer_code)
	where 
		s.fiscal_year = 2021
	group by channel)

select 
	*,
	round(gross_sales_mln/sum(gross_sales_mln) over() * 100, 2) as percentage
from 
	gross_sales
order by gross_sales_mln desc