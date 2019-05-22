SELECT r.Name, g.Label, SUM(s.Charge) AS Profit, SUM(m.Duration) AS Tempo
FROM REGION r INNER JOIN COUNTRY c
INNER JOIN CUSTOMER co
INNER JOIN STREAM s
INNER JOIN MOVIE m
INNER JOIN MOVIE_GENRE mg
INNER JOIN GENRE g
ON r.RegionId = c.RegionId
AND c.Name = co.Country
AND co.CustomerId = s.CustomerId
AND s.MovieId = m.MovieId
AND m.MovieId = mg.MovieId
AND mg.GenreId = g.GenreId
GROUP BY r.Name, g.Label
ORDER BY r.Name ASC, g.Label ASC;
