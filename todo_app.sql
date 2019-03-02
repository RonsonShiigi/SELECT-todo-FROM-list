DROP DATABASE  IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH PASSWORD 'stonebreaker';
DROP TABLE IF EXISTS tasks;
CREATE DATABASE todo_app;
\c todo_app;
CREATE TABLE tasks(
    ID serial NOT NULL PRIMARY KEY,
    title  VARCHAR(255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL,
    completed  BOOLEAN NOT NULL DEFAULT false
);
ALTER TABLE tasks DROP completed;
ALTER TABLE tasks ADD completed_at TIMESTAMP NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET default now();

INSERT INTO tasks (id,title,description, created_at,updated_at,completed_at)
VALUES(DEFAULT,'STUDY SQL','COMPLETE THIS EXERCISE',now(),now(),NULL);

INSERT INTO tasks (title,description)
VALUES('STUDY POSTGRESQL','Read all the documentation');

SELECT title from tasks where completed_at is NULL;

UPDATE tasks 
SET completed_at = now()
WHERE title = 'STUDY SQL';

SELECT title from tasks where completed_at is NULL;


-- selects all from table in descending order
SELECT * from tasks
ORDER BY  created_at DESC;

INSERT INTO tasks(title,description)
VALUES('mistake 1','a test entry');

INSERT INTO tasks(title, description)
VALUES('mistake 2','another test entry');

INSERT INTO tasks (title,description)
VALUES('third mistake','another test entry');

-- selects title fields that include the word mistake
SELECT title FROM tasks 
WHERE title ~ 'mistake';

-- deletes the tasks with title mistake1
DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT * FROM tasks
WHERE title ~ 'mistake';

-- deletes all tasks that include the word mistake
DELETE FROM tasks
where title ~ 'mistake';

-- selects all from tasks and orders in ascending order by title
SELECT * FROM tasks
ORDER BY title ASC;

