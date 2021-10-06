DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department
		(DepartmentID 			INT AUTO_INCREMENT PRIMARY KEY,
		DepartmentName 				VARCHAR(100)
		);

INSERT INTO Department(DepartmentName)
VALUES ("sale");
INSERT INTO Department(DepartmentName)
VALUES ("marketing");

CREATE TABLE Positions
			(PositionId 	INT AUTO_INCREMENT PRIMARY KEY,
            PositionsName		VARCHAR(100)
			);
            
INSERT INTO Positions(PositionsName)
VALUES ("dev");
INSERT INTO Positions(PositionsName)
VALUES ("test");  
INSERT INTO Positions(PositionsName)
VALUES ("Scrum master");  
INSERT INTO Positions(PositionsName)
VALUES ("PM");           

CREATE TABLE Account
(AcountID 	INT AUTO_INCREMENT PRIMARY KEY,
Email 			VARCHAR(100),		
Usename 		VARCHAR(100),
Fullname		VARCHAR(100),
DepartmentID	VARCHAR(100),
PositionID		VARCHAR(100),
CreateDate		VARCHAR(100)
);

CREATE TABLE Group1
(GroupID 		INT AUTO_INCREMENT PRIMARY KEY,
GroupName		VARCHAR(100),
CreatorID       VARCHAR(100),
CreateDate      VARCHAR(100)
);

CREATE TABLE GroupAccount
(	GroupID	 	VARCHAR(100),
	AccountID	VARCHAR(100),
    JoinDate 	VARCHAR(100)
);

CREATE TABLE TypeQuestion
(TypeID 	INT AUTO_INCREMENT PRIMARY KEY,
TypeName	VARCHAR(100)
);

INSERT INTO TypeQuestion(TypeName)
VALUES ("Easy");
INSERT INTO TypeQuestion(TypeName)
VALUES ("Multiple-Choice");


CREATE TABLE CategoryQuestion
(CategoryID 	INT AUTO_INCREMENT PRIMARY KEY,
CategoryName	VARCHAR(100)
);

INSERT INTO CategoryQuestion(CategoryName)
VALUES ("JAVA");
INSERT INTO CategoryQuestion(CategoryName)
VALUES (".NET");
INSERT INTO CategoryQuestion(CategoryName)
VALUES ("SQL");
INSERT INTO CategoryQuestion(CategoryName)
VALUES ("Postman");
INSERT INTO CategoryQuestion(CategoryName)
VALUES ("Ruby");
INSERT INTO CategoryQuestion(CategoryName)
VALUES ("...");

CREATE TABLE Question
(QuestionID INT AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(100),
CategoryID	VARCHAR(100),
TypeID		VARCHAR(100),
CreatorID	VARCHAR(100),
CreateDate	VARCHAR(100)
);

CREATE TABLE Answer
(AnswerID	INT AUTO_INCREMENT PRIMARY KEY,
Content		VARCHAR(100),
QuestionID	VARCHAR(100),
isCorrect	VARCHAR(100)
);

CREATE TABLE Exam
(ExamID 	INT AUTO_INCREMENT PRIMARY KEY,
Code1		VARCHAR(100),
Title		VARCHAR(100),
CategoryID	VARCHAR(100),
Duration	VARCHAR(100),
CreatorID	VARCHAR(100),
CreateDate	VARCHAR(100)
);

CREATE TABLE 	ExamQuestion
(ExamID			VARCHAR(100),
QuestionID		VARCHAR(100)
);