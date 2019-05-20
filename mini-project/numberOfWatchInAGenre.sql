select count(mt.ticketid) as count, mt.genre
from
       (select tickets.ticketid,  movies.genre
               from movies inner join tickets
               on movies.movieid = tickets.movieid)mt
where mt.genre = mt.genre
group by mt.genre;
