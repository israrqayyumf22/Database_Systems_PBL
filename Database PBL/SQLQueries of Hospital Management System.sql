CREATE DATABASE HOSPITAL_MANAGEMENT_SYSTEM;
USE HOSPITAL_MANAGEMENT_SYSTEM;
--Department
CREATE TABLE Department ( 
  Dept_ID INT NOT NULL, 
  Dept_Head VARCHAR(20) NOT NULL,
  Dept_Name VARCHAR(15) NOT NULL, 
  Emp_Count INT, 
  PRIMARY KEY (Dept_ID) 
);
--Staff
CREATE TABLE Staff ( 
  Emp_ID INT NOT NULL, 
  Emp_FName VARCHAR(20) NOT NULL, 
  Emp_LName VARCHAR(20) NOT NULL,
  Date_Joining DATE, 
  Date_Seperation DATE, 
  Emp_Type VARCHAR(15) NOT NULL, 
  Email VARCHAR(50), 
  Address VARCHAR(50) NOT NULL,
  Dept_ID INT NOT NULL,
  SSN INT NOT NULL, 
  PRIMARY KEY (Emp_ID), 
  FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID) 
);
--Patient
CREATE TABLE Patient ( 
  Patient_ID INT NOT NULL, 
  Patient_FName VARCHAR(20) NOT NULL,
  Patient_LName VARCHAR(20) NOT NULL, 
  Phone VARCHAR(12) NOT NULL,
  Blood_Type VARCHAR(5) NOT NULL, 
  Email VARCHAR(50), 
  Gender VARCHAR(10),
  Condition_ VARCHAR(30),
  Admission_Date DATE,
  Discharge_Date DATE, 
  PRIMARY KEY (Patient_ID)
);
--Doctor
CREATE TABLE Doctor ( 
  Doctor_ID INT NOT NULL, 
  Qualifications VARCHAR(15) NOT NULL,
  Emp_ID INT NOT NULL, 
  Specialization VARCHAR(20) NOT NULL, 
  Dept_ID INT NOT NULL, 
  PRIMARY KEY (Doctor_ID), 
  FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID), 
  FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID) 
);
--Nurse
CREATE TABLE Nurse ( 
  Nurse_ID INT NOT NULL,
  Patient_ID INT NOT NUL,
  Emp_ID INT NOT NULL, 
  Dept_ID INT NOT NULL, 
  PRIMARY KEY(Nurse_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID), 
  FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID), 
  FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID) 
);
--Appointment
CREATE TABLE Appointment ( 
  Appt_ID INT NOT NULL, 
  Scheduled_On DATETIME NOT NULL,
  Date_ DATE,
  Time_ TIME,
  Doctor_ID INT NOT NULL, 
  Patient_ID INT NOT NULL, 
  PRIMARY KEY (Appt_ID), 
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) 
);
--Emergency Contact
CREATE TABLE EmergencyContact( 
  Contact_ID INT NOT NULL,
  Contact_Name VARCHAR(20) NOT NULL, 
  Phone VARCHAR(12) NOT NULL, 
  Relation VARCHAR(20) NOT NULL, 
  Patient_ID INT NOT NULL, 
  PRIMARY KEY (Contact_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) 
);
--Medical History
CREATE TABLE MedicalHistory ( 
  Record_ID INT NOT NULL, 
  Patient_ID INT NOT NULL,
  Allergies VARCHAR(50), 
  Pre_Conditions VARCHAR(50), 
  PRIMARY KEY (Record_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
--Medicine
CREATE TABLE Medicine( 
  Medicine_ID INT NOT NULL, 
  M_Name VARCHAR(20) NOT NULL,
  M_Quantity INT NOT NULL, 
  M_Cost Decimal(10,2), 
  PRIMARY KEY (Medicine_ID) 
);
--Prescription
CREATE TABLE Prescription ( 
  Prescription_ID INT NOT NULL, 
  Patient_ID INT NOT NULL,
  Medicine_ID INT NOT NULL, 
  Date_ DATE, 
  Dosage INT, 
  Doctor_ID INT NOT NULL, 
  PRIMARY KEY (Prescription_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID), 
  FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID)
);
--Insurance
CREATE TABLE Insurance ( 
  Policy_Number VARCHAR(20) NOT NULL, 
  Patient_ID INT NOT NULL, 
  Ins_Code VARCHAR(20) NOT NULL, 
  End_Date VARCHAR(10), 
  Provider VARCHAR(20), 
  InsurancePlan VARCHAR(20), 
  Co_Pay DECIMAL(10,2), 
  Coverage VARCHAR(20), 
  Maternity BIT, 
  Dental BIT, 
  Optical BIT, 
  PRIMARY KEY (Policy_Number), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
--Lab_Screening
CREATE TABLE Lab_Screening ( 
  Lab_ID INT NOT NULL, 
  Patient_ID INT NOT NULL,
  Doctor_ID INT NOT NULL,   
  Test_Cost DECIMAL(10,2),
  Date_ DATE NOT NULL,   
  PRIMARY KEY (Lab_ID), 
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID), 
  FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID)
);
--Room
CREATE TABLE Room ( 
  Room_ID INT NOT NULL, 
  Room_Type VARCHAR(50) NOT NULL, 
  Patient_ID INT NOT NULL,
  Room_Cost DECIMAL(10,2),       
  PRIMARY KEY (Room_ID),               
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) 
);
--Bill
CREATE TABLE Bill ( 
  Bill_ID INT NOT NULL, 
  Date_ DATE NOT NULL, 
  Other_Charges DECIMAL(10,2), 
  M_Cost DECIMAL(10,2), 
  Total DECIMAL(10,2), 
  Patient_ID INT NOT NULL, 
  Remaining_Balance DECIMAL(10,2), 
  Policy_Number VARCHAR(20) NOT NULL,
  PRIMARY KEY (Bill_ID),
  FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID), 
  FOREIGN KEY (Policy_Number) REFERENCES Insurance (Policy_Number) 
);
--Payroll
CREATE TABLE Payroll ( 
  Account_No VARCHAR(25) NOT NULL, 
  Salary DECIMAL(10,2) NOT NULL, 
  Bonus DECIMAL(10,2), 
  Emp_ID INT NOT NULL, 
  IBAN VARCHAR(25), 
  PRIMARY KEY (Account_No), 
  FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID) 
);
--Department
INSERT INTO Department (Dept_ID, Dept_Head, Dept_Name, Emp_Count) VALUES
(101, 'Dr. Ali Khan', 'Cardiology', 25),
(102, 'Dr. Fatima Ahmed', 'Neurology', 22),
(103, 'Dr. Hassan Malik', 'Orthopedics', 27),
(104, 'Dr. Aisha Khan', 'Pediatrics', 21),
(105, 'Dr. Jamal Khan', 'Oncology', 24),
(106, 'Dr. Sara Ali', 'Gynecology', 23),
(107, 'Dr. Ahmed Raza', 'ENT', 26),
(108, 'Dr. Hina Mahmood', 'Dermatology', 20),
(109, 'Dr. Bilal Qureshi', 'Urology', 28),
(110, 'Dr. Sana Arif', 'Psychiatry', 22),
(111, 'Dr. Saad Abbasi', 'Radiology', 23),
(112, 'Dr. Zainab Khan', 'Endocrinology', 25),
(113, 'Dr. Imran Shah', 'General Surgery', 30),
(114, 'Dr. Maria Khan', 'Internal Med', 29),
(115, 'Dr. Yasir Mahmood', 'Plastic Surgery', 24),
(116, 'Dr. Sadia Ali', 'Ophthalmology', 26),
(117, 'Dr. Fahad Akram', 'Nephrology', 21),
(118, 'Dr. Ayesha Rehman', 'Hematology', 27),
(119, 'Dr. Amir Khan', 'Pulmonology', 22),
(120, 'Dr. Samina Iqbal', 'Anesthesiology', 23);
--Staff
INSERT INTO Staff (Emp_ID, Emp_FName, Emp_LName, Date_Joining, Date_Seperation, Emp_Type, Email, Address, Dept_ID, SSN) VALUES
(1021, 'Ali', 'Khan', '2020-01-15', NULL, 'Doctor', 'ali.khan@example.com', '123 Main Street, Lahore', 101, 123456789),
(1022, 'Fatima', 'Ahmed', '2019-05-20', NULL, 'Doctor', 'fatima.ahmed@example.com', '456 Park Avenue, Karachi', 102, 234567890),
(1023, 'Hassan', 'Malik', '2021-03-10', NULL, 'Doctor', 'hassan.malik@example.com', '789 Broadway, Islamabad', 103, 345678901),
(1024, 'Aisha', 'Khan', '2018-08-25', NULL, 'Doctor', 'aisha.khan@example.com', '101 River Road, Faisalabad', 104, 456789012),
(1025, 'Jamal', 'Khan', '2017-11-30', NULL, 'Doctor', 'jamal.khan@example.com', '321 Elm Street, Peshawar', 105, 567890123),
(1026, 'Sara', 'Ali', '2019-09-12', NULL, 'Nurse', 'sara.ali@example.com', '555 Oak Lane, Lahore', 106, 678901234),
(1027, 'Ahmed', 'Raza', '2020-07-05', NULL, 'Nurse', 'ahmed.raza@example.com', '777 Maple Drive, Karachi', 107, 789012345),
(1028, 'Hina', 'Mahmood', '2021-04-18', NULL, 'Nurse', 'hina.mahmood@example.com', '999 Pine Street, Islamabad', 108, 890123456),
(1029, 'Bilal', 'Qureshi', '2019-02-22', NULL, 'Technician', 'bilal.qureshi@example.com', '222 Cedar Avenue, Faisalabad', 109, 901234567),
(1030, 'Sana', 'Arif', '2018-06-07', NULL, 'Technician', 'sana.arif@example.com', '444 Birch Road, Peshawar', 110, 123450987),
(1031, 'Saad', 'Abbasi', '2020-10-30', NULL, 'Technician', 'saad.abbasi@example.com', '666 Spruce Court, Lahore', 111, 234509876),
(1032, 'Zainab', 'Khan', '2017-12-12', NULL, 'Receptionist', 'zainab.khan@example.com', '888 Oak Avenue, Karachi', 112, 345098765),
(1033, 'Imran', 'Shah', '2019-04-25', NULL, 'Receptionist', 'imran.shah@example.com', '123 Maple Lane, Islamabad', 113, 450987654),
(1034, 'Maria', 'Khan', '2018-11-18', NULL, 'Administrator', 'maria.khan@example.com', '456 Pine Drive, Faisalabad', 114, 509876543),
(1035, 'Yasir', 'Mahmood', '2020-08-03', NULL, 'Administrator', 'yasir.mahmood@example.com', '789 Cedar Road, Peshawar', 115, 098765432),
(1036, 'Sadia', 'Ali', '2021-01-09', NULL, 'Janitor', 'sadia.ali@example.com', '987 Birch Lane, Lahore', 116, 987654321),
(1037, 'Fahad', 'Akram', '2019-07-14', NULL, 'Janitor', 'fahad.akram@example.com', '654 Elm Avenue, Karachi', 117, 876543210),
(1038, 'Ayesha', 'Rehman', '2018-03-27', NULL, 'Janitor', 'ayesha.rehman@example.com', '321 Oak Road, Islamabad', 118, 765432109),
(1039, 'Amir', 'Khan', '2020-05-01', NULL, 'Security', 'amir.khan@example.com', '555 Pine Lane, Faisalabad', 119, 654321098),
(1040, 'Samina', 'Iqbal', '2019-10-17', NULL, 'Security', 'samina.iqbal@example.com', '888 Cedar Drive, Peshawar', 120, 543210987);
--Doctor
INSERT INTO Doctor (Doctor_ID, Qualifications, Emp_ID, Specialization, Dept_ID) VALUES
(401, 'MBBS, FCPS', 1021, 'Cardiologist', 101),
(402, 'MBBS, FCPS', 1025, 'Orthopedic Surgeon', 103),
(403, 'MBBS, MD', 1028, 'Ophthalmologist', 116),
(404, 'MBBS, FCPS', 1032, 'Pediatrician', 114),
(405, 'MBBS, FCPS', 1036, 'Urologist', 109),
(406, 'MBBS, FCPS', 1040, 'Hematologist', 118),
(407, 'MBBS, MD', 1028, 'Plastic Surgeon', 115),
(408, 'MBBS, FCPS', 1021, 'Cardiac Surgeon', 101),
(409, 'MBBS, FCPS', 1025, 'Neurologist', 102),
(410, 'MBBS, FCPS', 1032, 'Psychiatrist', 110),
(411, 'MBBS, MD', 1029, 'Dermatologist', 108),
(412, 'MBBS, FCPS', 1036, 'ENT Specialist', 107),
(413, 'MBBS, FCPS', 1040, 'Pulmonologist', 119),
(414, 'MBBS, FCPS', 1033, 'Gynecologist', 106),
(415, 'MBBS, MD', 1031, 'Radiologist', 111),
(416, 'MBBS, FCPS', 1024, 'Endocrinologist', 112),
(417, 'MBBS, FCPS', 1029, 'Oncologist', 105),
(418, 'MBBS, MD', 1033, 'Obstetrician', 106),
(419, 'MBBS, FCPS', 1038, 'Nephrologist', 117),
(420, 'MBBS, FCPS', 1022, 'Anesthesiologist', 120);
--Nurse
INSERT INTO Nurse (Nurse_ID, Patient_ID, Emp_ID, Dept_ID) VALUES
(501, 301, 1026, 106),
(502, 302, 1036, 101),
(503, 303, 1029, 106),
(504, 304, 1036, 111),
(505, 305, 1038, 117),
(506, 306, 1026, 108),
(507, 307, 1032, 103),
(508, 308, 1039, 104),
(509, 309, 1026, 118),
(510, 310, 1033, 107),
(511, 311, 1039, 114),
(512, 312, 1026, 118),
(513, 313, 1033, 110),
(514, 314, 1031, 115),
(515, 315, 1028, 109),
(516, 316, 1036, 119),
(517, 317, 1038, 105),
(518, 318, 1040, 112),
(519, 319, 1031, 114),
(520, 320, 1039, 113);
--Patient
INSERT INTO Patient (Patient_ID, Patient_FName, Patient_LName, Phone, Blood_Type, Email, Gender, Condition_, Admission_Date, Discharge_Date) VALUES
(301, 'Muhammad', 'Ali', '03001234567', 'O+', 'muhammad.ali@example.com', 'Male', 'Fever', '2023-05-10', '2023-05-15'),
(302, 'Saima', 'Khan', '03121234567', 'A-', 'saima.khan@example.com', 'Female', 'Fractured leg', '2023-07-18', '2023-08-20'),
(303, 'Ahmed', 'Akhtar', '03331234567', 'B+', 'ahmed.akhtar@example.com', 'Male', 'High blood pressure', '2023-09-25', '2023-10-10'),
(304, 'Fatima', 'Raza', '03451234567', 'AB+', 'fatima.raza@example.com', 'Female', 'Diabetes', '2023-10-30', '2023-11-05'),
(305, 'Khalid', 'Malik', '03211234567', 'O-', 'khalid.malik@example.com', 'Male', 'Asthma', '2024-01-15', '2024-01-20'),
(306, 'Ayesha', 'Ali', '03021234567', 'A+', 'ayesha.ali@example.com', 'Female', 'Migraine', '2024-03-10', '2024-03-15'),
(307, 'Sara', 'Hussain', '03111234567', 'AB-', 'sara.hussain@example.com', 'Female', 'Pneumonia', '2024-04-25', NULL),
(308, 'Imran', 'Iqbal', '03321234567', 'B-', 'imran.iqbal@example.com', 'Male', 'Allergy', '2024-06-10', NULL),
(309, 'Aisha', 'Ahmed', '03441234567', 'O+', 'aisha.ahmed@example.com', 'Female', 'Heart disease', '2024-07-20', NULL),
(310, 'Bilal', 'Khan', '03031234567', 'A-', 'bilal.khan@example.com', 'Male', 'Stomach ulcer', '2024-09-05', NULL),
(311, 'Zainab', 'Yousaf', '03131234567', 'B+', 'zainab.yousaf@example.com', 'Female', 'Anemia', '2024-10-15', NULL),
(312, 'Ali', 'Rashid', '03431234567', 'AB+', 'ali.rashid@example.com', 'Male', 'Kidney stones', '2024-12-01', NULL),
(313, 'Sana', 'Akram', '03221234567', 'O-', 'sana.akram@example.com', 'Female', 'Rheumatoid arthritis', '2025-01-20', NULL),
(314, 'Ahmed', 'Khalid', '03341234567', 'A+', 'ahmed.khalid@example.com', 'Male', 'Liver cirrhosis', '2025-03-05', NULL),
(315, 'Sadia', 'Khan', '03041234567', 'B-', 'sadia.khan@example.com', 'Female', 'Lung cancer', '2025-05-10', NULL),
(316, 'Maria', 'Ahmed', '03141234567', 'AB-', 'maria.ahmed@example.com', 'Female', 'Parkinson''s disease', '2025-07-18', NULL),
(317, 'Hassan', 'Amin', '03421234567', 'O+', 'hassan.amin@example.com', 'Male', 'Alzheimer''s disease', '2025-09-25', NULL),
(318, 'Ayesha', 'Malik', '03231234567', 'A-', 'ayesha.malik@example.com', 'Female', 'Stroke', '2025-11-30', NULL),
(319, 'Waqas', 'Noor', '03151234567', 'B+', 'waqas.noor@example.com', 'Male', 'Schizophrenia', '2026-01-15', NULL),
(320, 'Sara', 'Ahmed', '03351234567', 'O-', 'sara.ahmed@example.com', 'Female', 'Epilepsy', '2026-03-10', NULL);
--Appointment
INSERT INTO Appointment (Appt_ID, Scheduled_On, Date_, Time_, Doctor_ID, Patient_ID) VALUES
(601, '2024-06-10 10:00:00', '2024-06-15', '10:00:00', 401, 301),
(602, '2024-06-10 11:00:00', '2024-06-15', '11:00:00', 402, 302),
(603, '2024-06-10 12:00:00', '2024-06-16', '12:00:00', 403, 303),
(604, '2024-06-10 13:00:00', '2024-06-16', '13:00:00', 404, 304),
(605, '2024-06-10 14:00:00', '2024-06-17', '14:00:00', 405, 305),
(606, '2024-06-10 15:00:00', '2024-06-17', '15:00:00', 406, 306),
(607, '2024-06-10 16:00:00', '2024-06-18', '16:00:00', 407, 307),
(608, '2024-06-10 17:00:00', '2024-06-18', '17:00:00', 408, 308),
(609, '2024-06-11 10:00:00', '2024-06-19', '10:00:00', 409, 309),
(610, '2024-06-11 11:00:00', '2024-06-19', '11:00:00', 410, 310),
(611, '2024-06-11 12:00:00', '2024-06-20', '12:00:00', 411, 311),
(612, '2024-06-11 13:00:00', '2024-06-20', '13:00:00', 412, 312),
(613, '2024-06-11 14:00:00', '2024-06-21', '14:00:00', 413, 313),
(614, '2024-06-11 15:00:00', '2024-06-21', '15:00:00', 414, 314),
(615, '2024-06-11 16:00:00', '2024-06-22', '16:00:00', 415, 315),
(616, '2024-06-11 17:00:00', '2024-06-22', '17:00:00', 416, 316),
(617, '2024-06-12 10:00:00', '2024-06-23', '10:00:00', 417, 317),
(618, '2024-06-12 11:00:00', '2024-06-23', '11:00:00', 418, 318),
(619, '2024-06-12 12:00:00', '2024-06-24', '12:00:00', 419, 319),
(620, '2024-06-12 13:00:00', '2024-06-24', '13:00:00', 420, 320);
--EmergencyContact
INSERT INTO EmergencyContact (Contact_ID, Contact_Name, Phone, Relation, Patient_ID) VALUES
(701, 'Ali Khan', '03001234567', 'Father', 301),
(702, 'Sana Ahmed', '03121234567', 'Spouse', 302),
(703, 'Ahmed Malik', '03331234567', 'Sibling', 303),
(704, 'Fatima Raza', '03451234567', 'Mother', 304),
(705, 'Khalid Khan', '03211234567', 'Sibling', 305),
(706, 'Ayesha Ali', '03021234567', 'Parent', 306),
(707, 'Sara Hussain', '03111234567', 'Spouse', 307),
(708, 'Imran Iqbal', '03321234567', 'Parent', 308),
(709, 'Aisha Ahmed', '03441234567', 'Parent', 309),
(710, 'Bilal Khan', '03031234567', 'Sibling', 310),
(711, 'Zainab Yousaf', '03131234567', 'Sibling', 311),
(712, 'Ali Rashid', '03431234567', 'Parent', 312),
(713, 'Sana Akram', '03221234567', 'Spouse', 313),
(714, 'Ahmed Khalid', '03341234567', 'Parent', 314),
(715, 'Sadia Khan', '03041234567', 'Sibling', 315),
(716, 'Maria Ahmed', '03141234567', 'Parent', 316),
(717, 'Hassan Amin', '03421234567', 'Parent', 317),
(718, 'Ayesha Malik', '03231234567', 'Sibling', 318),
(719, 'Waqas Noor', '03151234567', 'Parent', 319),
(720, 'Sara Ahmed', '03351234567', 'Sibling', 320);
--Medical History
INSERT INTO MedicalHistory (Record_ID, Patient_ID, Allergies, Pre_Conditions) VALUES
(801, 301, 'Penicillin', 'None'),
(802, 302, 'None', 'Diabetes'),
(803, 303, 'Sulfa Drugs', 'High Blood Pressure'),
(804, 304, 'Peanuts', 'Asthma'),
(805, 305, 'Shellfish', 'None'),
(806, 306, 'None', 'Migraine'),
(807, 307, 'None', 'None'),
(808, 308, 'None', 'Allergies'),
(809, 309, 'None', 'Heart Disease'),
(810, 310, 'None', 'None'),
(811, 311, 'None', 'Anemia'),
(812, 312, 'None', 'Kidney Stones'),
(813, 313, 'Aspirin', 'None'),
(814, 314, 'None', 'Liver Cirrhosis'),
(815, 315, 'Tobacco', 'Lung Cancer'),
(816, 316, 'None', 'Parkinson''s Disease'),
(817, 317, 'None', 'Alzheimer''s Disease'),
(818, 318, 'None', 'Stroke'),
(819, 319, 'None', 'Schizophrenia'),
(820, 320, 'None', 'Epilepsy');
--Medicine
INSERT INTO Medicine (Medicine_ID, M_Name, M_Quantity, M_Cost) VALUES
(901, 'Paracetamol', 100, 50.00),
(902, 'Amoxicillin', 50, 80.00),
(903, 'Lisinopril', 30, 120.00),
(904, 'Atorvastatin', 60, 150.00),
(905, 'Levothyroxine', 90, 70.00),
(906, 'Metformin', 40, 90.00),
(907, 'Aspirin', 200, 30.00),
(908, 'Ibuprofen', 150, 40.00),
(909, 'Prednisone', 70, 60.00),
(910, 'Omeprazole', 80, 100.00);
--Prescription
INSERT INTO Prescription (Prescription_ID, Patient_ID, Medicine_ID, Date_, Dosage, Doctor_ID) VALUES
(1001, 301, 901, '2024-06-15', 1, 401),
(1002, 302, 902, '2024-06-16', 2, 402),
(1003, 303, 903, '2024-06-17', 1, 403),
(1004, 304, 904, '2024-06-18', 1, 404),
(1005, 305, 905, '2024-06-19', 1, 405),
(1006, 306, 906, '2024-06-20', 1, 406),
(1007, 307, 907, '2024-06-21', 1, 407),
(1008, 308, 908, '2024-06-22', 1, 408),
(1009, 309, 909, '2024-06-23', 1, 409),
(1010, 310, 910, '2024-06-24', 1, 410),
(1011, 311, 901, '2024-06-25', 2, 411),
(1012, 312, 902, '2024-06-26', 1, 412),
(1013, 313, 903, '2024-06-27', 1, 413),
(1014, 314, 904, '2024-06-28', 1, 414),
(1015, 315, 905, '2024-06-29', 1, 415),
(1016, 316, 906, '2024-06-30', 1, 416),
(1017, 317, 907, '2024-07-01', 1, 417),
(1018, 318, 908, '2024-07-02', 1, 418),
(1019, 319, 909, '2024-07-03', 1, 419),
(1020, 320, 910, '2024-07-04', 1, 420);
--Insurance
INSERT INTO Insurance (Policy_Number, Patient_ID, Ins_Code, End_Date, Provider, InsurancePlan, Co_Pay, Coverage, Maternity, Dental, Optical) VALUES
('POL001', 301, 'INS001', '2024-12-31', 'ABC Insurance', 'Basic Plan', 20.00, 'Medical', 1, 0, 1),
('POL002', 302, 'INS002', '2024-12-31', 'XYZ Insurance', 'Premium Plan', 30.00, 'Medical', 1, 1, 1),
('POL003', 303, 'INS003', '2024-12-31', 'PQR Insurance', 'Standard Plan', 25.00, 'Medical', 0, 0, 1),
('POL004', 304, 'INS004', '2024-12-31', 'LMN Insurance', 'Basic Plan', 20.00, 'Medical', 1, 1, 0),
('POL005', 305, 'INS005', '2024-12-31', 'ABC Insurance', 'Premium Plan', 30.00, 'Medical', 1, 0, 0),
('POL006', 306, 'INS006', '2024-12-31', 'XYZ Insurance', 'Standard Plan', 25.00, 'Medical', 1, 1, 1),
('POL007', 307, 'INS007', '2024-12-31', 'PQR Insurance', 'Basic Plan', 20.00, 'Medical', 0, 0, 1),
('POL008', 308, 'INS008', '2024-12-31', 'LMN Insurance', 'Premium Plan', 30.00, 'Medical', 1, 1, 0),
('POL009', 309, 'INS009', '2024-12-31', 'ABC Insurance', 'Standard Plan', 25.00, 'Medical', 1, 0, 0),
('POL010', 310, 'INS010', '2024-12-31', 'XYZ Insurance', 'Basic Plan', 20.00, 'Medical', 0, 1, 1),
('POL011', 311, 'INS011', '2024-12-31', 'PQR Insurance', 'Premium Plan', 30.00, 'Medical', 1, 1, 0),
('POL012', 312, 'INS012', '2024-12-31', 'LMN Insurance', 'Standard Plan', 25.00, 'Medical', 0, 0, 1),
('POL013', 313, 'INS013', '2024-12-31', 'ABC Insurance', 'Basic Plan', 20.00, 'Medical', 1, 0, 1),
('POL014', 314, 'INS014', '2024-12-31', 'XYZ Insurance', 'Premium Plan', 30.00, 'Medical', 1, 1, 1),
('POL015', 315, 'INS015', '2024-12-31', 'PQR Insurance', 'Standard Plan', 25.00, 'Medical', 0, 1, 0),
('POL016', 316, 'INS016', '2024-12-31', 'LMN Insurance', 'Basic Plan', 20.00, 'Medical', 1, 0, 1),
('POL017', 317, 'INS017', '2024-12-31', 'ABC Insurance', 'Premium Plan', 30.00, 'Medical', 1, 1, 0),
('POL018', 318, 'INS018', '2024-12-31', 'XYZ Insurance', 'Standard Plan', 25.00, 'Medical', 0, 0, 1),
('POL019', 319, 'INS019', '2024-12-31', 'PQR Insurance', 'Basic Plan', 20.00, 'Medical', 1, 1, 1),
('POL020', 320, 'INS020', '2024-12-31', 'LMN Insurance', 'Premium Plan', 30.00, 'Medical', 1, 0, 0);
--Lab Screening
INSERT INTO Lab_Screening (Lab_ID, Patient_ID, Doctor_ID, Test_Cost, Date_) VALUES
(1101, 301,  401, 50.00, '2024-06-15'),
(1102, 302,  402, 80.00, '2024-06-16'),
(1103, 303,  403, 70.00, '2024-06-17'),
(1104, 304,  404, 100.00, '2024-06-18'),
(1105, 305,  405, 90.00, '2024-06-19'),
(1106, 306,  406, 120.00, '2024-06-20'),
(1107, 307,  407, 60.00, '2024-06-21'),
(1108, 308,  408, 70.00, '2024-06-22'),
(1109, 309,  409, 80.00, '2024-06-23'),
(1110, 310,  410, 65.00, '2024-06-24'),
(1111, 311,  411, 75.00, '2024-06-25'),
(1112, 312,  412, 55.00, '2024-06-26'),
(1113, 313,  413, 45.00, '2024-06-27'),
(1114, 314,  414, 95.00, '2024-06-28'),
(1115, 315,  415, 85.00, '2024-06-29'),
(1116, 316,  416, 100.00, '2024-06-30'),
(1117, 317,  417, 110.00, '2024-07-01'),
(1118, 318,  418, 120.00, '2024-07-02'),
(1119, 319,  419, 130.00, '2024-07-03'),
(1120, 320,  420, 140.00, '2024-07-04');
--Room
INSERT INTO Room (Room_ID, Room_Type, Patient_ID, Room_Cost) VALUES
(1201, 'Single', 301, 150.00),
(1202, 'Double', 302, 100.00),
(1203, 'Single', 303, 150.00),
(1204, 'Double', 304, 100.00),
(1205, 'Single', 305, 150.00),
(1206, 'Double', 306, 100.00),
(1207, 'Single', 307, 150.00),
(1208, 'Double', 308, 100.00),
(1209, 'Single', 309, 150.00),
(1210, 'Double', 310, 100.00),
(1211, 'Single', 311, 150.00),
(1212, 'Double', 312, 100.00),
(1213, 'Single', 313, 150.00),
(1214, 'Double', 314, 100.00),
(1215, 'Single', 315, 150.00),
(1216, 'Double', 316, 100.00),
(1217, 'Single', 317, 150.00),
(1218, 'Double', 318, 100.00),
(1219, 'Single', 319, 150.00),
(1220, 'Double', 320, 100.00);
--Bill
INSERT INTO Bill (Bill_ID, Date_, Other_Charges, M_Cost, Total, Patient_ID, Remaining_Balance, Policy_Number) VALUES
(1301, '2024-06-15', 20.00, 150.00, 170.00, 301, 170.00, 'POL001'),
(1302, '2024-06-16', 25.00, 100.00, 125.00, 302, 125.00, 'POL002'),
(1303, '2024-06-17', 30.00, 150.00, 180.00, 303, 180.00, 'POL003'),
(1304, '2024-06-18', 35.00, 100.00, 135.00, 304, 135.00, 'POL004'),
(1305, '2024-06-19', 40.00, 150.00, 190.00, 305, 190.00, 'POL005'),
(1306, '2024-06-20', 45.00, 100.00, 145.00, 306, 145.00, 'POL006'),
(1307, '2024-06-21', 50.00, 150.00, 200.00, 307, 200.00, 'POL007'),
(1308, '2024-06-22', 55.00, 100.00, 155.00, 308, 155.00, 'POL008'),
(1309, '2024-06-23', 60.00, 150.00, 210.00, 309, 210.00, 'POL009'),
(1310, '2024-06-24', 65.00, 100.00, 165.00, 310, 165.00, 'POL010'),
(1311, '2024-06-25', 70.00, 150.00, 220.00, 311, 220.00, 'POL011'),
(1312, '2024-06-26', 75.00, 100.00, 175.00, 312, 175.00, 'POL012'),
(1313, '2024-06-27', 80.00, 150.00, 230.00, 313, 230.00, 'POL013'),
(1314, '2024-06-28', 85.00, 100.00, 185.00, 314, 185.00, 'POL014'),
(1315, '2024-06-29', 90.00, 150.00, 240.00, 315, 240.00, 'POL015'),
(1316, '2024-06-30', 95.00, 100.00, 195.00, 316, 195.00, 'POL016'),
(1317, '2024-07-01', 100.00, 150.00, 250.00, 317, 250.00, 'POL017'),
(1318, '2024-07-02', 105.00, 100.00, 205.00, 318, 205.00, 'POL018'),
(1319, '2024-07-03', 110.00, 150.00, 260.00, 319, 260.00, 'POL019'),
(1320, '2024-07-04', 115.00, 100.00, 215.00, 320, 215.00, 'POL020');
--Payroll
INSERT INTO Payroll (Account_No, Salary, Bonus, Emp_ID, IBAN) VALUES
('ACC001', 5000.00, 500.00, 1021, 'PK123456789012345'),
('ACC002', 4500.00, 400.00, 1022, 'PK234567890123456'),
('ACC003', 5500.00, 600.00, 1023, 'PK345678901234567'),
('ACC004', 6000.00, 700.00, 1024, 'PK456789012345678'),
('ACC005', 4800.00, 450.00, 1025, 'PK567890123456789'),
('ACC006', 5200.00, 550.00, 1026, 'PK678901234567890'),
('ACC007', 4700.00, 400.00, 1027, 'PK789012345678901'),
('ACC008', 5300.00, 600.00, 1028, 'PK890123456789012'),
('ACC009', 5800.00, 700.00, 1029, 'PK901234567890123'),
('ACC010', 5100.00, 500.00, 1030, 'PK012345678901234'),
('ACC011', 4900.00, 450.00, 1031, 'PK123456789012345'),
('ACC012', 5400.00, 550.00, 1032, 'PK234567890123456'),
('ACC013', 5600.00, 600.00, 1033, 'PK345678901234567'),
('ACC014', 4700.00, 400.00, 1034, 'PK456789012345678'),
('ACC015', 5200.00, 500.00, 1035, 'PK567890123456789'),
('ACC016', 4800.00, 450.00, 1036, 'PK678901234567890'),
('ACC017', 5700.00, 600.00, 1037, 'PK789012345678901'),
('ACC018', 5500.00, 550.00, 1038, 'PK890123456789012'),
('ACC019', 4900.00, 400.00, 1039, 'PK901234567890123'),
('ACC020', 5300.00, 600.00, 1040, 'PK012345678901234');



select * from Patient;
select * from Department;
select * from Staff;
select * from Nurse;
select * from Doctor;
select * from Appointment;
select * from EmergencyContact;
select * from Prescription;
select * from MedicalHistory;
select * from Insurance;
select * from Bill;
select * from Room;
select * from Lab_Screening;
select * from Medicine;
select * from Payroll;
-------------------------------------------------------------------------------------------------------------------
-- 1. Retrieve all departments
-- This query fetches all the departments from the Department table.
SELECT * FROM Department;

-- 2. Retrieve all staff members who joined after 2020
-- This query fetches all staff members whose Date_Joining is after January 1, 2020.
SELECT * FROM Staff
WHERE Date_Joining > '2020-01-01';

-- 3. Retrieve all patients with blood type 'A+'
-- This query fetches all patients with the blood type 'A+'.
SELECT * FROM Patient
WHERE Blood_Type = 'A+';

-- 4. Retrieve all doctors specialized in 'Cardiology'
-- This query fetches all doctors who specialize in Cardiology.
SELECT * FROM Doctor
WHERE Specialization = 'Cardiologist';

-- 5. List all patients with their emergency contact names
-- This query fetches all patients along with their emergency contact names.
SELECT Patient.Patient_ID, Patient.Patient_FName, Patient.Patient_LName, EmergencyContact.Contact_Name
FROM Patient
JOIN EmergencyContact ON Patient.Patient_ID = EmergencyContact.Patient_ID;

-- 6. Retrieve appointments scheduled on '2024-06-10'
-- This query fetches all appointments scheduled on June 10, 2024.
SELECT * FROM Appointment
WHERE Date_ = '2024-06-17';

-- 7. Find all nurses working in department 101
-- This query fetches all nurses working in department with ID 101.
SELECT * FROM Nurse
WHERE Dept_ID = 101;

-- 8. List all patients admitted after '2024-01-01' and discharged before '2024-06-10'
-- This query fetches all patients admitted after January 1, 2024, and discharged before June 10, 2024.
SELECT * FROM Patient
WHERE Admission_Date > '2024-01-01' AND Discharge_Date < '2024-06-10';

-- 9. Retrieve all staff emails and their corresponding department names
-- This query fetches all staff emails along with their corresponding department names.
SELECT Staff.Email, Department.Dept_Name
FROM Staff
JOIN Department ON Staff.Dept_ID = Department.Dept_ID;

-- 10. List all distinct specializations of doctors
-- This query fetches all distinct specializations from the Doctor table.
SELECT DISTINCT Specialization
FROM Doctor;

-- 11. Retrieve total number of employees in each department
-- This query fetches the total number of employees in each department.
SELECT Dept_ID, COUNT(Emp_ID) AS Employee_Count
FROM Staff
GROUP BY Dept_ID;

-- 12. Retrieve the average cost of all lab screenings
-- This query fetches the average cost of all lab screenings.
SELECT AVG(Test_Cost) AS Average_Test_Cost
FROM Lab_Screening;

-- 13. Retrieve the list of doctors and their corresponding patients
-- This query fetches a list of doctors along with their corresponding patients.
SELECT Doctor.Doctor_ID, Patient.Patient_ID, Patient.Patient_FName, Patient.Patient_LName
FROM Doctor
JOIN Appointment ON Doctor.Doctor_ID = Appointment.Doctor_ID
JOIN Patient ON Appointment.Patient_ID = Patient.Patient_ID;

-- 14. Calculate total hospital bill for a specific patient (Patient_ID = 1)
-- This query calculates the total hospital bill for a specific patient with Patient_ID 1.
SELECT SUM(Other_Charges + M_Cost + Total) AS Total_Hospital_Bill
FROM Bill
WHERE Patient_ID = 1;

-- 15. Retrieve all patients with specific conditions using pattern matching
-- This query fetches all patients whose condition contains 'diabetes'.
SELECT * FROM Patient
WHERE Condition_ LIKE '%diabetes%';

-- 16. Retrieve the most recent admission date for each patient
-- This query fetches the most recent admission date for each patient.
SELECT Patient_ID, MAX(Admission_Date) AS Recent_Admission_Date
FROM Patient
GROUP BY Patient_ID;


-- 17. Create a stored procedure to retrieve patient details by patient ID
-- This stored procedure retrieves patient details by patient ID.
GO
CREATE PROCEDURE GetPatientDetails(@PatientID INT)
AS
BEGIN
    SELECT * FROM Patient
    WHERE Patient_ID = @PatientID;
END;
EXEC GetPatientDetails 308;


-- 18. Use a CASE statement to classify patients based on their gender
-- This query classifies patients as 'Male', 'Female', or 'Other' based on their gender.
SELECT Patient_ID, Patient_FName, Patient_LName,
    CASE 
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE 'Other'
    END AS Gender_Classification
FROM Patient;

