create database `quanlysinhvien`;
use `quanlysinhvien`;
create table `class`(
ClassID int auto_increment not null primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
Status bit );

create table Student(
StudentID int auto_increment not null primary key,
StudentName varchar(45) not null,
address varchar(50),
Phone varchar(20),
Status bit,
classID int not null,
foreign key(classID) references `class`(ClassID));

create table `Subject`(
SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
SubName VARCHAR(30) NOT NULL,
Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
Status  BIT                  DEFAULT 1 );

CREATE TABLE Mark (
    MarkID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    Examtimes TINYINT DEFAULT 1,
    UNIQUE (SubID , StudentID),
    FOREIGN KEY (SubID)
        REFERENCES `Subject` (SubID),
    FOREIGN KEY (StudentID)
        REFERENCES Student (StudentID)
);


