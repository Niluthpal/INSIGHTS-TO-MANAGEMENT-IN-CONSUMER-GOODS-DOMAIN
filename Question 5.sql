select dp.product_code,product,fmc.manufacturing_cost
from dim_product dp
join fact_manufacturing_cost fmc
on dp.product_code=fmc.product_code
where manufacturing_cost 
in (
	select max(manufacturing_cost) from fact_manufacturing_cost
    union
    select min(manufacturing_cost) from fact_manufacturing_cost )
order by manufacturing_cost desc;