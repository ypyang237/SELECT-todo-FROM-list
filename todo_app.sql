DROP USER IF EXISTS micheal;
CREATE ROLE micheal with ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;
\c todo_app
CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp,
  completed boolean NOT NULL
);

ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at timestamp NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET Default now();

INSERT INTO tasks
  (title, description, created_at, updated_at, completed_at)
  VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO tasks
  (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks;
UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';
SELECT title, description FROM tasks WHERE completed_at is NULL;

SELECT * FROM tasks Order By created_at;

INSERT INTO tasks
  (title, description)
  VALUES ('mistake 1', 'a test entry');
INSERT INTO tasks
  (title, description)
  VALUES ('mistake 2', 'another test entry');
INSERT INTO tasks
  (title, description)
  VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';
DELETE FROM tasks WHERE title = 'mistake 1';
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';
DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks Order By id;


-- SELECT * FROM tasks;