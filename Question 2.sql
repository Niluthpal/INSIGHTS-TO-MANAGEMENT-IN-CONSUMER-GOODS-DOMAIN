with unique_products as (
select 
count(distinct case when fiscal_year = "2020" 
then dp.product_code end )  as  unique_product_2020,
count(distinct case when fiscal_year = "2021" 
then dp.product_code end )  as  unique_product_2021
from dim_product dp
join fact_gross_price gp 
on dp.product_code=gp.product_code
where fiscal_year in (2020,2021))

select *,round(100*(unique_product_2021-unique_product_2020)/unique_product_2020,2) as percentage_change
from unique_products;