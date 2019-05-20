select avg(tmp.counto) as avg_of_tickets, tmp.customer_membership
from 
(select count(tc.ticketid) as counto,tc.customerid,tc.customer_membership
          from
                  (select co.*,tickets.ticketid
                  from           
                        (select customer.customerid,customer.customer_membership,orders.orderid
                        from 
                                customer inner join orders on customer.customerid=orders.customerid) co
                  inner join tickets on co.orderid = tickets.orderid) tc
          group by tc.customerid, tc.customer_membership)tmp
          group by tmp.customer_membership
