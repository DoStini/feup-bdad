DROP TABLE IF EXISTS person;

CREATE TABLE person (
    id INTEGER,
    name TEXT NOT NULL,
    age INTEGER,
    points CHECK (points > 0) CONSTRAINT valid_points,

    CONSTRAINT pk PRIMARY KEY(id),
    CONSTRAINT valid_age CHECK (age >= 18)
);

INSERT INTO person VALUES(1,'Pessoa 1', 19, 1);
INSERT INTO person VALUES(1,'Pessoa 1', 19, 1);
INSERT INTO person VALUES(2,'Pessoa 2', 16, 1);
INSERT INTO person VALUES(2,'Pessoa 2', 18, 0);
