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
	ApplicationID	INT PRIMARY KEY IDENTITY(1,1),	
	StudentID		INT CONSTRAINT std_id FOREIGN KEY REFERENCES Student(StudentID) , 
	UniversityID	INT CONSTRAINT uni_id FOREIGN KEY REFERENCES University(UniversityID) ,
		MajID		INT NOT NULL CONSTRAINT maj_id FOREIGN KEY REFERENCES Major(MajorID) ,
	DateApplied		DATE NOT NULL CONSTRAINT DATE_CONS CHECK (DateApplied<=GETDATE()),
	[Status]		VARCHAR(10) NOT NULL check([Status] in ('Accepted', 'Rejected', 'Incomplete','Withdrawn')),
	)
CREATE TABLE Promotions(
pID INT Primary KEY IDENTITY(1,1),
UniversityID INT CONSTRAINT unii_id FOREIGN KEY REFERENCES University(UniversityID),
endDate DATE NOT NULL
)
--Notification (Id, sender, receiver, Text)
CREATE TABLE Notification(
	nID INT PRIMARY KEY IDENTITY(1,1),
	senderID INT,
	receiverID INT,
	textContent VARCHAR(200)
)


SELECT * FROM [Application]
DROP TABLE Review
CREATE TABLE Review(
	ReviewID		INT	NOT NULL IDENTITY(1,1),
	UniversityID	INT NOT NULL CONSTRAINT review_for_which_uni FOREIGN KEY REFERENCES University(UniversityID) ,
	StudentID		INT NOT NULL CONSTRAINT review_by_which_std FOREIGN KEY REFERENCES Student(StudentID) ,
	ReviewText		VARCHAR(800),
	PRIMARY KEY(UniversityID,StudentID)
)
DROP TABLE Application
SELECT * FROM Review
CREATE TABLE Stories
(
accID	INT CONSTRAINT fk_unii_acc_id FOREIGN KEY REFERENCES Account(AccountID) ON UPDATE CASCADE ON DELETE CASCADE,
PostedDate DATE NOT NULL,
Content VARCHAR(200) NOT NULL,
)
DROP TABLE [Messages]
CREATE TABLE [Messages](
	MessageID		INT PRIMARY KEY NOT NULL IDENTITY (1,1),
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
--getUserName
CREATE PROCEDURE getUserName
@accID INT,
@username nvarchar(50) output
AS
BEGIN
select @username=Username FROM Account where @accID=Account.AccountID
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
--getNameByID
CREATE PROCEDURE getName
@accId INT,
@fullname VARCHAR(50) OUTPUT
AS
BEGIN
declare @isStd INT;
declare @isUni INT;
EXEC isStudent
@accID = @accId,
@isStd = @count;
EXEC isUniversity
@accID = @accId,
@isUni= @count;
declare @fname varchar(20);
declare @lname varchar(20);

if(@isStd > 0)
begin
SELECT @fname = Student.fName, @lname = Student.lName FROM Student WHERE Student.StudentID = @accId 
set @fullname = @fname + ' '+@lname 
end

if(@isUni > 0)
begin
SELECT @fname=University.Name FROM University WHERE University.UniversityID= @accId 
set @fullname = @fname
end
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

--returns uniName for uniID
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
--get those Universities that are open for admissions
--will return list of universities
CREATE PROCEDURE getPromotedUniversities 
AS 
SELECT University.Name 
FROM 
	Promotions JOIN University 
ON 
	Promotions.UniversityID = University.UniversityID 
WHERE 
	endDate > GETDATE()
--getReviewsByUniID
CREATE PROCEDURE getReviewsByUniID
@uID INT
AS
BEGIN
SELECT ReviewText from Review 
JOIN
	University
ON
	Review.UniversityID = University.UniversityID
WHERE 
	University.UniversityID = @uID
END
--getApplicationsForStd
CREATE PROCEDURE getApplicationsForStd
@accID INT
AS
BEGIN
SELECT [Application].ApplicationID,University.Name,Major.MajorName FROM [Application]
JOIN
	Student
ON
	Student.StudentID = [Application].StudentID
JOIN 
	Major
ON
	Major.MajorID=[Application].MajID
JOIN 
	University
ON 
	University.UniversityID = [Application].UniversityID
WHERE 
	[Application].StudentID = @accID
END
--get Applications FOr University
CREATE PROCEDURE getApplicationsForUni
@accID INT
AS
BEGIN
SELECT [Application].ApplicationID,Student.StudentID,Student.fName,Student.lName,Major.MajorName FROM [Application]
JOIN
	Student
ON
	Student.StudentID = [Application].StudentID
JOIN 
	Major
ON
	Major.MajorID=[Application].MajID
JOIN 
	University
ON 
	University.UniversityID = [Application].UniversityID
WHERE 
	[Application].UniversityID = @accID
END
----get Notifications for AccountID
CREATE PROCEDURE getNotificationsForID
@accID INT
AS
BEGIN
SELECT textContent FROM [Notification] WHERE [Notification].receiverID = @accID
END
--getStories will return all the stories Content
CREATE PROCEDURE getStories
AS
BEGIN
SELECT PostedDate,Content FROM Stories
END
--get Programmes that university offers
CREATE PROCEDURE getProgramsForUniversity
@uniID INT
AS
BEGIN
Select MajorName FROM Programmes 
JOIN 
	University 
ON
	University.UniversityID = Programmes.UniversityID
JOIN 
	Major 
ON 
	Major.MajorID = Programmes.MajorID
WHERE 
	Programmes.UniversityID = @uniID
END
--deleteApplicationByApplicationID
CREATE PROCEDURE deleteApplication
@applicationID INT
AS 
BEGIN
DELETE FROM [Application] WHERE ApplicationID = @applicationID
END
--acceptApplication
CREATE PROCEDURE acceptApplication
@applicationID INT
AS
BEGIN
UPDATE [Application] SET [Application].Status = 'Accepted'
END
--rejectApplication
CREATE PROCEDURE rejectApplication
@applicationID INT
AS
BEGIN
UPDATE [Application] SET [Application].Status = 'Rejected'
END
--updateInterMarks
CREATE PROCEDURE updateInterMarks
@stdID INT,
@marks INT
AS
BEGIN
if(@marks < 1100)
begin
UPDATE Student SET Student.Intermediate=@marks where @stdID = Student.StudentID
end
END
--updateMatricMarks
CREATE PROCEDURE updateMatricMarks
@stdID INT,
@marks INT
AS
BEGIN
if(@marks < 1100)
begin
UPDATE Student SET Student.Matric=@marks where @stdID = Student.StudentID
end
END
--updateUnderGradMarks
CREATE PROCEDURE updateUnderGradMarks
@stdID INT,
@cgpa INT
AS
BEGIN
if(@cgpa < 4.0)
begin
UPDATE Student SET Student.Undergraduate=@cgpa where @stdID = Student.StudentID
end
END
--updateGradMarks
CREATE PROCEDURE updateGradMarks
@stdID INT,
@cgpa INT
AS
BEGIN
if(@cgpa < 4.0)
begin
UPDATE Student SET Student.Graduate=@cgpa where @stdID = Student.StudentID
end
END
--updateDateOfBirth
CREATE PROCEDURE updateDOB
@stdID INT,
@dob date
AS
BEGIN
if(@dob < getDate())
begin
UPDATE Student SET Student.DOB=@dob where @stdID = Student.StudentID
end
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
--loadmessages
DROP VIEW loadMessages
CREATE PROCEDURE loadMessages
AS
BEGIN
SELECT	Account.AccountID,
		Account.Username, 
		Messages.MessageText,
		Messages.SentTime 
from Account 
JOIN 
	Messages 
	ON 
	Account.AccountID = Messages.StudentID
END

-- load notifications
CREATE PROCEDURE getNotifications
@accID INT
AS
BEGIN

	SELECT *
	FROM Notification
	WHERE receiverID = @accID OR receiverID = -1

END

--notification/stories trigger
--sajawal applied for fast
CREATE TRIGGER applyNews
ON [Application]
AFTER INSERT 
AS
declare @fname varchar(20);
declare @lname varchar(20);
declare @uniName varchar(200);
declare @stdID int;

SELECT @stdID = [Application].StudentID, @fname = fName, @lname=lName, @uniName = University.Name
FROM [Application]
JOIN Student ON Student.StudentID=[Application].StudentID 
JOIN University ON University.UniversityID = [Application].UniversityID

DECLARE @msg VARCHAR(200);

SET @msg = @fname + ' ' + @lname + ' applied to ' + @uniName;

INSERT INTO Stories
VALUES (@stdID,GETDATE(),@msg)

--prev trigger ended


INSERT INTO Account
VALUES
('FAST','fast@ggl.com','shmoonisgoodfella'),
('LUMS','lums@ggl.com','shmoonisgoodfella'),
('FarhanAli', 'larhan@ggl.com', 'shmoonisgoodfella'),
('SaqibAli', 'saqib@ggl.com', 'shmoonisgoodfella'),
('SajawalAli', 'sajawal@ggl.com', 'shmoonisgoodfella')

INSERT INTO
Student
VALUES
(6, 'Farhan', 'Ali', '2001-01-01', NULL, NULL, NULL, NULL)

INSERT INTO Student
VALUES	(1,'Shmoon','Ali','2001-01-01',NULL,NULL,NULL,NULL)
INSERT INTO Major VALUES(1,'CS')
INSERT INTO Major VALUES(2,'AI')
INSERT INTO Major VALUES(3,'BBA')
INSERT INTO Programmes Values(4,1)
INSERT INTO Programmes Values(4,2)
INSERT INTO Programmes Values(4,3)
INSERT INTO Programmes Values(5,1)
INSERT INTO Programmes Values(5,3)
INSERT INTO Application VALUES(12,13,1,getDate(),'Incomplete')
INSERT INTO Application VALUES(12,13,2,getDate(),'Incomplete')
INSERT INTO Application VALUES(17,14,3,getDate(),'Incomplete')
INSERT INTO Application VALUES(17,14,1,getDate(),'Incomplete')
INSERT INTO Review VALUES(13,18,'Fast was brilliant')
INSERT INTO Review VALUES(14,18,'NUST was not brilliant')
INSERT INTO University
VALUES
(4, 'FAST', 'Lahore', '030123456'),
(5, 'LUMS', 'Islamabad', '030123456')
Select * from Messages
Select * from Account
Select * from Programmes
Select * from Stories
Select * from Student
Select * from Promotions
Select * from University
SELECT * FROM Review
SELECT * FROM Application
SELECT * FROM Major
SELECT * FROM Messages
SELECT * FROM Notification

INSERT INTO Notification
VALUES
(-1, -1, 'FAST-NUCES has started admissions for Fall 2021'),
(-1, 1, 'Congratulations! You have been accepted to LUMS!')

INSERT INTO Stories
VALUES
(1, GETDATE(), 'FAST University has extended its deadline!'),
(1, GETDATE(), 'NUST University has started their admissions!')