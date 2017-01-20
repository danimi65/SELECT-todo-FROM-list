-- CREATE TABLE "Users" (id serial, name text);
-- INSERT INTO "Users" (name) VALUES ('Danika');
-- SELECT * FROM "Users";
-- DROP TABLE "Users";
\c danikaharada;
DROP USER IF EXISTS "michael";
CREATE USER "michael";
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";

\c "todo_app";

CREATE TABLE "tasks" (id serial NOT NULL, title varchar(225), description text, created_at timestamp WITHOUT TIME ZONE DEFAULT now(), updated_at timestamp WITHOUT TIME ZONE, completed boolean);

-- \d+ "tasks"

ALTER TABLE "tasks" ADD PRIMARY KEY (id);

ALTER TABLE "tasks" DROP "completed";

ALTER TABLE "tasks" ADD "completed_at" timestamp WITHOUT TIME ZONE DEFAULT NULL;


ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET NOT NULL; 
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT now();
-- \d+ "tasks"


INSERT INTO "tasks" (title, description, created_at, updated_at, completed_at) VALUES ('Study SQL', 'completed this exercise', now(), now(), NULL );

INSERT INTO "tasks" (title, description) VALUES ('study PostgreSQL', 'read all the documentation');

SELECT "title" FROM "tasks" WHERE "completed_at" IS NULL;

UPDATE "tasks" SET "completed_at" = now() WHERE "title" = 'Study SQL';

SELECT * FROM "tasks";