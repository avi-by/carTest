select price.customerid,price.price+sumtic.sum as finalsum
from 
(select customerid,sum(price) as price
from integration_food_customer
group by customerid)price,
(select sum(s.sum)as sum,
       c.customerid
      
                   from customer c,(select * from 
                                      (select distinct sum(t.ticketcost)-o.orderdiscount as sum, o.customerid,count(t.ticketid) as ticket_count
                                      from tickets t, orders o 
                                      where o.orderid = t.orderid 
                                      group by t.orderid,o.orderdiscount,o.customerid) m
                                      where m.sum>0) s
       where c.customerid=s.customerid
       group by c.customerid,
                c.customer_membership,
                c.customer_registration_date,
                c.customerphonenumber,
                c.customeremail) sumtic
  where price.customerid=sumtic.customerid              



