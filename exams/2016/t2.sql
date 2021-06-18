DROP TRIGGER IF EXISTS block_friend_mod;
CREATE TRIGGER block_friend_mod
BEFORE UPDATE ON Amizade
BEGIN
    SELECT RAISE(ABORT, "Cant modify friendships");
END;


DROP TRIGGER IF EXISTS add_friend;
CREATE TRIGGER add_friend
AFTER INSERT ON Amizade
WHEN ( new.ID2, new.ID1 ) NOT IN Amizade
BEGIN
    INSERT INTO Amizade (ID1, ID2) values(
        new.ID2,
        new.ID1
    );
END;


DROP TRIGGER IF EXISTS remove_friend;
CREATE TRIGGER remove_friend
AFTER DELETE ON Amizade
BEGIN
    DELETE FROM Amizade
    WHERE Amizade.ID1=OLD.ID2 AND Amizade.ID2=OLD.ID1;
END;


insert into Estudante values (20201, 'Ana Lopes', 1, 1);
insert into Estudante values (20202, 'Anitta Lopes', 1, 1);

insert into Amizade values (20202, 20201);

SELECT * FROM Amizade WHERE ID2=20201 OR ID1=20201;

DELETE FROM Amizade WHERE ID2=20201;

select "please no find";
SELECT * FROM Amizade WHERE ID2=20201;
SELECT * FROM Amizade WHERE ID1=20201;
select "find?";
