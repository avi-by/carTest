select * from 
                (select sum(t.ticketcost)-o.orderdiscount as sum,
                sum(t.ticketcost) as without_discount,
                o.orderdiscount as discount,count(t.ticketcost) as countOfTickets, 
                t.orderid ,o.customerid
                from tickets t, orders o 
                where o.orderid = t.orderid 
                group by t.orderid,o.orderdiscount,o.customerid) m
where m.sum>0;
