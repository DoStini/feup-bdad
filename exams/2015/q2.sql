.mode box
.headers on

SELECT name FROM user LEFT JOIN photo ON user.id=photo.user
WHERE photo.id IS NULL;
