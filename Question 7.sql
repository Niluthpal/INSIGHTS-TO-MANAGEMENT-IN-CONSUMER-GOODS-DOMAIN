select monthname(fsm.date)  as `month`,year(fsm.date) as year ,
       concat(round(sum(gross_price*sold_quantity)/1000000,2)," ","M") as gross_sales_amount
from fact_sales_monthly fsm
join dim_customer dc
on fsm.customer_code = dc.customer_code 
join fact_gross_price fgp
on fsm.product_code=fgp.product_code
where dc.customer = 'Atliq Exclusive'
group by `month`,year(fsm.date) 
order by year(fsm.date);