DROP TRIGGER IF EXISTS bffs;
CREATE TRIGGER bffs
AFTER INSERT ON Estudante
FOR EACH ROW
BEGIN
    INSERT INTO Amizade (ID1, ID2)
        SELECT new.id, Estudante.ID FROM Estudante
            WHERE Estudante.curso=new.curso
                    AND ID<>new.id;
        
    INSERT INTO Amizade (ID1, ID2)
        SELECT Estudante.ID, new.id FROM Estudante
            WHERE Estudante.curso=new.curso
                    AND ID<>new.id;
END;

DELETE FROM Amizade WHERE ID1=20201 OR ID2=20201;
DELETE FROM Estudante WHERE ID=20201;
insert into Estudante values (20201, 'Ana Lopes', 1, 1);

SELECT * FROM Amizade WHERE ID1=20201;
SELECT * FROM Amizade WHERE ID2=20201;
SELECT * FROM Estudante WHERE curso=1;
