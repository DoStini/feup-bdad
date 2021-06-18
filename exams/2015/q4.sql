.mode box
.headers on

DROP VIEW IF EXISTS daniel_id;
CREATE VIEW daniel_id AS
SELECT id FROM user where name LIKE 'Daniel Ramos';

DROP VIEW IF EXISTS friends;
CREATE VIEW friends AS
SELECT user2  FROM Friend where user1 IN daniel_id;

DROP VIEW IF EXISTS second_friends;
CREATE VIEW second_friends AS
SELECT user2 FROM Friend where user1 IN friends;

SELECT DISTINCT caption FROM photo JOIN AppearsIn ON photo.id=AppearsIn.photo
    WHERE AppearsIn.user IN 
        (SELECT * FROM daniel_id UNION 
                SELECT * FROM friends UNION 
                SELECT * FROM second_friends);
