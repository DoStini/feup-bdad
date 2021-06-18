SELECT E1.nome as Nome FROM Estudante E1
JOIN Amizade ON E1.ID=Amizade.ID1
JOIN Estudante E2 ON E2.ID=Amizade.ID2
GROUP BY E1.ID
HAVING count(DISTINCT E2.anoCurricular)=
        (SELECT count(DISTINCT anoCurricular) FROM Estudante);
