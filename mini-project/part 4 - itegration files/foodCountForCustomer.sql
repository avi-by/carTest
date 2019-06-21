select *
from
(select cf.customerid,foodname,counted
from
          (select customerid,max(counted) as maxfood 
          from
                  (select customerid,foodname,count(foodid) as counted 
                  from integration_food_customer  
                  group by customerid,foodname) cf
          group by customerid)cm,
          
          (select customerid,foodname,count(foodid) as counted 
          from integration_food_customer  
          group by customerid,foodname) cf
where cf.customerid=cm.customerid and cf.counted=cm.maxfood)f natural join customer
