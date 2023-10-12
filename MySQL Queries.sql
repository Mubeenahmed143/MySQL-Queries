create database bookwork;
use bookwork;

create table department(
DID int primary key ,
DName varchar(44) not null ,
DHead varchar(50) not null ,
DLocation varchar(50) not null ,
DRanking int (1)
 );
 insert into department( DID, DName, DHead, DLocation,  DRanking ) values ( "3001" , "Finance" , "James" , "Washington" , 1 ),
 ( "3002" , "Sales" , "Mary" , "California" , 2 ) , ( "3003" , "Legal" , "John" , "Texas" , 3 ) , 
 ( "3004" , "Accounting" , "Drew" , "Alaska" , 4 ), ( "3005" , "Marketing" , "Kolin" , "Ohio" , 5 ),
 ( "3006" , "HR" , "Hellen" , "California" , 6 );
 SELECT * from department;
 
 create table Employee(
EmployeeID int primary key ,
EName varchar(44) not null ,
Position varchar(50) not null ,
Salary int(15) not null ,
Dept int,
foreign key (Dept) references department(DID)
 );
  insert into Employee( EmployeeID, EName, Position, Salary,  Dept ) values ( "1001" , "Pete" , "Clerk" , "1000" , "3002" ),
 ( "1002" , "David" , "Manager" , "2500" , "3002" ) , ( "1003" , "Michael" , "Salesman" , "800" , "3001" ) , 
 ( "1004" , "Ruby" , "Clerk" , "1500" , "3003" ), ( "1005" , "Clinton" , "Salesman" , "2750" , "3006" ),
 ( "1006" , "Julie" , "Manager" , "3000" , "3004" ),( "1007" , "Smith" , "Clerk" , "3200" , "3003" ),
 ( "1008" , "Fuler" , "Clerk" , "1200" , "3004" );
  SELECT * from Employee;

select * from Employee where Salary = (select min(Salary) from Employee where position = 'Clerk');

create table EmployeeInCalifornia(
EmployeeID int primary key ,
Ename varchar(50) not null ,
Position varchar(50) not null ,
Salary int 
);
drop table EmployeeInCalifornia;
insert into EmployeeInCalifornia select EmployeeID, Ename, Position, Salary from Employee where Dept in (select DID from Department  where DLocation = 'California' );
select * from EmployeeInCalifornia;

update Employee set Salary = Salary * 0.1 where dept = ( select DID from department where DID = 3004 );