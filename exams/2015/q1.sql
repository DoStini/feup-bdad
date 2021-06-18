.mode box
.headers on

SELECT caption FROM photo 
        JOIN user ON photo.user=user.id
where name LIKE 'Daniel Ramos'
        AND julianday(uploadDate) - julianday(creationDate) = 2;
