CREATE TABLE routes (
    departure VARCHAR(255),
    destination VARCHAR(255),
    cost BIGINT
);

INSERT INTO
    routes
VALUES
    ('a', 'b', 10);

INSERT INTO
    routes
VALUES
    ('b', 'a', 10);

INSERT INTO
    routes
VALUES
    ('a', 'c', 15);

INSERT INTO
    routes
VALUES
    ('c', 'a', 15);

INSERT INTO
    routes
VALUES
    ('a', 'd', 20);

INSERT INTO
    routes
VALUES
    ('d', 'a', 20);

INSERT INTO
    routes
VALUES
    ('b', 'd', 25);

INSERT INTO
    routes
VALUES
    ('d', 'b', 25);

INSERT INTO
    routes
VALUES
    ('d', 'c', 30);

INSERT INTO
    routes
VALUES
    ('c', 'd', 30);

INSERT INTO
    routes
VALUES
    ('c', 'b', 35);

INSERT INTO
    routes
VALUES
    ('b', 'c', 35);