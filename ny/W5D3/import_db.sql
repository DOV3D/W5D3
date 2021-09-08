CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname VARCHAR NOT NULL,
    lname VARCHAR NOT NULL,
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
    reply_id INTEGER NOT NULL,
    child_reply_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,


    FOREIGN KEY (reply_id) REFERENCES questions(id),
    FOREIGN KEY (child_reply_id) REFERENCES replies(reply_id),
    FOREIGN KEY (author_id) REFERENCES users(id)

);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    liker_id INTEGER NOT NULL,
    likes_id INTEGER NOT NULL,

    FOREIGN KEY(liker_id) REFERENCES users(id),
    FOREIGN KEY (likes_id) REFERENCES questions(id)


);





