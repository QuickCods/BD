SELECT r.Name, g.Label, SUM(s.Charge), SUM(m.Duration)
FROM GENRE g INNER JOIN MOVIE_GENRE mg
INNER JOIN MOVIE m
INNER JOIN STREAM s
INNER JOIN CUSTOMER c
INNER JOIN COUNTRY co
INNER JOIN REGION r
ON g.GenreId = mg.GenreId
AND mg.MovieId = m.MovieId
AND m.MovieId = s.MovieId
AND s.CustomerId = c.CustomerId
AND c.Country = co.Name
AND co.RegionId = r.RegionId
GROUP BY r.Name, g.Label
ORDER BY r.Name, g.Label;
