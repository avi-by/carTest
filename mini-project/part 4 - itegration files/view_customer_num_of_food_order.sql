create view customer_num_of_food_order as
select *
from
(select customerid, count (foodname) as num_of_food_orders
from integration_food_customer 
group by customerid) cnnatural natural join customer
where customer.customer_registration_date> to_date('01/01/2010','dd/mm/yyyy')
