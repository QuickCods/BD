SELECT m.Title, COUNT(s.MovieId)
FROM MOVIE m, STREAM s
WHERE m.MovieId = s.MovieId
GROUP BY m.Title
order by COUNT(s.MovieId) DESC, m.Title;
