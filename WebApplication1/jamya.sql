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
endDate DATE NOT NULL,
PromotionStatus INT
)

DROP TABLE Promotions

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
	StudentID		INT NOT NULL CONSTRAINT msg_by_which_acc FOREIGN KEY REFERENCES Account(AccountID) ,
	SentTime		DATE,
	MessageText		VARCHAR(1000),	
)
SELECT * FROM [Messages]
DROP TABLE Major
CREATE TABLE Major(
	MajorID		INT	PRIMARY KEY,
	MajorName	VARCHAR(50) UNIQUE NOT NULL,
)

CREATE TABLE Posts (
	PostID		INT PRIMARY KEY IDENTITY(1,1),
	PosterID	INT NOT NULL CONSTRAINT poster_constraint 
				FOREIGN KEY REFERENCES Account(AccountID),
	PostContent	VARCHAR(200) NOT NULL
)

DROP TABLE Programmes
CREATE TABLE Programmes(
	UniversityID	INT	CONSTRAINT FK_unis_id FOREIGN KEY REFERENCES University(UniversityID) ,
	MajorID			INT CONSTRAINT FK_MAJORS_id FOREIGN KEY REFERENCES Major(MajorID) ,
	PRIMARY KEY(UniversityID,MajorID)
)


CREATE TABLE Queries (
	
	QueryID		INT PRIMARY KEY IDENTITY(1,1),
	Name		VARCHAR(100) NOT NULL,
	Email		VARCHAR(100) NOT NULL,
	Text		VARCHAR(200) NOT NULL
	
)

CREATE PROCEDURE submitQuery
@name VARCHAR(100),
@email VARCHAR(100),
@msg VARCHAR(200)
AS
BEGIN
	
	INSERT INTO Queries
	VALUES
	(@name, @email, @msg)

END


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
@count = @isStd;
EXEC isUniversity
@accID = @accId,
@count = @isUni;
declare @fname varchar(20);
declare @lname varchar(20);

if(@isStd > 0)
begin
SELECT @fname = Student.fName, @lname = Student.lName FROM Student WHERE Student.StudentID = @accId 
set @fullname = @fname + ' '+@lname 
end

PRINT 'isStd'
PRINT @isStd

if(@isUni > 0)
begin
SELECT @fname=University.Name FROM University WHERE University.UniversityID= @accId 
set @fullname = @fname
end


PRINT 'isUni'
PRINT @isStd

END



-- Get student name

CREATE PROCEDURE getStudentName
@accID INT,
@fullname VARCHAR(50) OUTPUT
AS
BEGIN

	SELECT @fullname = (fName + ' ' + lName)
	FROM Student
	WHERE Student.StudentID = @accID

END

-- Get App Uni name
-- returns the name of the university where the application has been
-- submitted
CREATE PROCEDURE getAppUniName
@appID INT,
@name VARCHAR(100) OUTPUT
AS
BEGIN

	
	SELECT @name = University.Name
	FROM Application
	JOIN University ON
	University.UniversityID = Application.UniversityID
	WHERE ApplicationID = @appID

END

-- get application apply date
CREATE PROCEDURE getAppDate
@appID INT,
@date DATE OUTPUT
AS
BEGIN

	SELECT @date = DateApplied
	FROM Application
	WHERE ApplicationID = @appID

END


-- get application status
CREATE PROCEDURE getAppStatus
@appID INT,
@status VARCHAR(50) OUTPUT
AS
BEGIN

	SELECT @status = Status
	FROM Application
	WHERE ApplicationID = @appID

END


-- get university majors
CREATE PROCEDURE getUniMajors
@uniID INT
AS
BEGIN

	SELECT * FROM Programmes
	JOIN Major
	ON Major.MajorID = Programmes.MajorID
	WHERE UniversityID = @uniID

END

EXEC getUniMajors @uniID = 4


-- get app uni id

CREATE PROCEDURE getAppUniID
@appID INT,
@uniID INT OUTPUT
AS
BEGIN

	SELECT @uniID = UniversityID
	FROM Application
	WHERE Application.ApplicationID  = @appID

END

-- updating major
CREATE PROCEDURE updateMajor
@appID INT,
@majID INT
AS
BEGIN
	
	UPDATE [Application]
	SET MajID = @majID
	WHERE ApplicationID = @appID

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
SELECT University.UniversityID, University.Name 
FROM 
	Promotions JOIN University 
ON 
	Promotions.UniversityID = University.UniversityID 
WHERE 
	endDate > GETDATE()
AND PromotionStatus = 1


CREATE PROCEDURE addPromotion
@uniID INT,
@endDate DATETIME
AS
BEGIN

	INSERT INTO Promotions
	VALUES
	(@uniID, @endDate, 0)

END


CREATE PROCEDURE getInactivePromos
@uniID INT
AS
BEGIN
	
	SELECT *
	FROM Promotions
	WHERE endDate > GETDATE()
	AND UniversityID = @uniID
	AND PromotionStatus = 0
	
END



EXEC getPromotedUniversities

SELECT * FROM Review

--getReviewsByUniID
CREATE PROCEDURE getReviewsByUniID
@uID INT
AS
BEGIN
SELECT ReviewText, Student.fName from Review 
JOIN
	University
ON
	Review.UniversityID = University.UniversityID
JOIN 
	Student
ON
	Student.StudentID = Review.StudentID
WHERE 
	University.UniversityID = @uID

END

--getApplicationsForStd
CREATE PROCEDURE getApplicationsForStd
@accID INT
AS
BEGIN
SELECT [Application].ApplicationID, University.UniversityID as [ID], University.Name,Major.MajorName FROM [Application]
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



EXEC getApplicationsForStd @accID = 6

--get Applications FOr University
CREATE PROCEDURE getApplicationsForUni
@accID INT
AS
BEGIN
	SELECT [Application].ApplicationID,
	Student.StudentID,
	(Student.fName + ' ' + Student.lName) as [Name],
	Student.StudentID as [ID],
	Major.MajorName 
	FROM [Application]
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

EXEC getApplicationsForUni @accID = 4

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
	SELECT PostedDate,Content 
	FROM Stories
	WHERE DAY(PostedDate) = DAY(GETDATE())
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

-- apply to university
CREATE PROCEDURE applyToUni
@accID INT,
@uniID INT
AS
BEGIN
	
	DECLARE @appExists INT

	SELECT @appExists = COUNT(*)
	FROM Application
	WHERE StudentID = @accID 
	AND UniversityID = @uniID
	AND MajID = 1

	IF (@appExists = 0)
	BEGIN
		
		INSERT INTO Application
		VALUES
		( @accID, @uniID, 1, GETDATE(), 'Incomplete' )

	END

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
WHERE Application.ApplicationID = @applicationID
END
--rejectApplication
CREATE PROCEDURE rejectApplication
@applicationID INT
AS
BEGIN
UPDATE [Application] SET [Application].Status = 'Rejected'
WHERE Application.ApplicationID = @applicationID
END
--updateInterMarks
CREATE PROCEDURE updateInterMarks
@stdID INT,
@marks DECIMAL(4,2)
AS
BEGIN
if(@marks < 100)
begin
UPDATE Student SET Student.Intermediate=@marks where @stdID = Student.StudentID
end
END
--updateMatricMarks
CREATE PROCEDURE updateMatricMarks
@stdID INT,
@marks DECIMAL(4,2)
AS
BEGIN
if(@marks < 100)
begin
UPDATE Student SET Student.Matric=@marks where @stdID = Student.StudentID
end
END
--updateUnderGradMarks
CREATE PROCEDURE updateUnderGradMarks
@stdID INT,
@cgpa DECIMAL(4,2)
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

-- get universities
CREATE PROCEDURE getUnis
AS
BEGIN

	SELECT *
	FROM University

END

CREATE PROCEDURE getUnisLike
@query VARCHAR(100)
AS
BEGIN

	SELECT *
	FROM University
	WHERE University.Name LIKE '%' + @query + '%';
	
END

EXEC getReviewsByUniID @uID = 4

-- adding review
CREATE PROCEDURE addReview
@uniID INT,
@accID INT,
@review VARCHAR(200)
AS
BEGIN
	
	DECLARE @count INT;
	SELECT @count = COUNT (*)
	FROM Review
	WHERE UniversityID = @uniID
	AND StudentID = @accID

	IF (@count = 0)
	BEGIN
		INSERT INTO Review
		VALUES
		(@uniID, @accID, @review)
	END
	ELSE
	BEGIN
		UPDATE Review
		SET
		ReviewText = @review
		WHERE UniversityID = @uniID
		AND StudentID = @accID
	END
	
END

-- story review trigger

CREATE TRIGGER leftReview
ON Review
AFTER INSERT
AS

	DECLARE @fullname VARCHAR(100)
	DECLARE @uniname VARCHAR(100)
	DECLARE @stdID INT

	DECLARE @rID INT

	
	SELECT @rID = ReviewID
	FROM inserted

	SELECT @fullname = (Student.fName + ' ' + Student.lName),
	@uniname = University.Name,
	@stdID = Student.StudentID
	FROM Review
	JOIN Student
	ON Student.StudentID = Review.StudentID
	JOIN University
	ON University.UniversityID = Review.UniversityID
	WHERE Review.ReviewID = @rID


	INSERT INTO Stories
	VALUES
	(@stdID, GETDATE(), @fullname + ' just left a review on ' + @uniname)


-- load notifications
CREATE PROCEDURE getNotifications
@accID INT
AS
BEGIN

	SELECT *
	FROM Notification
	WHERE receiverID = @accID OR receiverID = -1

END

-- get posts by id
CREATE PROCEDURE getPostsByID
@accID INT
AS 
BEGIN
	
	SELECT * 
	FROM Posts
	JOIN Account
	ON Account.AccountID = Posts.PosterID
	WHERE Posts.PosterID = @accID
	

END

CREATE PROCEDURE addPost
@accID INT,
@post VARCHAR(200)
AS
BEGIN

	INSERT INTO dbo.Posts (PosterID, PostContent)
	VALUES (@accID, @post)

END


SELECT * FROM Posts

CREATE PROCEDURE deletePost
@ID INT
AS
BEGIN
	
	DELETE FROM Posts
	WHERE PostID = @ID

END


EXEC getPostsByID @accID = 1


-- get suggestions for account

EXEC getSuggestionsForStd @accID = 1

CREATE PROCEDURE getSuggestionsForStd
@accID INT
AS
BEGIN
	SELECT	University.UniversityID, 
			University.Name,
			Major.MajorName,
			Major.MajorID
	FROM University
	JOIN Programmes
	ON Programmes.UniversityID = University.UniversityID
	JOIN Major
	ON Major.MajorID = Programmes.MajorID
	WHERE Major.MajorID != 1 AND Major.MajorID IN 
	(

		SELECT Major.MajorID
		FROM Application
		JOIN Major
		ON Major.MajorID = Application.MajID
		WHERE StudentID = @accID AND MajorID != 1

	)

	EXCEPT

	SELECT	University.UniversityID, 
			University.Name, 
			Major.MajorName,
			Application.MajID
	FROM Application
	JOIN University
	ON University.UniversityID = Application.UniversityID
	JOIN Major
	ON Major.MajorID = Application.MajID

END

-- get marks
CREATE PROCEDURE getMatric (
	@accID INT,
	@marks DECIMAL(4, 2) OUTPUT
)
AS
BEGIN
		

		SELECT @marks = Matric
		FROM Student
		WHERE StudentID = @accID


		IF (@marks = NULL)
		BEGIN
			SET @marks = 1;
		END


END


CREATE PROCEDURE getInter
@accID INT,
@marks DECIMAL(4, 2) OUTPUT
AS
BEGIN
		


		SELECT @marks = Intermediate
		FROM Student
	WHERE StudentID = @accID

		IF (@marks = NULL)
		BEGIN
			SET @marks = 1;
		END


END

CREATE PROCEDURE getUG
@accID INT,
@marks DECIMAL(3,1) OUTPUT
AS
BEGIN
		


		SELECT @marks = Undergraduate
		FROM Student
		WHERE StudentID = @accID

		IF (@marks = NULL)
		BEGIN
			SET @marks = 1;
		END


END


-- uni stuff

-- send notifs to applicants
CREATE PROCEDURE sendNotificationToApplicants
@uniID INT,
@text VARCHAR(200)
AS
BEGIN

	DECLARE @StdID INT = 0

	WHILE (1 = 1)
	BEGIN

		SELECT TOP 1 @StdID = StudentID
		FROM Student
		WHERE StudentID IN (
			SELECT DISTINCT StudentID
			FROM Application
			WHERE UniversityID = @uniID
		) AND StudentID > @StdID
		ORDER BY StudentID

		IF @@ROWCOUNT = 0 BREAK;

		EXEC sendNotifToStd @uniID = @uniID, @stdID = @stdID, @text = @text

	END


END


CREATE PROCEDURE sendNotifToStd
@uniID INT,
@stdID INT,
@text VARCHAR(200)
AS
BEGIN
	
	INSERT INTO Notification
	VALUES
	(@uniID, @stdID, @text)

END


CREATE PROCEDURE getAppsByStatus
@uniID INT,
@status VARCHAR(50)
AS
BEGIN

	SELECT Application.ApplicationID,
	(Student.fName + ' ' + Student.lName) as [StdName],
	Student.Matric, Student.Intermediate, Student.Undergraduate,
	Major.MajorName
	FROM Application
	JOIN Student
	ON Student.StudentID = Application.StudentID
	JOIN Major
	ON Major.MajorID = Application.MajID
	WHERE Status = @status
	AND UniversityID = @uniID
	
END


EXEC getAppsByStatus @uniID = 4, @status = 'Incomplete'


-- Mark application as incomplete
CREATE PROCEDURE setAppIncomplete
@appID INT
AS
BEGIN
	
	UPDATE Application
	SET Status = 'Incomplete'
	WHERE Application.ApplicationID = @appID

END

SELECT * FROM Application



-- trigger to send student the notification
CREATE TRIGGER sendAcceptanceNews
ON [Application]
AFTER UPDATE
AS
	DECLARE @appID INT;
	SELECT @appID = ( SELECT ApplicationID FROM inserted );

	DECLARE @uniID INT
	DECLARE @stdID INT
	DECLARE @majID INT

	DECLARE @appStatus VARCHAR(100)

	SELECT @uniID = UniversityID, 
			@stdID = StudentID, 
			@majID = MajID,
			@appStatus = Status
	FROM Application
	WHERE ApplicationID = @appID

	DECLARE @uniName VARCHAR(100);
	SELECT @uniName = University.Name
	FROM University
	WHERE University.UniversityID = @uniID

	DECLARE @majName VARCHAR(100);
	SELECT @majName = Major.MajorName
	FROM Major
	WHERE MajorID = @majID

	DECLARE @msg VARCHAR(300);

	DECLARE @fp INT		-- false positive
	SET @fp = 0

	IF (@appStatus = 'Accepted')
	BEGIN
		SET @msg = 'Congratulations! You have been accepted to ';
	END
	ELSE IF (@appStatus = 'Rejected')
	BEGIN
		SET @msg = 'Sorry! You have been rejected from ';
	END
	ELSE
	BEGIN
		SET @fp = 1
	END


	SET @msg = @msg + @uniName
	SET @msg = @msg + ' for '
	SET @msg = @msg + @majName

	IF (@fp = 0)
	BEGIN

		DECLARE @notifExists INT
		SELECT @notifExists = COUNT(*)
		FROM Notification
		WHERE senderID = @uniID AND receiverID = @stdID
		AND textContent = @msg


		IF (@notifExists = 0)
		BEGIN

			INSERT INTO Notification
			VALUES
			(@uniID, @stdID, @msg)
	
		END
	
	END

SELECT * FROM Notification
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

CREATE PROCEDURE addStory
@accID INT,
@story VARCHAR(200)
AS
BEGIN
	INSERT INTO Stories
	VALUES
	(@accID, GETDATE(), @story)
END

--prev trigger ended

CREATE TRIGGER majorTrigger
ON University
AFTER INSERT
AS

	DECLARE @uniID INT;

	SELECT @uniID = UniversityID 
	FROM inserted

	INSERT INTO Programmes
	VALUES
	(@uniID, 1)




INSERT INTO Account
VALUES
('FAST','admissions@nu.edu.pk','shmoonisgoodfella'),
('LUMS','admissions@lums.edu.pk','shmoonisgoodfella'),
('FarhanAli', 'farhanali@gmail.com', 'shmoonisgoodfella'),
('SaqibAli', 'saqib@gmail.com', 'shmoonisgoodfella'),
('SajawalAli', 'sajawal@gmail.com', 'shmoonisgoodfella'),
('NUST', 'admissions@nust.com.pk', 'shmoonisgoodfella'),
('Harvard', 'admissions@harvard.com', 'shmoonisgoodfella'),
('PunjabUniversity', 'admissions@pu.com', 'shmoonisgoodfella')


SELECT * FROM Account
SELECT * FROM University


INSERT INTO University
VALUES (13, 'FAST', 'Lahore', '030123456')

INSERT INTO University
VALUES (14, 'LUMS', 'Lahore', '030123456')

INSERT INTO University
VALUES (18, 'NUST', 'Islamabad', '030123456')

INSERT INTO University
VALUES (19, 'Harvard', 'USA', '030123456')

INSERT INTO University
VALUES (20, 'Punjab University', 'Lahore', '030123456')


SELECT * FROM University

INSERT INTO Programmes
VALUES
(13, 8),
(13, 10),
(13, 9),
(13, 6),
(13, 3),
(14, 2),
(14, 3),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(14, 9),
(14, 10),
(14, 11),
(14, 12),
(18, 6),
(18, 8),
(18, 3),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(19, 11),
(19, 12),
(20, 2),
(20, 6)


INSERT INTO Major
VALUES
(1, 'Any Major'),
(2, 'Health Sciences'),
(3, 'Data Science'),
(4, 'Nursing'),
(5, 'Biology'),
(6, 'Engineering'),
(7, 'Education'),
(8, 'CS'),
(9, 'Communication'),
(10, 'Finance'),
(11, 'Political Science'),
(12, 'History')



SELECT * FROM Account

INSERT INTO
Student
VALUES
(15, 'Farhan', 'Ali', '1999-01-01', NULL, NULL, NULL, NULL),
(16, 'Saqib', 'Ali', '1999-01-01', NULL, NULL, NULL, NULL),
(17, 'Sajawal', 'Ali', '1999-01-01', NULL, NULL, NULL, NULL)


DELETE FROM Posts
DELETE FROM Programmes
DELETE FROM Application
DELETE FROM Major
DELETE FROM Stories
DELETE FROM Queries
DELETE FROM Review
DELETE FROM Messages
DELETE FROM Notification
DELETE FROM Posts
DELETE FROM Promotions
DELETE FROM Student
DELETE FROM University
DELETE FROM Account