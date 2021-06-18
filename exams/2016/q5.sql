DROP VIEW IF EXISTS num_likes;
CREATE VIEW num_likes AS 
SELECT ID1 as id, count(*) as total_likes FROM Amizade
GROUP BY ID1;

SELECT nome, anoCurricular FROM num_likes 
JOIN Estudante ON num_likes.id=Estudante.ID
WHERE total_likes=(SELECT max(total_likes) FROM num_likes);