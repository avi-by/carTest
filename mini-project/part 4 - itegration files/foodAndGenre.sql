select fgc.*
from
(select genre,max(count) as cmax
from
(select foodname,genre,count(customerid) as count
from
(select cgg.*
from
(select customerid,max(count) as mcount
from
(select count(otm.ticketid) as count, otm.customerid,otm.genre
                  from  
                (select o.customerid,tm.ticketid,tm.genre
                      from orders o
                      inner join  (select t.ticketid,t.orderid,m.genre 
                                  from tickets t 
                                  inner join movies m 
                                  on t.movieid = m.movieid) tm
                      on tm.orderid =o.orderid) otm
              where otm.customerid=otm.customerid and otm.genre=otm.genre
              group by otm.customerid,otm.genre) m
              group by customerid)mv,(select count(otm.ticketid) as count, otm.customerid,otm.genre
                  from  
                (select o.customerid,tm.ticketid,tm.genre
                      from orders o
                      inner join  (select t.ticketid,t.orderid,m.genre 
                                  from tickets t 
                                  inner join movies m 
                                  on t.movieid = m.movieid) tm
                      on tm.orderid =o.orderid) otm
              where otm.customerid=otm.customerid and otm.genre=otm.genre
              group by otm.customerid,otm.genre) cgg
              where cgg.customerid=mv.customerid and cgg.count = mv.mcount) customergener natural join integration_food_customer
              group by foodname,genre) fgc
              group by genre)gc,(select foodname,genre,count(customerid) as count
from
(select cgg.*
from
(select customerid,max(count) as mcount
from
(select count(otm.ticketid) as count, otm.customerid,otm.genre
                  from  
                (select o.customerid,tm.ticketid,tm.genre
                      from orders o
                      inner join  (select t.ticketid,t.orderid,m.genre 
                                  from tickets t 
                                  inner join movies m 
                                  on t.movieid = m.movieid) tm
                      on tm.orderid =o.orderid) otm
              where otm.customerid=otm.customerid and otm.genre=otm.genre
              group by otm.customerid,otm.genre) m
              group by customerid)mv,(select count(otm.ticketid) as count, otm.customerid,otm.genre
                  from  
                (select o.customerid,tm.ticketid,tm.genre
                      from orders o
                      inner join  (select t.ticketid,t.orderid,m.genre 
                                  from tickets t 
                                  inner join movies m 
                                  on t.movieid = m.movieid) tm
                      on tm.orderid =o.orderid) otm
              where otm.customerid=otm.customerid and otm.genre=otm.genre
              group by otm.customerid,otm.genre) cgg
              where cgg.customerid=mv.customerid and cgg.count = mv.mcount) customergener natural join integration_food_customer
              group by foodname,genre) fgc
              where fgc.genre=gc.genre and fgc.count= gc.cmax
