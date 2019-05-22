SELECT m.Title, SUM(s.Charge) AS Xmoney
FROM MOVIE m, STREAM s, MOVIE_GENRE mg, GENRE g
WHERE m.MovieId = s.MovieId
AND mg.MovieId = m.MovieId
AND s.MovieId = mg.MovieId
AND g.GenreId = mg.GenreId
AND g.Label = 'Action'
GROUP BY m.Title
ORDER BY Xmoney DESC, m.Title
LIMIT 20;
