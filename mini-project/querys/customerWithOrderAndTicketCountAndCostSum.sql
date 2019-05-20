
select sum(s.sum)as sum,
       count(s.sum) as count_of_orders,
       sum(s.ticket_count) as ticket_count,
       c.customerid,
       c.customer_membership,
       c.customer_registration_date,
       c.customerphonenumber,
       c.customeremail
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
                c.customeremail;
    
