UPDATE STREAM s INNER JOIN MOVIE m ON s.MovieID = m.MovieId
INNER JOIN CUSTOMER c ON s.CustomerId = c.CustomerId
INNER JOIN COUNTRY co ON c.Country = co.Name
INNER JOIN REGION r ON co.RegionId = r.RegionId
SET s.Charge = s.Charge + 1.5
WHERE m.Duration >= 180
AND r.Name = 'Europe';
