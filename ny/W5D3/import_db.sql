PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname VARCHAR NOT NULL,
    lname VARCHAR NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    question_followed_id INTEGER NOT NULL,

    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (question_followed_id) REFERENCES questions(id)

);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    child_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,


    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (child_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)

);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    liker_id INTEGER NOT NULL,
    likes_id INTEGER NOT NULL,

    FOREIGN KEY(liker_id) REFERENCES users(id),
    FOREIGN KEY (likes_id) REFERENCES questions(id)


);

INSERT INTO users
    (fname, lname)
VALUES 
    ('John', 'Smith'),
    ('James', 'Efron'),
    ('Mike', 'Jones'),
    ('Snigdha', 'Banda');

INSERT INTO questions
    (title, body, author_id)
VALUES
    ('Question 1', 'How long is App Academy?', 1),
    ('Question 2', 'Where is Waldo?', 2),
    ('Question 3', 'How hard is SQL?', 3);

INSERT INTO question_follows
    (follower_id, question_followed_id)
VALUES
    (1, 3),
    (4, 2),
    (3, 1);

INSERT INTO replies
    (reply_id, child_reply_id, author_id, body)
VALUES 
    (1,NULL, 2, "16 weeks"),
    (2,NULL, 3, "Who knows?"),
    (2, 1, 1, "Thats not a real answer");

INSERT INTO question_likes
    (liker_id, likes_id)
VALUES
    (1,1),
    (2,2),
    (4, 3),
    (3, 1);










