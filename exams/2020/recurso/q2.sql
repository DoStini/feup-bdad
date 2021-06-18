SELECT * FROM Talk
JOIN
    (SELECT id, Name FROM Speaker
        JOIN Talk ON id=speaker
        GROUP BY id
        HAVING count(*) > 1)
on Talk.speaker=id;
