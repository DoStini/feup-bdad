SELECT E1.nome FROM Estudante E1
JOIN Amizade ON E1.ID=Amizade.ID1
JOIN Estudante E2 ON E2.ID=Amizade.ID2
WHERE E2.nome LIKE 'Gabriel%';