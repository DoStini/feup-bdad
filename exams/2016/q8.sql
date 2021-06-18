DROP TABLE IF EXISTS AmizadeTransitiva;
CREATE TABLE AmizadeTransitiva (
    ID1 INTEGER REFERENCES Estudante(id),
    ID2 INTEGER REFERENCES Estudante(id),
    CONSTRAINT a_t_pk PRIMARY KEY(ID1, ID2)
);

INSERT INTO AmizadeTransitiva
SELECT DISTINCT A1.ID1, A2.ID2 FROM Amizade A1
JOIN Amizade A2 ON A1.ID2=A2.ID1
WHERE A1.ID1<>A2.ID2
    AND (A1.ID1, A2.ID2) NOT IN Amizade
ORDER BY A1.ID1, A2.ID2;