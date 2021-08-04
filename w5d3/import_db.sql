
create table users(
    user_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    -- user_id INTEGER NOT NULL
    -- FOREIGN KEY (user_id) REFERENCES questions(id) 
);

create table questions(
    question_id INTEGER PRIMARY KEY
    title TEXT NOT NULL, 
    body TEXT NOT NULL, 
);

create table question_follows(
    pair_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL
);


users

id    |    fname     |       lname   

1       Snigdha         Banda               
2       App             Academy             
3       Joey            Fernandez                 


questions

id     |      title      |       body        |  user_id
1        'This is title'    'This is body'       3
2        'other title'      'other body'         3
3        'This is title'    'This is body'       2


question_follows

id     |       user_id      |      question_id
1         1                     1
2         2                     1


