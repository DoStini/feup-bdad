.mode box
.headers on

DROP VIEW IF EXISTS photo_likes;
CREATE VIEW photo_likes AS
SELECT id, count(*) as num_likes FROM photo
        JOIN Likes ON photo.id=Likes.photo
    GROUP BY photo.id;

SELECT avg(num_people) as "Média" FROM
    (SELECT id, count(*) as num_people
        FROM photo JOIN photo_likes USING(id)
                    JOIN AppearsIn ON id=AppearsIn.photo
        WHERE num_likes > 3
        GROUP BY id);

