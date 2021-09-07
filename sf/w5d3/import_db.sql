DROP TABLE IF EXISTS question_follows; 
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users;


PRAGMA foreign_keys = ON;


CREATE TABLE users(
    user_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions(
    question_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL, 
    body TEXT NOT NULL,
    author_id TEXT NOT NULL, 
    FOREIGN KEY (author_id) REFERENCES users(user_id)
);

CREATE TABLE question_follows(
    pair_id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    asked_question_id INTEGER NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(user_id),
    FOREIGN KEY (asked_question_id) REFERENCES questions(question_id)

);

CREATE TABLE replies(
    reply_id INTEGER PRIMARY KEY,
    body TEXT NOT NULL, 
    question_id INTEGER NOT NULL,
    parent_reply INTEGER,
    replier_id INTEGER NOT NULL, 

    FOREIGN KEY(question_id) REFERENCES questions(question_id),
    FOREIGN KEY(parent_reply) REFERENCES replies(reply_id),
    FOREIGN KEY(replier_id) REFERENCES users(user_id)
);

CREATE TABLE question_likes(
    likes_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL, 
    question_id INTEGER NOT NULL, 

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id)

);

INSERT INTO
    users (user_id, fname, lname)
VALUES
    (1, 'Joey', 'Fernandez'),
    (2, 'Snigdha', 'Banda'),
    (3, 'App', 'Academy');

INSERT INTO
    questions (question_id, title, body, author_id)
VALUES
    (1, 'City Geographies', 'How far is SF from LA?!?', 1),
    (2, 'City Geographies', 'How far is SF from LA?!?', 2),
    (3, 'Wellness', 'Have you had COVID in the last 14 days?', 3);

INSERT INTO
    question_follows (pair_id, follower_id, asked_question_id)
VALUES
    (1, 1, 3),
    (2, 2, 3),
    (3, 3, 1);

INSERT INTO
    replies (reply_id, body, question_id, parent_reply, replier_id)
VALUES
    (1, 'Seven hours and lots of coffee', 1, NULL, 3),
    (2, 'A billion years idk', 2, 1, 2),
    (3, 'Enough time to code', 1, 1, 3);


-- users

-- user_id    |    fname     |       lname   

-- 1               Snigdha         Banda               
-- 2               App             Academy             
-- 3               Joey            Fernandez                 


-- questions

-- question_id     |      title      |       body        |  author_id
-- 1                    'This is title'    'This is body'       3
-- 2                   'other title'      'other body'         1
-- 3                   'This is title'    'This is body'       2


-- question_follows

-- pair_id     |       follower_id      |      asked_question_id
-- 1                   1                     1
-- 2                   2                     1

-- replies 

-- reply_id |  body |  ref to question_id| parent_reply | replier_id(ref to user_id) |       
-- 1           "body"      1                0                   3               
-- 2           "body2"     1               ref to reply_id         1 
-- 3
-- 4
-- 5
-- 6                                          2  

-- questions_likes

-- likes_id|   user_id (ref to user_id)| question_id(ref to questions)      








