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