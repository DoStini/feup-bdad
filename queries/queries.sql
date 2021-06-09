-- SELECT nr FROM aluno; -- 1

-- SELECT cod, Design FROM cadeira; -- 2

-- SELECT Nome from aluno NATURAL JOIN prof; -- 3
-- SELECT Aluno.Nome from aluno, prof WHERE aluno.Nome=prof.Nome;

-- SELECT Nome from aluno WHERE Nome NOT IN (SELECT Nome from prof); --4

-- SELECT Nome from prof UNION  SELECT Nome from aluno; -- 5

-- SELECT DISTINCT Nome from aluno,prova WHERE aluno.nr=prova.nr AND prova.cod="TS1"; --6

-- SELECT DISTINCT Nome from aluno NATURAL JOIN prova NATURAL JOIN cadeira WHERE curso="IS"; --7

-- SELECT DISTINCT Nome, cod
-- from aluno NATURAL JOIN prova NATURAL JOIN cadeira 
-- WHERE curso="IS" 
-- GROUP BY nr,cod
-- HAVING ; --8
--
-- SELECT aluno.nr, aluno.Nome FROM cadeira
--     JOIN prova ON prova.cod=cadeira.cod
--     JOIN aluno ON aluno.nr=prova.nr
--     WHERE curso LIKE 'IS' AND nota >= 10
--     GROUP BY aluno.nr
--     HAVING count(DISTINCT cadeira.cod)=(SELECT count(cod) FROM cadeira WHERE curso LIKE 'IS');
--
-- SELECT max(nota) as "nota fixe"
-- from prova; --9

-- SELECT avg(nota) as "nota media fofinha"
-- FROM prova
-- WHERE cod="BD"; --10

-- SELECT count(*) as "numero de alunos lindos"
-- FROM aluno; --11

-- SELECT curso, count(*) as "number of courses nice"
-- FROM cadeira
-- GROUP BY curso; --12

-- SELECT aluno.nr, Nome, count(*) as "number of testes lel"
-- FROM aluno JOIN prova ON aluno.nr=prova.nr
-- GROUP BY aluno.nr; --13


-- SELECT avg(count) from(
--     SELECT count(*) as count
--     FROM aluno JOIN prova ON aluno.nr=prova.nr
--     GROUP BY aluno.nr
-- ); --14

-- SELECT nr, Nome, avg(nota) FROM
--     (SELECT aluno.nr, aluno.Nome, prova.cod, max(nota) as nota FROM cadeira
--         JOIN prova ON prova.cod=cadeira.cod
--         JOIN aluno ON aluno.nr=prova.nr
--         WHERE curso LIKE 'IS' AND nota >= 10
--         GROUP BY aluno.nr, prova.cod)
-- GROUP BY nr; --15


SELECT prova.cod, max(nota) AS best FROM cadeira
    JOIN prova ON prova.cod=cadeira.cod
    GROUP BY prova.cod;


SELECT nome, nota, composed.cod FROM
    (SELECT prova.cod, max(nota) AS best FROM cadeira
        JOIN prova ON prova.cod=cadeira.cod
        GROUP BY prova.cod) AS composed
    JOIN prova ON prova.cod=composed.cod
    JOIN aluno ON prova.nr=aluno.nr
    WHERE nota=best;