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