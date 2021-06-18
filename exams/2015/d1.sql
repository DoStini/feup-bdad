-- SELECT id, count(*), creationDate FROM photo JOIN AppearsIn ON id=AppearsIn.photo
--         GROUP BY id;

-- SELECT "valid deletionS:";
-- SELECT id FROM photo JOIN AppearsIn ON id=AppearsIn.photo
--         where julianday(creationDate) < julianday("2010-01-01")
--         GROUP BY id
--         HAVING count(*) < 2;


DELETE FROM photo 
WHERE photo.id IN
    (SELECT id FROM photo JOIN AppearsIn ON id=AppearsIn.photo
        where julianday(creationDate) < julianday("2010-01-01")
        GROUP BY id
        HAVING count(*) < 2);

-- SELECT id, count(*), creationDate FROM photo JOIN AppearsIn ON id=AppearsIn.photo
--         GROUP BY id;
