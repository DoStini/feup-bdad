DROP VIEW IF EXISTS friends;
CREATE VIEW friends AS 
SELECT Amizade.ID2 as id FROM Estudante 
JOIN Amizade ON Amizade.ID1=Estudante.ID
WHERE Estudante.nome='Miguel Sampaio';

DROP VIEW IF EXISTS second_friends;
CREATE VIEW second_friends AS 
SELECT Amizade.ID2 as id FROM friends 
JOIN Amizade ON friends.id=Amizade.ID1;

DROP VIEW IF EXISTS third_friends;
CREATE VIEW third_friends AS 
SELECT Amizade.ID2 as id FROM second_friends
JOIN Amizade ON second_friends.id=Amizade.ID1;

SELECT DISTINCT id as ID FROM third_friends;