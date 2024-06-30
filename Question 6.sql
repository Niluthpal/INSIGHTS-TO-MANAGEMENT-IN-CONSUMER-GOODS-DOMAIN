select dc.customer_code,customer,round(avg(pre_invoice_discount_pct),2) 
as average_discount_percentage
from dim_customer dc
join fact_pre_invoice_deductions pid
on dc.customer_code=pid.customer_code
where fiscal_year = "2021" and
market = "India"
group by dc.customer_code,customer
order by average_discount_percentage desc
limit 5;
