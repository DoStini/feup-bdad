SELECT Name, count(DISTINCT Day) FROM Topic
LEFT JOIN Talk ON Topic.id=Talk.topic
GROUP BY Topic.Id
ORDER BY Name;

SELECT(
    SELECT Estudante.Nome, COUNT(*) AS "COUNT"
    FROM Estudante JOIN Amizade ON Estudante.ID = Amizade.ID1
    GROUP BY Estudante.ID
    ORDER BY "COUNT"
)
WHERE "COUNT" = MAX("COUNT");
