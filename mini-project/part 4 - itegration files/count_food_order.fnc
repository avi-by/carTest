create or replace function count_food_order(food in varchar) return integer is
  counter integer;
  cursor c is 
  select foodname,count(foodname) as counter 
  from integration_food_customer
  group by foodname;
begin
 counter:=0;
  for i in c
    loop
    if i.foodname = food then
      return(i.counter);
      end if;
      end loop;
  return(counter);
end count_food_order;
/
