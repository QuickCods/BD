SELECT a.Name, COUNT(ma.ActorId)
FROM ACTOR a, MOVIE_ACTOR ma
WHERE a.ActorId = ma.ActorId
GROUP BY a.Name
HAVING COUNT(ma.ActorId) > 14
ORDER BY a.Name;
