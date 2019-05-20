select count(mt.ticketid) as count, mt.moviename,mt.movieid
from
       (select tickets.ticketid, movies.movieid, movies.moviename
               from movies left join tickets
               on movies.movieid = tickets.movieid)mt
where mt.movieid = mt.movieid
group by mt.moviename,mt.movieid
