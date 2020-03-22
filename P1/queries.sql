SELECT CONCAT(first,' ',last) AS query1 FROM
MovieActor,Actor,Movie
WHERE Movie.title = 'Die Another Day'
AND Movie.id = MovieActor.mid
AND MovieActor.aid = Actor.id;

-- Joins Actor and MovieActor and Movie only keeps tuples with matching actor ids and a movie id of
-- 'Die Another Day'. Then concatenates the first and last names of the tuple, giving the full
-- names of all the actors in 'Die Another Day'

SELECT count(*) as query2 from
(SELECT aid from MovieActor
group by aid
having count(aid) >1) as actor_number ;

-- find the actor who has acted in multiple movies, find aid in movieactors where aid is larger than 1 which means the actor has more than one movie.

SELECT title  as query3 from
Movie,Sales
WHERE Movie.id = Sales.mid
AND Sales.ticketsSold>1000000;

-- find the movie names by joining sale and movie to fin
-- d an id that has ticketssold larger than 1000000

SELECT distinct(CONCAT(first,' ',last)) AS  query4 FROM
Director, MovieDirector
WHERE MovieDirector.did = Director.id
AND MovieDirector.did =
        (SELECT distinct(did) FROM MovieDirector group by did
        having count(mid) = (select count(mid) from MovieDirector
        group by did order by count(mid) desc limit 1 ));


SELECT count(aid) as query5 from
(SELECT aid from MovieActor M
group by aid
having count(aid) = 1) as actor_number_5 ;
-- similar to query2 we just find aid that only appear once in movieactor, which means the actor only has one movie.
