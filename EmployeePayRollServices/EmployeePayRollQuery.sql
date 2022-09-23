﻿--------------UC1------------
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