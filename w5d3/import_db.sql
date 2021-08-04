
create table users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    user_id INTEGER NOT NULL
    FOREIGN KEY (user_id) REFERENCES questions(id) 
);

create table questions(
    id INTEGER PRIMARY KEY
    title TEXT NOT NULL, 
    body TEXT NOT NULL, 
);

create table question_follows(
    SELECT 
        user_id, id 
    FROM 
        users 
    INNER JOIN 
        questions
        ON 
           users.user_id = questions.id
        WHERE 

users
1     bob   ...      

questions 




    

);


