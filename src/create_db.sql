CREATE TABLE routes (
    departure VARCHAR(255),
    destination VARCHAR(255),
    cost BIGINT
);

INSERT INTO
    routes
VALUES
    ('A', 'B', 10);

INSERT INTO
    routes
VALUES
    ('B', 'A', 10);

INSERT INTO
    routes
VALUES
    ('A', 'C', 15);

INSERT INTO
    routes
VALUES
    ('C', 'A', 15);

INSERT INTO
    routes
VALUES
    ('A', 'D', 20);

INSERT INTO
    routes
VALUES
    ('D', 'A', 20);

INSERT INTO
    routes
VALUES
    ('B', 'D', 25);

INSERT INTO
    routes
VALUES
    ('D', 'B', 25);

INSERT INTO
    routes
VALUES
    ('D', 'C', 30);

INSERT INTO
    routes
VALUES
    ('C', 'D', 30);

INSERT INTO
    routes
VALUES
    ('C', 'B', 35);

INSERT INTO
    routes
VALUES
    ('B', 'C', 35);