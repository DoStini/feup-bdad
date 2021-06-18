SELECT E1.nome, E2.nome as Nome FROM Estudante E1
JOIN Amizade ON E1.ID=Amizade.ID1
JOIN Estudante E2 ON E2.ID=Amizade.ID2
WHERE E1.curso<>E2.curso AND E1.ID < E2.ID;
