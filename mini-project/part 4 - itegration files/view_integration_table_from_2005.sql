create or replace view integration_table_from_2005 as
select "CUSTOMERID","FOODID","FOODNAME","PRICE","CUSTOMER_MEMBERSHIP","CUSTOMER_REGISTRATION_DATE","CUSTOMERPHONENUMBER","CUSTOMEREMAIL"
from integration_food_customer natural join customer
where customer.customer_registration_date> to_date('01/01/2005','dd/mm/yyyy');
