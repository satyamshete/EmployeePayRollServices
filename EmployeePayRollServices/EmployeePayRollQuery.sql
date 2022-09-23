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