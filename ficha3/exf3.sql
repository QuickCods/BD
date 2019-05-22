--2.1
INSERT INTO UTENTE
VALUES (8, 18848333, 'Mariana Silva', '2000-01-23', 'F', 227348900, NULL);

--2.2
SELECT * FROM UTENTE
WHERE Num = 8;

--2.3
SELECT ISBN FROM LIVRO
WHERE Título = 'Os Lusíadas';

SELECT Num FROM CÓPIA
WHERE ISBN = 9789722709620
AND EmpUtente IS NULL;

--2.6
select l.ISBN
from LIVRO l INNER JOIN AUTORES a
INNER JOIN CÓPIA c
INNER JOIN PRATELEIRA p
ON a.ISBN = l.ISBN
and l.ISBN = c.ISBN
and c.estante = p.estante
and c.prateleira = p.Num
where l.Ano > 2010
and a.Nome = 'Fernando Pessoa'
or a.Nome = 'Luís de Camões'
and p.Num = 3
and p.estante = 'E99';

--3.1
CREATE TABLE FUNCIONÁRIO
(
  Num INT NOT NULL,
  CC INT NOT NULL,
  Nome VARCHAR(64) NOT NULL,
  DataNasc DATE NOT NULL,
  Sexo ENUM('M', 'F') NOT NULL,
  Telefone INT NOT NULL,
  Email VARCHAR(32),
  Cargo VARCHAR(16),
  Supervisor INT,
  PRIMARY KEY(Num),
  UNIQUE(CC),
  FOREIGN KEY(Supervisor) REFERENCES SUPERVISOR(Número)
);

CREATE TABLE SUPERVISOR(
  Número INT,
  Nome VARCHAR(64)
  PRIMARY KEY(Número)
);

--3.2

CREATE TABLE REVISTA(
  Num INT NOT NULL,
  Título VARCHAR(64) NOT NULL,
  Periocidade ENUM (('S', 'M', 'A') NOT NULL,
  Editora VARCHAR(32) NOT NULL,
  PRIMARY KEY(Num),
  UNIQUE(Num, Título),
  FOREIGN KEY(Num) REFERENCES EDIÇÃO_DE_REVISTA(NumR)
);

CREATE TABLE EDIÇÃO_DE_REVISTA(
  NumR INT NOT NULL,
  Num Ed TINYINT,
  Data DATE,
  FOREIGN KEY(NumR) REFERENCES REVISTA(Num)
);
