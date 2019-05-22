/*
 * Base de Dados
 * Eduardo R. B. Marques, DCC/FCUP
 *
 * BD Biblioteca para aula prática 3.
 * Esquema e dados iniciais.
 */
CREATE DATABASE IF NOT EXISTS guest;
USE guest;

DROP TABLE IF EXISTS
  CÓPIA,
  PRATELEIRA,
  ESTANTE,
  SECÇÃO,
  AUTORES,
  LIVRO,
  UTENTE;

CREATE TABLE UTENTE
(
  Num INT NOT NULL,
  CC INT NOT NULL,
  Nome VARCHAR(64) NOT NULL,
  DataNasc DATE NOT NULL,
  Sexo ENUM('M', 'F') NOT NULL,
  Telefone INT NOT NULL,
  Email VARCHAR(32),
  PRIMARY KEY(Num),
  UNIQUE(CC)
);

CREATE TABLE LIVRO
(
  ISBN BIGINT NOT NULL,
  Título VARCHAR(64) NOT NULL,
  Editora VARCHAR(32) NOT NULL,
  Ano YEAR NOT NULL,
  PRIMARY KEY(ISBN)
);

CREATE TABLE AUTORES
(
  ISBN BIGINT NOT NULL,
  Nome VARCHAR(64) NOT NULL,
  PRIMARY KEY(ISBN, Nome),
  FOREIGN KEY(ISBN) REFERENCES LIVRO(ISBN)
);

CREATE TABLE SECÇÃO
(
  Código VARCHAR(3) NOT NULL,
  Descrição VARCHAR(32) NOT NULL,
  PRIMARY KEY(Código),
  UNIQUE(Descrição)
);

CREATE TABLE ESTANTE
(
  Código VARCHAR(3) NOT NULL,
  Secção VARCHAR(3) NOT NULL,
  PRIMARY KEY(Código),
  FOREIGN KEY(Secção) REFERENCES SECÇÃO(Código)
);

CREATE TABLE PRATELEIRA
(
  Estante VARCHAR(3) NOT NULL,
  Num TINYINT NOT NULL,
  PRIMARY KEY(Estante, Num),
  FOREIGN KEY(Estante) REFERENCES ESTANTE(Código)
);

CREATE TABLE CÓPIA
(
  ISBN BIGINT NOT NULL,
  Num TINYINT NOT NULL,
  Estante VARCHAR(3) NOT NULL,
  Prateleira TINYINT NOT NULL,
  EmpUtente INT,
  EmpData DATE,
  PRIMARY KEY(ISBN, Num),
  FOREIGN KEY(ISBN) REFERENCES LIVRO(ISBN),
  FOREIGN KEY(EmpUtente) REFERENCES UTENTE(Num),
  FOREIGN KEY(Estante,Prateleira) REFERENCES PRATELEIRA(Estante, Num)
);
/*
 * dados iniciais
 */

INSERT INTO UTENTE(Num, CC, Nome, DataNasc, Sexo, Telefone, Email)
VALUES
 (1, 10583212, 'João Pinto',    '1976-12-19', 'M', 913448748, 'azulibranco@fcp.pt'),
 (2, 12447555, 'Carlos Semedo',	'1985-06-02', 'M', 223774327, NULL),
 (3, 16348500, 'Maria Silva',   '2005-11-17', 'F', 939939939, NULL),
 (4, 11983516, 'Pedro Costa',   '1982-01-03', 'M', 984088910, 'pc12345@xpto.com'),
 (5, 18301622, 'Filipa Mendes', '2002-05-03', 'F', 227045560, 'filipa.mendes@gmail.com'),
 (6, 10521770, 'Eva Mendes',    '1975-11-18', 'F', 913434866, NULL),
 (7, 12349596, 'Pedro Simões',  '1993-02-22', 'M', 213884445, 'simoes333@gmail.com');

INSERT INTO LIVRO(ISBN, Título, Editora, Ano)
VALUES
 (9789722709620, 'Os Lusíadas', 'INCM', 1999),
 (9789722526289, 'Sonetos', 'WOOK 11-17', 2013),
 (9780131103627, 'The C Programming Language, 2nd edition', 'Prentice Hall', 1988),
 (9789720049759, 'A Mensagem', 'Porto Editora', 2017),
 (9780321356680, 'Effective Java', 'Pearson Education', 2008),
 (9789724138695, 'Astérix o Gaulês', 'Edições Asa', 2004),
 (9789724138947, 'A Volta à Gália de Astérix', 'Edições Asa', 2005);


INSERT INTO AUTORES(ISBN, Nome)
VALUES
  (9789722709620, 'Luís de Camões'),
  (9789722526289, 'Luís de Camões'),
  (9780131103627, 'Brian W. Kernighan'),
  (9780131103627, 'Dennis M. Ritchie'),
  (9789720049759, 'Fernando Pessoa'),
  (9780321356680, 'Joshua Bloch'),
  (9789724138695, 'René Goscinny'),
  (9789724138695, 'Albert Uderzo'),
  (9789724138947, 'René Goscinny'),
  (9789724138947, 'Albert Uderzo');

INSERT INTO SECÇÃO(Código, Descrição)
VALUES
  ('L', 'Literatura'),
  ('BD', 'Banda Desenhada'),
  ('T', 'Livros Técnicos');

INSERT INTO ESTANTE(Código, Secção)
VALUES
  ('E12', 'L'),
  ('E13', 'L'),
  ('E14', 'BD'),
  ('E99', 'T');

INSERT INTO PRATELEIRA(Estante, Num)
VALUES
  ('E12', 1), ('E12', 2), ('E12', 3),
  ('E13', 1), ('E13', 2), ('E13', 3),
  ('E14', 1), ('E14', 2),
  ('E99', 1), ('E99', 2), ('E99', 3);

INSERT INTO CÓPIA(ISBN, Num, Estante, Prateleira, EmpUtente, EmpData)
VALUES
  /* Lusíadas */
  (9789722709620, 1, 'E12', 1, 1, '2019-01-17'),
  (9789722709620, 2, 'E12', 1, NULL, NULL),
  (9789722709620, 3, 'E12', 2, 2, '2018-12-27'),
  (9789722709620, 4, 'E12', 2, 6, '2018-02-01'),
  /* Sonetos */
  (9789722526289, 1, 'E13', 1, 2, '2018-12-28'),
  (9789722526289, 2, 'E13', 2, NULL, NULL),
  /* The C Programming Language */
  (9780131103627, 1, 'E99', 3, NULL, NULL),
  (9780131103627, 2, 'E99', 3, 4, '2019-02-01'),
  /* A Mensagem */
  (9789720049759, 1, 'E13', 2, 5, '2018-11-19'),
  (9789720049759, 2, 'E13', 2, 1, '2019-01-17'),
  (9789720049759, 3, 'E13', 2, NULL, NULL),
  /* Effective Java */
  (9780321356680, 1, 'E99', 3, NULL, NULL),
  /* Astérix o Gaulês */
  (9789724138695, 1, 'E14', 1, 4, '2019-02-01'),
  (9789724138695, 2, 'E14', 1, NULL, NULL),
  (9789724138695, 3, 'E14', 1, 3, '2018-11-01'),
  (9789724138695, 4, 'E14', 1, NULL, NULL),
  /* A Volta à Gália de Astérix */
  (9789724138947, 1, 'E14', 2, NULL, NULL),
  (9789724138947, 2, 'E14', 2, 4, '2019-02-01');
