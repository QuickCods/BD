--1.1
/*1*/
 SELECT Nome, YEAR(DataNasc) FROM UTENTE;
/*2*/
SELECT Nome, MONTH(DataNasc), DAY(DataNasc)
FROM UTENTE
WHERE YEAR(DataNasc) > 2000;
/*3*/
SELECT Nome
FROM UTENTE
WHERE Nome LIKE 'Pedro%'
OR Nome LIKE '%Silva';
/*4*/
SELECT ISBN, Num, EmpUtente
FROM CÓPIA
WHERE EmpUtente IS NOT NULL AND EmpUtente > 1;
-- SELECT ISBN, Num, EmpUtente
-- FROM CÓPIA
-- WHERE NOT EmpUtente = 1;
/*5*/
SELECT CONCAT(Título, ', ', Editora, ', ', Ano, ', ', ISBN)
FROM LIVRO;

--1.2
/*1*/
UPDATE UTENTE
SET Email = UPPER(Email);
/*2*/
UPDATE CÓPIA
SET Estante = 'E99', Prateleira = Prateleira + 1
WHERE Estante LIKE 'E1%';

--2.1
/*1*/
Email VARCHAR(32) DEFAULT NULL,
/*2*/
Secção VARCHAR(3) NOT NULL DEFAULT 'L',
/*3*/
EmpUtente INT DEFAULT NULL,
EmpData DATE DEFAULT NULL,

--2.2
Num INT NOT NULL AUTO_INCREMENT,

--2.3
/*1*/
ALTER TABLE LIVRO
DROP COLUMN Editora;
/*2*/
ALTER TABLE LIVRO
ADD Conservação ENUM('Novo', 'Bom', 'Mau') NOT NULL DEFAULT 'Bom';

--2.4
ISBN BIGINT NOT NULL ON UPDATE CASCADE,

--3
/*1*/
select Nome
from AUTORES
order by Nome;
/*2*/
select distinct Nome
from AUTORES;
/*3*/
select Nome
from UTENTE
where Sexo = 'M'
order by DataNasc DESC;
/*4*/
select Nome
from UTENTE
where Sexo = 'F'
order by DataNasc DESC
limit 1;
/*5*/
select Num
from CÓPIA
where EmpUtente IS NOT NULL
order by ISBN, EmpUtente;
/*6*/
select DISTINCT ISBN
from CÓPIA
where EmpUtente IS NOT NULL;
/*7*/
select ISBN
from CÓPIA
order by EmpData DESC
limit 3;

--4
/*1*/
select SUM(Num)
from CÓPIA;
/*2*/
select SUM(Num)
from CÓPIA
where EmpUtente IS NOT NULL;
/*3*/
select ISBN, SUM(Num)
from CÓPIA
where EmpUtente IS NOT NULL
group by ISBN;
/*4*/
select ISBN, SUM(Num)
from CÓPIA
where EmpUtente IS NOT NULL
group by ISBN
having SUM(Num) > 1;
/*5*/
select MAX(EmpData)
from  CÓPIA
where EmpUtente IS NOT NULL
group by ISBN;
/*6*/
select AVG(TIMESTAMPDIFF(DAY, EmpData, NOW()))
from CÓPIA;
/*7*/
select ISBN, AVG(TIMESTAMPDIFF(DAY, EmpData, NOW()))
from CÓPIA
where EmpUtente IS NOT NULL
group by ISBN;

--5
/*1*/
select u.Nome, c.ISBN, c.Num, c.EmpData
from UTENTE u, CÓPIA c
where u.Num = c.EmpUtente
order by u.Nome;
/*2*/
select u.Nome, l.Título, c.Num, c.EmpData
from UTENTE u, CÓPIA c, LIVRO l
where u.Num = c.EmpUtente
and c.ISBN = l.ISBN
order by u.Nome, l.Título;
/*3*/
select l.Título, COUNT(c.ISBN) AS 'Cópias Totais',
COUNT(c.EmpUtente) AS 'Cópias emprestadas',
COUNT(c.ISBN)-COUNT(c.EmpUtente) AS 'Cópias disponíveis'
from LIVRO l, CÓPIA c
where c.ISBN = l.ISBN
group by l.Título
order by COUNT(c.ISBN), l.Título;

--6
/*1*/
select Título
from LIVRO
where ISBN
in (select ISBN
    from CÓPIA
    where EmpUtente IS NOT NULL);
/*2*/
select COUNT(u.Nome)
from UTENTE u
where EXISTS (select ISBN
              FROM CÓPIA
              WHERE EmpUtente = u.Num);
/*3*/
/*4*/

--7
/*1*/
/*2*/
/*3*/
/*4*/

--8
/*1*/
select u.Nome, l.Título
from UTENTE u INNER JOIN CÓPIA c
INNER JOIN LIVRO l
ON u.Num = c.EmpUtente
AND c.ISBN = l.ISBN
order by u.Nome, l.Título;
-- select u.Nome, l.Título
-- from UTENTE u INNER JOIN CÓPIA c
-- INNER JOIN LIVRO l
-- ON u.Num = c.EmpUtente
-- AND c.ISBN = l.ISBN
-- where EmpUtente IS NOT NULL
-- order by u.Nome, l.Título;
/*2*/
select u.Nome, SUM(c.EmpUtente)
from CÓPIA c NATURAL JOIN UTENTE u
group by u.Nome
order by u.Nome;
/*3*/
select a.Nome, l.Título
from AUTORES a NATURAL JOIN LIVRO l
order by a.Nome, l.Título;
/*4*/
select a.Nome, l.Título, SUM(c.Num)
from LIVRO l INNER JOIN AUTORES a
INNER JOIN CÓPIA c
ON c.ISBN = l.ISBN
AND l.ISBN = a.ISBN
group by a.Nome, l.Título
order by a.Nome, l.Título;
/*5*/
select a.Nome, l.Título, SUM(c.Num), SUM(c.EmpUtente)
from LIVRO l INNER JOIN AUTORES a
INNER JOIN CÓPIA c
ON c.ISBN = l.ISBN
AND l.ISBN = a.ISBN
group by a.Nome, l.Título
order by a.Nome, l.Título;
/*6*/
select s.Código AS Código, COUNT(c.Num) AS COUNT
from SECÇÃO s INNER JOIN ESTANTE e
INNER JOIN PRATELEIRA p
INNER JOIN CÓPIA c
ON s.Código = e.Secção
AND e.Código = p.Estante
AND p.Estante = c.Estante
AND p.Num = c.Prateleira
group by Código;
/*7*/
