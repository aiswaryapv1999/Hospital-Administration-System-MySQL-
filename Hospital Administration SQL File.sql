
-- HOSPITAL ADMINISTRATION SYSTEM(MySQL)--

-- Database Creation--

CREATE DATABASE Hospital_DB;

USE Hospital_DB;

-- Table Design--

CREATE TABLE Departments(Department_id INT PRIMARY KEY AUTO_INCREMENT, Department_name VARCHAR(50));
CREATE TABLE Doctors (Doctor_id INT Primary Key AUTO_INCREMENT, Doctor_Name VARCHAR(50), Specialization VARCHAR(100), Department_id INT NOT NULL, Phone VARCHAR(15),
                      FOREIGN KEY (Department_id) REFERENCES Departments(Department_Id));
CREATE TABLE Patients(Patient_id INT PRIMARY KEY AUTO_INCREMENT, Patient_Name VARCHAR(30), Age INT, Gender ENUM('M','F'),Phone VARCHAR(15));
CREATE TABLE Appointments(Appointment_id INT PRIMARY KEY AUTO_INCREMENT, 
                          Patient_id INT NOT NULL, Doctor_id INT NOT NULL, 
                          Appointment_date DATE, Appointment_time TIME,
                          Status ENUM('Completed', 'Pending',  'Cancelled'),
                          FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
                          FOREIGN KEY (Doctor_id) REFERENCES Doctors(Doctor_id));
CREATE TABLE Billing(Bill_id INT PRIMARY KEY AUTO_INCREMENT, Patient_id INT NOT NULL, Amount DECIMAL(10,2), Bill_date DATE, Payment_status ENUM('Paid' , 'Unpaid'),
					FOREIGN KEY(Patient_id) REFERENCES Patients(Patient_id));
  
  
-- Data Insertion--

INSERT INTO Departments(Department_name) VALUES ('Cardiology'),
												('Neurology'),
                                                ('Orthopedics'),
                                                ('General Medicine');

INSERT INTO Doctors (Doctor_Name, Specialization, Department_id, Phone) VALUES ('Dr. Anil Kumar', 'Cardiologist', 1, 9876543210),
                                                                               ('Dr. Meera Nair', 'Neurologist', 2, 9876543222),
																			   ('Dr. John Thomas', 'Orthopedic', 3, 9876543233);
 
INSERT INTO Patients(Patient_Name, Age, Gender, Phone) VALUES ('Rahul Menon',	35,	'M', 9123456780),
                                                               ('Anjali Devi', 28, 'F', 9123456791),
                                                               ('Suresh Kumar', 52, 'M', 9123456792);

INSERT INTO Appointments(Patient_id, Doctor_id, Appointment_date, Appointment_time, Status) VALUES (1,	1, '2025-01-05', '10:30', 'Completed'),
																							        (2,	2,	'2025-01-06', '11:00',	'Pending'),
                                                                                                    (3,	1, '2025-01-06', '12:00', 'Cancelled');

INSERT INTO Billing(Patient_id, Amount, Bill_date, Payment_status) VALUES (1, 2500, '2025-01-05', 'Paid'),
                                                                          (2, 4000, '2025-01-06', 'Unpaid'),
                                                                          (3, 1500, '2025-01-06', 'Paid');
                                                                          
SELECT * FROM Departments;
SELECT * FROM Doctors;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT * FROM Billing;

-- BUSINESS REQUIREMENT QUERIES--

SELECT p.Patient_Name, d.Doctor_Name, d.Specialization FROM Patients p JOIN Appointments a ON p.Patient_id = a.Patient_id JOIN Doctors d ON a.Doctor_id = d.Doctor_id;

SELECT * FROM Appointments WHERE Appointment_date = CURRENT_DATE();

SELECT  Departments.Department_name, Doctors.Doctor_Name FROM Departments LEFT JOIN Doctors ON Doctors.Department_id = Departments.Department_id;

SELECT SUM(Amount) AS Total_Paid_Amount FROM Billing WHERE Payment_status ='Paid';

SELECT p.Patient_id, p.Patient_name, b.Payment_status FROM Patients p INNER JOIN Billing b ON p.Patient_id = b.Patient_id WHERE Payment_status = 'Unpaid';

SELECT d.Doctor_name, COUNT(a.Patient_id) FROM Doctors d INNER JOIN Appointments a ON d.Doctor_id = a.Doctor_id GROUP BY d.Doctor_name;

SELECT Departments.Department_name, COUNT(Doctors.Doctor_id) FROM Departments LEFT JOIN Doctors ON Departments.Department_id = Doctors.Department_id GROUP BY Department_name;

-- UPDATE AND DELETE QUERIES--

UPDATE Appointments SET Status = 'Completed' WHERE Status = 'Pending';
SELECT * FROM Appointments;

DELETE  FROM Appointments WHERE Status = 'Cancelled';
SELECT * FROM Appointments;

UPDATE Billing SET Payment_status = 'Paid' WHERE Bill_id =2;
SELECT * FROM Billing;

-- ADVANCED SQL--

SELECT p.Patient_id,  p.Patient_Name, b.Amount FROM Patients p  JOIN Billing b ON p.Patient_id = b.Patient_id WHERE b.Amount >(SELECT AVG(Amount) FROM Billing);

SELECT d.Doctor_id,d.Doctor_Name, COUNT(a.Appointment_id) AS No_of_Appointments FROM Doctors d INNER JOIN Appointments a ON d.Doctor_id = a.Doctor_id 
GROUP BY d.Doctor_Name, d.Doctor_id HAVING COUNT(a.Doctor_id)>1;

SELECT p.Patient_Name, b.Amount AS Maximum_Bill_Amount FROM Billing b JOIN Patients p ON b.Patient_id = p.Patient_id WHERE b.Amount = (SELECT MAX(Amount)FROM Billing WHERE Payment_status = 'Paid');







