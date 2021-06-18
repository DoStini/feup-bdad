DROP TRIGGER IF EXISTS auto_like;
CREATE TRIGGER auto_like
AFTER INSERT ON AppearsIn
WHEN (SELECT NEW.user, NEW.photo) NOT IN (SELECT * from Likes) 
BEGIN
    INSERT INTO Likes values(NEW.user, NEW.photo);
END;