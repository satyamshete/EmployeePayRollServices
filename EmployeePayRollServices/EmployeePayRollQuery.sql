--------------UC1------------
create database EmployeePayRollServices;
use EmployeePayRollServices;
--------------UC2--------------
Create table employee_payroll (
	Id int IDENTITY(1,1) Primary Key,
	Name varchar (40) NOT NULL,
	Salary float Not null,
	StartDate date
);
-----------UC3-------------
insert into employee_payroll values('ArunKumar',325684.12,'2018-08-15'),('Dinesh',225684.12,'2015-08-05'),('Dinesh',15863.21,GETDATE());
-----------UC4--------
 select * from employee_payroll
 ----------UC5---------
SELECT * FROM employee_payroll where  name = 'ArunKumar';
SELECT * FROM employee_payroll where StartDate between '2018-08-15' and '2022-10-15';
SELECT * FROM employee_payroll where StartDate between '2018-08-15' and GETDATE();
SELECT * FROM employee_payroll where StartDate between cast ('05-15-2015' as date) and '2022-10-15';
-----------UC6-------
alter table employee_payroll add Gender char(1) not null default 'M';
update employee_payroll set Name = 'Shweta' where Id = 3;
update employee_payroll set Gender = 'F' where Name = 'Shweta';
----------UC7---------
select sum(Salary) as TotalSalary from employee_payroll;
select avg(Salary) as AvarageSalary from employee_payroll;
select min(Salary) as MinimumSalary from employee_payroll;
select max(Salary) as MaximumSalary from employee_payroll;
select count(Salary) as TotalRecords from employee_payroll;
select sum(Salary) as TotalSalary, Gender from employee_payroll group by Gender;
select Avg(Salary) as AvarageSalary,  Gender from employee_payroll group by Gender;
select min(Salary) as MinimumSalary, Gender from employee_payroll group by Gender;
select max(Salary) as MaximumSalary, Gender from employee_payroll group by Gender;
select count(Salary) as TotalRecords, Gender from employee_payroll group by Gender;
-----------UC8---------
Alter table employee_payroll add PhoneNumber bigint;
Alter table employee_payroll add Addresss varchar(100) default 'Pune';
Alter table employee_payroll add Department varchar(20) Not null default 'IT';
---------UC9--------
update employee_payroll set  PhoneNumber=78545990 where Name='ArunKumar' ;
update employee_payroll set  Addresss='Nashik' where Name='Dinesh' ;
update employee_payroll set  PhoneNumber=1259954 where Name='Shweta';
alter table employee_payroll add Gender char(1) not null default 'M';
EXEC sp_rename 'employee_payroll.Salary', 'BasicPay', 'COLUMN';
Alter table employee_payroll add Deductions float,Taxable_Pay float,Income_Tax float, Net_Pay float;
----------UC10----------
insert into  employee_payroll (Name,BasicPay,StartDate,Gender,PhoneNumber,Addresss,Department)
 Values('Terissa', 10500.23, '2017-08-17','F',10256982,'Nagpur','Marketing')
 insert into  employee_payroll (Name,BasicPay,StartDate,Gender,PhoneNumber,Addresss,Department)
 Values('Terissa', 10500.23, '2017-08-17','F',10256982,'Nagpur','Sales')
 -----------UC11-------------
 Create Table Company
(CompanyID int identity(1,1) primary key,
CompanyName varchar(100))

--Insert Values in Company
Insert into Company values ('Amazon'),('Netflix')
Select * from Company

drop table employee_payroll


--Creating Employee Table
create table Employee
(EmployeeID int identity(1,1) primary key,
CompanyIdentity int,
EmployeeName varchar(200),
EmployeePhoneNumber bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char,
Foreign key (CompanyIdentity) references Company(CompanyID)
)

--Inserting Values in Employee table
insert into Employee values
(1,'Smita Pawar',9842905050,'street 123 GT Road','2012-03-28','F'),
(2,'Deepak Kumar',9842905550,'big Market near kotara phase, 94533','2017-04-22','M'),
(1,'Rahu Tripathi',7812905050,'bir bhaghera,Tira Sujanpur','2015-08-22','M'),
(2,'Nilesh Kulkarni',78129050000,'chandnicHowk delhi','2012-08-29','M')
Select * from Employee
--Creating Payroll Table
create table PayrollCalculate
(BasicPay float,
Deductions float,
TaxablePay float,
IncomeTax float,
NetPay float,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID)
)

--Inserting Values in Payroll Table
insert into PayrollCalculate(BasicPay,Deductions,IncomeTax,EmployeeIdentity) values 
(2700000,1000000,20000,1),
(3300000,200000,4000,2),
(7500000,10000,5000,3),
(9000000,30000,6784,4)

--Updating Derived attribute values 
update PayrollCalculate set TaxablePay=BasicPay-Deductions
update PayrollCalculate set NetPay=TaxablePay-IncomeTax
select * from PayrollCalculate

--Creating Department Table
create table Department
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
)
--Insert Values in Department Table
insert into Department values
('Marketing'),
('Sales'),
('Publishing')
select * from Department

--Creating table EmployeeDepartment
create table EmployeeDepartment
(
DepartmentIdentity int ,
EmployeeIdentity int,
Foreign key (EmployeeIdentity) references Employee(EmployeeID),
Foreign key (DepartmentIdentity) references Department(DepartmentID)
)
--Inserting Values in EmployeeDepartment
insert into EmployeeDepartment values
(3,1),
(2,2),
(1,3),
(3,4)		
select * from EmployeeDepartment

----UC 12: Ensure all retrieve queries done especially in UC 4, UC 5 and UC 7 are working with new table structure -------

--UC 4: Retrieve all Data
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,EmployeeAddress,EmployeePhoneNumber,StartDate,Gender,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay,DepartName from Company
INNER JOIN Employee ON Company.CompanyID = Employee.CompanyIdentity
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID
INNER JOIN EmployeeDepartment on Employee.EmployeeID=EmployeeDepartment.EmployeeIdentity
INNER JOIN Department on Department.DepartmentId=EmployeeDepartment.DepartmentIdentity

--UC 5: Select Query using Cast() an GetDate()
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay from Company
INNER JOIN Employee ON Company.CompanyID = Employee.CompanyIdentity and StartDate BETWEEN Cast('2012-11-12' as Date) and GetDate()
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID
--Retrieve query based on Name
SELECT CompanyID,CompanyName,EmployeeID,EmployeeName,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay from Company
INNER JOIN Employee ON Company.CompanyID = Employee.CompanyIdentity and Employee.EmployeeName='Smita Pawar'
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID

--UC 7: Use Aggregate Functions and Group by Gender
select Sum(BasicPay) as "TotalSalary",Gender from Employee
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID group by Gender;
select Avg(BasicPay) as "AverageSalary",Gender from Employee
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID group by Gender;
select Min(BasicPay) as "MinimumSalary",Gender from Employee
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID group by Gender;
select Max(BasicPay)  as "MaximumSalary",Gender from Employee
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID group by Gender;
select Count(BasicPay) as "CountSalary",Gender from Employee
INNER JOIN PayrollCalculate on PayrollCalculate.EmployeeIdentity=Employee.EmployeeID group by Gender;