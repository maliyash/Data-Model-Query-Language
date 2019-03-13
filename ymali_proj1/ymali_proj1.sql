CREATE SCHEMA `tinypiazza` ;
use tinypiazza ;

CREATE TABLE User(
   Emailid   VARCHAR (25)     NOT NULL,
   password VARCHAR (25)     NOT NULL,
   displayname  VARCHAR (25)    NOT NULL,
   PRIMARY KEY (Emailid)
);

CREATE TABLE TeachingUser(
   Emailid   VARCHAR (25)     NOT NULL,
   password VARCHAR (25)     NOT NULL,
   displayname  VARCHAR (25)    NOT NULL,
   PRIMARY KEY (Emailid)
);

CREATE TABLE StudentUser(
   Emailid   VARCHAR (25)     NOT NULL,
   password VARCHAR (25)     NOT NULL,
   displayname  VARCHAR (25)    NOT NULL,
   PRIMARY KEY (Emailid)
);


CREATE table Course( universityname varchar(25) not null,
coursenumber varchar(25) not null,
coursename varchar(25) not null,
years year not null,
sem varchar(25) not null,
Emailid varchar(25) not null,
primary key (coursenumber, universityname, years, sem ),
foreign key(Emailid) references teachinguser(Emailid)
);


create table Updates(
Emailid varchar(25),
coursenumber varchar(25),
years year,
sem varchar(25),
universityname varchar(25),
primary key(Emailid,coursenumber,years,sem,universityname),
foreign key(Emailid) references teachinguser(Emailid),
foreign key(coursenumber, universityname, years, sem) references course(coursenumber, universityname, years, sem)
);

create table register(
Emailid varchar(25),
coursenumber varchar(25),
years year,
sem varchar(25),
universityname varchar(25),
primary key(Emailid,coursenumber,years,sem,universityname),
foreign key(Emailid) references studentuser(Emailid),
foreign key(coursenumber, universityname, years, sem) references course(coursenumber, universityname, years, sem)
);


create table Questionpost(
Postid varchar(25),
Emailid varchar(25),
Title varchar(25),
Descrip varchar(25),
timing time,
coursenumber varchar(25),
years year,
sem varchar(25),
universityname varchar(25),
primary key(Postid,coursenumber,years,sem,universityname,timing),
foreign key(Emailid) references tinypiazza.user(Emailid),
foreign key(coursenumber, universityname, years, sem) references course(coursenumber, universityname, years, sem)
);


create table answerpost(
Postid varchar(25),
Emailid varchar(25),
Answer varchar(25),
timing time,
coursenumber varchar(25),
years year,
sem varchar(25),
universityname varchar(25),
primary key(Postid,coursenumber,years,sem,universityname,timing,Emailid),
foreign key(Emailid) references tinypiazza.user(Emailid),
foreign key(coursenumber, universityname, years, sem) references questionpost(coursenumber, universityname, years, sem)
);

