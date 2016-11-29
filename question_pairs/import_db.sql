DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;


CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  parent_id INTEGER,
  body TEXT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ("Kevin", "Nguyen"),
  ("Nate", "Reiners"),
  ("Gage", "Rage"),
  ("Debra", "Kadabra");

INSERT INTO
  questions (title, body, user_id)
VALUES
  ("SQL?", "What's SQL?", 1),
  ("Life?", "What's life?", 2);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (1, 2),
  (3, 2),
  (2, 2);

INSERT INTO
  replies (user_id, question_id, parent_id, body)
VALUES
  (3, 1, NULL, "Figure it out."),
  (4, 1, NULL, "I'm helpful"),
  (4, 1, 1, "Gage sucks."),
  (2, 1, 1, "but what is life?"),
  (4, 2, NULL, "Good luck with that.");

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (2, 1),
  (3, 1),
  (4, 1),
  (1, 2),
  (2, 2);
