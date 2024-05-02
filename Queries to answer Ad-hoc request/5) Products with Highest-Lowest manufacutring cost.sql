-- 5) Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, 
-- 					product_code 
-- 					product manufacturing_cost

select 
	m.product_code,
    p.product,
    m.manufacturing_cost
from 
	fact_manufacturing_cost m
join 
	dim_product p using (product_code)
where 
	manufacturing_cost in (
		select max(manufacturing_cost) from fact_manufacturing_cost
		union
		select min(manufacturing_cost) from fact_manufacturing_cost)
order by 
	manufacturing_cost desc
    