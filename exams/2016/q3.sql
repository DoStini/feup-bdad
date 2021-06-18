SELECT nome as Nome, anoCurricular as "Ano Curricular"
FROM Estudante E1
WHERE NOT EXISTS 
        (SELECT * FROM Amizade
            JOIN Estudante E2 ON Amizade.ID2=E2.ID
            WHERE Amizade.ID1=E1.ID AND E2.anoCurricular<>E1.anoCurricular)
    AND EXISTS 
        (SELECT ID1 FROM 
            Amizade WHERE Amizade.ID1=E1.ID)
ORDER BY anoCurricular, nome;
