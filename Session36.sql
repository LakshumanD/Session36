Create Database Guvi;
use Guvi;
-- users
CREATE TABLE USER(ID int not null auto_increment, username varchar(25), email varchar(50), primary key(ID));
INSERT INTO USER(username,email) VALUES('Lakshuman','lakshumanasamy.dhandapani@agilisiums.com');
INSERT INTO USER(username,email) VALUES('nivea','nivea.m@agilisium.coms');
INSERT INTO USER(username,email) VALUES('elakkiya','elakkiya.eraja@agilisiums.com');
INSERT INTO USER(username,email) VALUES('manoj','manoj.kkvv@agilisium.coms'); 


-- codekata
CREATE TABLE CODEKATA(ID INT NOT NULL auto_increment, TYPE VARCHAR(25),QUESTION VARCHAR(100),ANSWER VARCHAR(100),USERID INT,primary KEY(ID) );

INSERT INTO CODEKATA(TYPE,QUESTION,ANSWER,USERID)
VALUES('InputOutput','Write a code to get the input in the given format and print the output in the given format.'
,'userInput[0].split('''').join('','');',1);
INSERT INTO CODEKATA(TYPE,QUESTION,ANSWER,USERID)
VALUES('InputOutput','Print the characters in a string separated by line.'
,'userInput[0].split('''').map(x=>{console.log(x)})',1);
INSERT INTO CODEKATA(TYPE,QUESTION,ANSWER,USERID)
VALUES('InputOutput','Print the float value separated by line.'
,'2.3 4.5 7.8',2);
INSERT INTO CODEKATA(TYPE,QUESTION,ANSWER,USERID)
VALUES('InputOutput','Print the characters in a string separated by space.'
,'g u v i',2);


create table  task(id int NOT NULL AUTO_INCREMENT,  
    course_id int,user_id int,
    CONSTRAINT course_id_fk FOREIGN KEY (course_id)  
  REFERENCES codekata(id) ,
   CONSTRAINT user_id_fk FOREIGN KEY (user_id)  
  REFERENCES user(id),
    PRIMARY KEY (id)); 
  
    insert into task(course_id,user_id) values(1,1);
    insert into  task (course_id,user_id) values(1,2);
    insert into  task (course_id,user_id) values(2,1);


create table company_drives( id int NOT NULL AUTO_INCREMENT,  
    company_name varchar(45) NOT NULL,  
    PRIMARY KEY (id) );
    
    insert into company_drives(company_name)values('abc');
     insert into company_drives(company_name)values('efg');
      insert into company_drives(company_name)values('hij');
      insert into company_drives(company_name)values('klm');
       insert into company_drives(company_name)values('nop');
       
create table attendance(id int NOT NULL AUTO_INCREMENT,  
    company_id int,user_id int,
    CONSTRAINT company_id_fk FOREIGN KEY (company_id)  
  REFERENCES company_drives(id) ,
   CONSTRAINT user_id_fk1 FOREIGN KEY (user_id)  
  REFERENCES user(id),
    PRIMARY KEY (id));
    insert into attendance(company_id,user_id)values(1,1);
    insert into attendance(company_id,user_id)values(2,1);
    insert into attendance(company_id,user_id)values(2,3);
    insert into attendance(company_id,user_id)values(2,4);
    insert into attendance(company_id,user_id)values(3,5);

create table mentor(id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    PRIMARY KEY (id));
    insert into mentor(name) values('a');
    insert into mentor(name) values('b');
    insert into mentor(name) values('c');
    insert into mentor(name) values('d');
    insert into mentor(name) values('e');

 create table courses(id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    mentor_id int,
     CONSTRAINT mentor_id_fk FOREIGN KEY (mentor_id)  
  REFERENCES mentor(id),
    PRIMARY KEY (id));
    insert into courses (name,mentor_id) values('maths',1);
     insert into courses (name,mentor_id) values('physics',2);
      insert into courses (name,mentor_id) values('chemistry',1);
       insert into courses (name,mentor_id) values('biology',3);
        insert into courses (name,mentor_id) values('csc',4);


create table student_activated_course(id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    course_id int,
     CONSTRAINT course_id_fk1 FOREIGN KEY (course_id)  
  REFERENCES courses(id),
    PRIMARY KEY (id));
    insert into student_activated_course(name,course_id) values('x',1);
    insert into student_activated_course(name,course_id) values('y',2);
    insert into student_activated_course(name,course_id) values('z',2);
    insert into student_activated_course(name,course_id) values('w',3);
    insert into student_activated_course(name,course_id) values('q',1);


-- get number problems solved in codekata by combining the users
select u.username,count(c.user_id) as completed_task from user u,task c where c.user_id=u.id group by u.id;

-- display the no of company drives attended by a user
select u.username ,count(a.user_id) from user u,attendance a where u.id=a.user_id group by a.user_id;

--  list all the mentors
select name as mentors_name from mentor;

-- list the number of students that are assigned for a mentor
 select count(a.id) as no_of_students,c.mentor_id from courses c left outer join student_activated_course a on a.course_id=c.id group by c.mentor_id;

    


