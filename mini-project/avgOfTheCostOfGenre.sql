select avg(mt.ticketcost) as avg, mt.genre
from
       (select tickets.ticketid,  movies.genre, tickets.ticketcost
               from movies inner join tickets
               on movies.movieid = tickets.movieid)mt
where mt.genre = mt.genre
group by mt.genre;

             
              
