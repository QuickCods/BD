--1
select * from CUSTOMER
where Country = 'France'
order by Name;

--2
select Title, Year
from MOVIE
where Title LIKE '%Spider-Man%'
order by Year;

--3
select Country, COUNT(Country) AS NumClient
from CUSTOMER
group by Country
order by NumClient DESC;

--4
select d.Name, s.Name
from DEPARTMENT d INNER JOIN STAFF s
on d.Manager = s.StaffId
order by d.Name;
-- select d.Name, s.Name
-- from DEPARTMENT d, STAFF s
-- where d.Manager = s.StaffId
-- order by d.Name;

--5
select g.Label, COUNT(mg.GenreId) AS NumMovies
from GENRE g, MOVIE_GENRE mg
where g.GenreId = mg.GenreId
group by g.Label
order by g.Label;

--6
select m.Title, m.Year
from MOVIE m INNER JOIN MOVIE_ACTOR ma INNER JOIN ACTOR a
on m.MovieId = ma.MovieId
and ma.ActorId = a.ActorId
where m.Year > 2009
and a.Name = 'Brad Pitt'
order by m.Year;

--7
select m.Title, m.Year, COUNT(s.CustomerId) AS Views, SUM(s.Charge) AS Cobras
from MOVIE m INNER JOIN MOVIE_ACTOR ma
INNER JOIN ACTOR a
INNER JOIN STREAM s
on m.MovieId = ma.MovieId
and ma.ActorId = a.ActorId
and m.MovieId = s.MovieId
where m.Year > 2009
and a.Name = 'Brad Pitt'
group by m.Title, m.Year
order by m.Year;

--8
select m.Title, m.Year
from MOVIE m INNER JOIN MOVIE_GENRE mg
INNER JOIN GENRE g
on m.MovieId = mg.MovieId
and mg.GenreId = g.GenreId
where g.Label = 'Musical'
order by m.Year;

--9
select r.Name, s.Name
from REGION r INNER JOIN STAFF s
on r.RegionManager = s.StaffId
order by r.Name;
