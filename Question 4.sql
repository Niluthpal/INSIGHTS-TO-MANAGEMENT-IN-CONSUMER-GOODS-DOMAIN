with segemented_product_count as  (
select segment,
count(distinct case when fiscal_year = "2020" then dp.product_code end ) as product_count_2020,
count(distinct case when fiscal_year = "2021" then dp.product_code end ) as product_count_2021
from dim_product dp
join fact_gross_price gp
on dp.product_code=gp.product_code
group by segment)

select *, product_count_2021-product_count_2020 as difference
from segemented_product_count
order by difference desc;