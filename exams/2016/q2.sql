SELECT Estudante.nome FROM Estudante 
JOIN Amizade ON Amizade.ID1=Estudante.ID
GROUP BY ID
HAVING count(*) > 3;
