select avg(counto.counto) as avg_of_orders ,counto.customer_membership
from     
    (select count(co.orderid) as counto,co.customerid,co.customer_membership
    from
    (select customer.customerid,customer.customer_membership,orders.orderid
    from customer inner join orders on customer.customerid=orders.customerid) co
    group by co.customerid, co.customer_membership) counto
    group by counto.customer_membership
