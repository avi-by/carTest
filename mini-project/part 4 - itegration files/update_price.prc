create or replace procedure update_price(maxp in integer,minp in integer) is
begin
update integration_food_customer
set price = minp
where price < minp;
update integration_food_customer
set price = maxp
where price > maxp;
commit;  
end update_price;
/
