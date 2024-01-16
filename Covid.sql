Go
Create Database Covid19
Go

Create Table Users
( 
   UserName varchar(20) NOT NULL Primary Key,
   [Password] varchar(30) NOT NULL
)
Go
Insert into Users Values ('Admin1', '123456')

Create Table Ward
(
   WardID int Identity(1,1) Primary Key,
   WardType varchar(20),
   TotalRooms int 
)
Go
Insert into Ward Values ('Emergency',5)
Insert into Ward Values ('Isolation',10)
Insert into Ward Values ('Intense Therapy',3)


Create Table Doctor
(
   DoctorID int Identity(1,1) Primary Key,
   DoctorName varchar(40),
   DoctorAddress varchar(50),
   DoctorAge int,
   DoctorGender varchar(1)
)
Go
Insert into Doctor Values('Asad', 'Elm Street', 54, 'M') 
Insert into Doctor Values('Annie', 'Bly Manor', 34, 'F') 
Insert into Doctor Values('Mike', 'Devils Creek', 25, 'M') 

Create Table Patient
(
   PatientID int Identity(1,1) Primary Key, 
   PatientName varchar(40),
   PatientAddress varchar(50),
   PatientAge int,
   PatientGender varchar(1),
   BloodGroup varchar(2),
   PatientContact int, 
   WardID int Foreign Key References Ward(WardID),
   PatientRoomNo int,
   DoctorID int Foreign Key References Doctor(DoctorID),
)
Go
Insert into Patient Values('Brad Pitt', 'Wonderland', 34, 'M', 'A+', 090078601, 1,5,2)
Insert into Patient Values('Angelina Jolie', 'ZombieLand', 34, 'F', 'B+', 090078000, 1,4,1)
Insert into Patient Values('Leonardo Dicaprio', 'Shutter Island', 32, 'M', 'A+', 090000601, 2,3,1)
Insert into Patient Values('Anne Hathaway', 'Wonderland', 23, 'F', 'AB', 090066601, 2,2,2)
Insert into Patient Values('John Wick', 'Elm Street', 34, 'M', 'O', 090078666, 1,1,2)


Create Table Symptoms
(
   SymptomID int Identity(1,1) Primary Key,
   Symp varchar(50),
   PatientID int Foreign Key References Patient(PatientID)
)
Go
Insert into Symptoms Values ('Dry Cough',1)
Insert into Symptoms Values ('Conjuctivitus',1)
Insert into Symptoms Values ('Loss of taste and smell',2)
Insert into Symptoms Values ('Tiredness',2)
Insert into Symptoms Values ('fever',2)
Insert into Symptoms Values ('Body aches', 3)
Insert into Symptoms Values ('Sore Throat',3)
Insert into Symptoms Values ('Sore Throat', 3)

Select * From Users
Select * From Ward
Select * From Doctor
Select * From Patient
Select * From Symptoms
-------------------------------------------------------------------------------------------------
--Functinalities
-------------------------------------------------------------------------------------------------

--Add Patient
Go
Create Trigger Trigger1 On Patient
For Insert, Update
As
Declare @id1 int
Declare @id2 int
Select @id1= (Select Top 1 WardID From Patient Order By PatientID desc)
Select @id2= (Select Top 1 DoctorID From Patient Order By PatientID desc)
If Exists(Select WardID From Ward Where WardID=@id1) AND Exists(Select DoctorID From Doctor Where DoctorID=@id2)
Begin
   Print('Valid Insertion for patient')
End
Else
Begin
   Print('Sorry. The Ward ID or the Patient ID you entered is non existent.')
   Delete From Patient Where WardID=@id1
End
Insert into Patient Values('Da Vinci', 'Italian Boulevard', 40, 'M', 'B+', 344355622, 3,5,3)
--Delete Patient
Go
Create Procedure delPat (@id int)
As begin 
Delete From Patient Where PatientID=@id
end
exec delPat @id=8
--View all Patients details
Go
Create View PatientDetails As
Select p.PatientName As 'Name',p.PatientAddress As 'Address',p.PatientAge As 'Age',p.PatientGender As 'Gender', p.BloodGroup As 'BloodGroup', p.PatientContact As 'Contact'
From Patient p
Select * From PatientDetails
Go
Alter View PatientDetails As
Select p.PatientID As 'ID', p.PatientName As 'Name',p.PatientAddress As 'Address',p.PatientAge As 'Age',p.PatientGender As 'Gender', p.BloodGroup As 'BloodGroup', p.PatientContact As 'Contact'
From Patient p
--Add Patient Symptom
Go
Create Trigger Trigger2 on Symptoms
For Insert, Update
As 
Declare @id1 int
Select @id1= (Select Top 1 PatientID From Symptoms Order By SymptomID desc)
If Exists(Select PatientID From Patient Where PatientID=@id1)
Begin
   Print('Valid Insertion for patient')
End
Else
Begin
   Print('Sorry. The Ward ID or the Patient ID you entered is non existent.')
   Delete From Symptoms Where PatientID=@id1
End
Insert into Symptoms Values ('Body Aches', 5)
--Add Doctor, update doctor (Simple insertion or update)
--Delete Doctor
--View all Doctors details
Go 
Create View DoctorDetails As
Select d.DoctorName As 'Name', d.DoctorAddress As 'Address', d.DoctorAge As 'Age', d.DoctorGender As 'Gender'
From Doctor d
Select * From DoctorDetails
Go
Alter View DoctorDetails AS
Select d.DoctorID As 'ID', d.DoctorName As 'Name', d.DoctorAddress As 'Address', d.DoctorAge As 'Age', d.DoctorGender As 'Gender'
From Doctor d
--View all Patients assigned to one doctor
Go 
Create Procedure pd(@id int)
As Begin
Select p.PatientID, p.PatientName
From Patient p
Where p.DoctorID=@id
End
Exec pd @id=2
--View all Patients in a Ward
Go 
Create Procedure pw(@id int)
As Begin
Select p.PatientID, p.PatientName
From Patient p
Where p.WardID=@id
End
Exec pw @id=1
--Total number of Patients
Go
Create Procedure TotalPatients
As Begin
Select Count(PatientID) As 'Total Patients' From Patient
End
Exec TotalPatients
--Total number of doctors
Go
Create Procedure TotalDoctors
As Begin
Select Count(DoctorID) As 'Total Doctors' From Doctor
End
Exec TotalDoctors
--View symptoms of a patient
Go 
Create Procedure sp (@id int)
As Begin
Select s.Symp As 'Symptom'
From Symptoms s
Where s.PatientID=@id
End
Exec sp @id=2
--Search 1 Patient Details
Go 
Create Procedure spd(@id int)
As Begin
Select PatientName As 'Name', PatientAge As 'Age', PatientAddress As 'Address', PatientGender As 'Gender', BloodGroup As 'Blood Group', PatientRoomNo As 'Room', PatientContact As 'Contact' 
From Patient
Where PatientID=@id
End
Exec spd @id=2
--Search 1 Doctor Details
Go 
Create Procedure sdd(@id int)
As Begin
Select DoctorName As 'Name', DoctorAge As 'Age', DoctorAddress As 'Address', DoctorGender As 'Gender'
From Doctor
Where DoctorID=@id
End
--View all Patients and their doctors in one ward
Go
Create Procedure pwd (@id int)
As Begin
Select w.WardType As 'Ward Type',p.PatientID As 'Patient ID', p.PatientName As 'Patient Name', d.DoctorID As 'Doctor ID', d. DoctorName As 'Doctor Name'
From Patient p
Join Ward w On w.WardID=p.WardID
Join Doctor d On d.DoctorID=p.DoctorID
Where W.WardID=@id
End
Exec pwd @id=1
--Assign a doctor to patient
Go 
Create Procedure dtp (@id int, @id1 int)
As Begin
Update Patient
Set DoctorID=@id Where PatientID=@id1
End
Exec dtp @id=3, @id1=1
