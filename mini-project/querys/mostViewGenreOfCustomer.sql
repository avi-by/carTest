select cg.customerid,cg.genre,cg.count
from 
      (select max(cg.count) as max,cg.customerid
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
              group by otm.customerid,otm.genre)cg
      where cg.customerid=cg.customerid
      group by cg.customerid)mc 
inner join
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
              group by otm.customerid,otm.genre)cg
on cg.customerid=mc.customerid and cg.count=mc.max


          
