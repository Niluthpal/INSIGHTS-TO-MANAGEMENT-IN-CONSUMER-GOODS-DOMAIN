with sold_quanity as (
select 
case
	 when month(Date) in (9,10,11) then "Q1"
     when month(Date) in (12,1,2) then "Q2"
     when month(Date) in (3,4,5) then "Q3" else "Q4"
end as quarters, sold_quantity
from fact_sales_monthly
where fiscal_year = "2020")

select quarters,sum(sold_quantity) as total_sold_quantity
from sold_quanity
group by quarters
order by total_sold_quantity desc;