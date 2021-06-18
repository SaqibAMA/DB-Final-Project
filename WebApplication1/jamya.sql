DROP DATABASE Jamya;
CREATE DATABASE Jamya;
USE Jamya
DROP TABLE Account
CREATE TABLE Account(
	AccountID	INT PRIMARY KEY IDENTITY(0, 1),
	Username	VARCHAR(20) UNIQUE NOT NULL,		
	Email		NVARCHAR(320) UNIQUE NOT NULL,
	[Password]	NVARCHAR(50)  NOT NULL,
	);
DROP TABLE Student
CREATE TABLE Student(
	StudentID	INT PRIMARY KEY CONSTRAINT FK_ACCID FOREIGN KEY REFERENCES Account(AccountID) ON UPDATE CASCADE ON DELETE CASCADE,
	fName		VARCHAR(20)	NOT NULL,
	lName		VARCHAR(20)	NOT NULL,
	DOB			DATE	NOT NULL  CONSTRAINT DATE_CHECK CHECK (DOB<GETDATE()),
	Matric		DECIMAL(4,2) CONSTRAINT must_be_less_than_100_percent CHECK (Matric>0 AND Matric<=100),
	[Intermediate]	DECIMAL(4,2)	CONSTRAINT no_more_than_100_percent CHECK ([Intermediate]>0 AND [Intermediate]<=100),
	Undergraduate	DECIMAL(3,1) CONSTRAINT gpa_no_more_than_4 CHECK (Undergraduate>0 AND Undergraduate<=4.0),
	Graduate		DECIMAL(3,1)	CONSTRAINT gpaa_no_more_than_4 CHECK (Graduate>0 AND Graduate<=4.0),
)
SELECT * FROM Student
DROP TABLE University
CREATE TABLE University(
	UniversityID	INT PRIMARY KEY CONSTRAINT fk_uni_acc_id FOREIGN KEY REFERENCES Account(AccountID) ON UPDATE CASCADE ON DELETE CASCADE,
	Name		VARCHAR(100) NOT NULL,
	[Address]	varchar(100),
	Contact		nvarchar(20),			
)
SELECT * FROM University
DROP TABLE [Application]
CREATE TABLE [Application](
	ApplicationID	INT PRIMARY KEY,	
	StudentID		INT CONSTRAINT std_id FOREIGN KEY REFERENCES Student(StudentID) , 
	UniversityID	INT CONSTRAINT uni_id FOREIGN KEY REFERENCES University(UniversityID) ,
	DateApplied		DATE NOT NULL CONSTRAINT DATE_CONS CHECK (DateApplied<=GETDATE()),
	[Status]		VARCHAR(10) NOT NULL check([Status] in ('Accepted', 'Rejected', 'Incomplete','Withdrawn')),
	)

ALTER TABLE [Application] ADD MajID INT CONSTRAINT maj_id FOREIGN KEY REFERENCES Major(MajorID) 



CREATE TABLE Promotions(
pID INT Primary KEY IDENTITY(1,1),
UniversityID INT CONSTRAINT unii_id FOREIGN KEY REFERENCES University(UniversityID),
endDate DATE NOT NULL
)
SELECT * FROM [Application]
DROP TABLE Review
CREATE TABLE Review(
	ReviewID		INT	PRIMARY KEY NOT NULL,
	UniversityID	INT NOT NULL CONSTRAINT review_for_which_uni FOREIGN KEY REFERENCES University(UniversityID) ,
	StudentID		INT NOT NULL CONSTRAINT review_by_which_std FOREIGN KEY REFERENCES Student(StudentID) ,
	ReviewText		VARCHAR(800),
)
SELECT * FROM Review
CREATE TABLE Stories
(
accID	INT PRIMARY KEY CONSTRAINT fk_unii_acc_id FOREIGN KEY REFERENCES Account(AccountID) ON UPDATE CASCADE ON DELETE CASCADE,
PostedDate DATE NOT NULL,
Content VARCHAR(200) NOT NULL,
)
DROP TABLE [Messages]
CREATE TABLE [Messages](
	MessageID		INT PRIMARY KEY NOT NULL,
	StudentID		INT NOT NULL CONSTRAINT msg_by_which_std FOREIGN KEY REFERENCES Student(StudentID) ,
	SentTime		DATE,
	MessageText		VARCHAR(1000),	
)
SELECT * FROM [Messages]
DROP TABLE Major
CREATE TABLE Major(
	MajorID		INT	PRIMARY KEY,
	MajorName	VARCHAR(50) UNIQUE NOT NULL,
)
DROP TABLE Programmes
CREATE TABLE Programmes(
	UniversityID	INT	CONSTRAINT FK_unis_id FOREIGN KEY REFERENCES University(UniversityID) ,
	MajorID			INT CONSTRAINT FK_MAJORS_id FOREIGN KEY REFERENCES Major(MajorID) ,
	PRIMARY KEY(UniversityID,MajorID)
)
INSERT INTO Account(AccountID,Username,Email,[Password]) 
VALUES 
(1,'sajawalali546','saju123@gmail.com','redmi1122'),
(2,'farhan','@gmail.com','redmi1122');
INSERT INTO Student
VALUES (1,'Sajawal','Ali','03-03-2001',90.11,91.9,3.1,1),
(2,'farhan','Ali','03-03-2001',92,90.2,3.8,1);
Select * from Student
INSERT INTO Account(AccountID,Username,Email,[Password]) 
VALUES 
(3,'sajawaluniversity','saju123@gmmail.com','redmi1122');
INSERT INTO University
VALUES(3,'CHiggi Chiggi','Fasial Town','0323-5106349');
INSERT INTO Major
VALUES(1,'BS(CS)'),
(2,'BS(EE)');
INSERT INTO Programmes
VALUES (3,1),
(3,2);
INSERT INTO Application
VALUES
(1,2,3,'4-7-2021','Rejected')
INSERT INTO Review
VALUES
(1,3,1,'SELECT
CustomerId,
ProductId,
UnitsOrdered
FROM
Orders
WHERE
(UnitsOrdered > 2)
ORDER BY
UnitsOrdered DESC');
INSERT INTO [Messages]
VALUES
(1000,1,3,'hello my name is sajawal ali jutt tpodaay i khlkjbsdvbasdljhlas i,.ajd sakd vaksjdvjkashd va.m jdv')
--UserExists?
DROP PROCEDURE isUsrExists
CREATE PROCEDURE isUsrExists
@username nvarchar(50),
@password nvarchar(50),
@email nvarchar(50) output
AS
BEGIN
set @email=(SELECT Email FROM dbo.Account WHERE Username=@username AND [Password]=@password)
END

--getID
drop PROCEDURE getID
CREATE PROCEDURE getID
@eml nvarchar(50),
@accID int output
AS
BEGIN
set @accID=(SELECT AccountID FROM dbo.Account where Email=@eml)
END
--isStudent
DROP PROCEDURE isStudent
CREATE PROCEDURE isStudent
@accID int,
@count int output
AS
BEGIN
set @count=(SELECT COUNT(*) FROM dbo.Student where StudentID=@accID)
END
--isUniversity
CREATE PROCEDURE isUniversity
@accID int,
@count int output
AS
BEGIN
set @count=(SELECT COUNT(*) FROM dbo.University where UniversityID=@accID)
END
--StdDetails
DROP PROCEDURE stdDetails
CREATE PROCEDURE stdDetails
@accID int,
@fName varchar(20) output,
@lName varchar(20) output
AS
BEGIN
set @fName=(SELECT fName FROM dbo.Student where StudentID=@accID)
set @lName=(SELECT lName FROM dbo.Student where StudentID=@accID)
END
DROP PROCEDURE uniName
CREATE PROCEDURE uniName
@accID int,
@uName varchar(50) output
AS
BEGIN
set @uName=(SELECT Name FROM dbo.University where UniversityID=@accID)
END
--isUsrWhileSignUP
DROP PROCEDURE isAlreadyUsr
CREATE PROCEDURE isAlreadyUsr
@username varchar(50),
@email nvarchar(50),
@ucount int output,
@ecount int output
AS
BEGIN
set @ucount=(SELECT COUNT(*) FROM dbo.Account WHERE Username=@username)
set @ecount=(SELECT COUNT(*) FROM dbo.Account WHERE Email=@email)
END
--uniSignup
DROP PROCEDURE uniSignup
CREATE PROCEDURE uniSignup
@username varchar(50),
@email nvarchar(50),
@password nvarchar(50),
@uName varchar(50),
@address varchar(50),
@contact nvarchar(20)
AS 
BEGIN
declare @id int
INSERT INTO dbo.Account VALUES(@username,@email,@password)
set @id=(SELECT top 1 AccountID FROM dbo.Account WHERE username=@username)
INSERT INTO dbo.University VALUES(@id,@uName,@address,@contact)
END 
--stdSignup
DROP PROCEDURE stdSignup
CREATE PROCEDURE stdSignup
@username varchar(50),
@email nvarchar(50),
@password nvarchar(50),
@fName varchar(20),
@lName varchar(20),
@defaultdate varchar(20)
AS BEGIN
declare @id int
INSERT INTO dbo.Account VALUES(@username,@email,@password)
set @id=(SELECT top 1 AccountID FROM dbo.Account WHERE username=@username)
INSERT INTO dbo.Student VALUES(@id,@fName,@lName,@defaultdate,NULL,NULL,NULL,NULL)
END

--putMessageIntoDatabase
CREATE PROCEDURE insertMessage
@accountID int,
@message nvarchar(500)
AS BEGIN
declare @datetime date
set @datetime=getDate()
INSERT INTO dbo.Messages VALUES(@accountID,@datetime,@message)
END

--loadMessages
CREATE VIEW loadMessages
AS
SELECT Account.Username, Messages.MessageText,Messages.SentTime from Account JOIN Messages ON Account.AccountID=Messages.MessageID


Select * from Messages
Select * from Account
delete from Account
Select * from Student
delete from Student
Select * from University