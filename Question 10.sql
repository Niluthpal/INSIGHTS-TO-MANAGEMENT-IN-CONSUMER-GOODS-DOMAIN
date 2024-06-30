with total_quantity as (
select division,dp.product_code,product,sum(sold_quantity)  as total_sold_quantity
from dim_product dp
join fact_Sales_monthly fsm
on dp.product_code=fsm.product_code
where fiscal_year = "2021"
group by division,dp.product_code,product),

`rank` as (
select *, rank() over(partition by division order by total_sold_quantity desc) as rank_order
from total_quantity)

select * from `rank`
where rank_order <=3;