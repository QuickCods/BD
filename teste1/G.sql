DELETE MOVIE_ACTOR FROM MOVIE_ACTOR NATURAL JOIN ACTOR
WHERE ACTOR.Name LIKE "Tom%";

-- DELETE MOVIE_ACTOR FROM MOVIE_ACTOR INNER JOIN ACTOR
-- ON MOVIE_ACTOR.ActorId = ACTOR.ActorId
-- WHERE ACTOR.Name LIKE "Tom%";
