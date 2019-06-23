create or replace function favorite_food(id in integer) return varchar2 is
  FunctionResult varchar2(30);
  cursor c is
  select customerid,foodname,count(foodname) as counter
  from integration_food_customer
  group by customerid,foodname;
  counter integer;
begin
  counter :=0;
  for i in c
    loop
      if id = i.customerid and i.counter > counter then
        counter := i.counter;
        FunctionResult := i.foodname;
        end if;
        end loop;
  return(FunctionResult);
end favorite_food;
/
