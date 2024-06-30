with gross_sales as (
select `channel`,
round(sum(fgp.gross_price*fsm.sold_quantity)/1000000,2) as gross_sales_mln
from fact_sales_monthly fsm
join fact_gross_price fgp
on fsm.product_code=fgp.product_code
join dim_customer dc
on dc.customer_code=fsm.customer_code
where fsm.fiscal_year = 2021
group by `channel`
order by gross_sales_mln desc)

select
    `channel`,
    gross_sales_mln,
    concat(round((gross_sales_mln / SUM(gross_sales_mln) OVER ())*100,2)," ","%")  AS percentage
from
    gross_sales;