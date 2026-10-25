use pfs39;
create table Users(
	user_id int primary key,
	full_name varchar(20), 
    phone int UNIQUE, 
    email varchar(20) UNIQUE, 
    address varchar(30));
    
    
create table Departments(
department_id int primary key, 
department_name varchar(30));


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    employee_name VARCHAR(20),
    phone INT,
    email VARCHAR(50),
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


create table Complaint_Categories (
	category_id int primary key, 
    category_name varchar(20)
    );
    
    

CREATE TABLE Complaints (
    complaint_id INT PRIMARY KEY,
    user_id INT,
    employee_id INT,
    category_id INT,
    complaint_date DATE,
    priority VARCHAR(20),
    status VARCHAR(20),
    description VARCHAR(255),

    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (category_id) REFERENCES Complaint_Categories(category_id)
);

INSERT INTO Departments VALUES (1,'IT'), (2,'HR'), (3,'Finance'), (4,'Network'), (5,'Adminstration'); 

INSERT INTO Complaint_Categories VALUES (1,'Software'), (2,'Hardware'), (3,'Network'), (4,'Login'), (5,'Security'), (6,'Other');

INSERT INTO Users VALUES
(1,'Aarav','900000001','u1@mail.com','Vijayawada'),
(2,'Bhavya','900000002','u2@mail.com','Hyderabad'),
(3,'Charan','900000003','u3@mail.com','Guntur'),
(4,'Divya','900000004','u4@mail.com','Vizag'),
(5,'Esha','900000005','u5@mail.com','Nellore'),
(6,'Farhan','900000006','u6@mail.com','Kurnool'),
(7,'Gopi','900000007','u7@mail.com','Tirupati'),
(8,'Hari','900000008','u8@mail.com','Ongole'),
(9,'Isha','900000009','u9@mail.com','Warangal'),
(10,'John','900000010','u10@mail.com','Chennai');

INSERT INTO Employees VALUES
(101,1,'Ravi','910000001','e1@mail.com'),
(102,1,'Priya','910000002','e2@mail.com'),
(103,2,'Kiran','910000003','e3@mail.com'),
(104,2,'Sneha','910000004','e4@mail.com'),
(105,3,'Arjun','910000005','e5@mail.com'),
(106,4,'Meena','910000006','e6@mail.com'),
(107,5,'Vikas','910000007','e7@mail.com'),
(108,1,'Divya','910000008','e8@mail.com');

INSERT INTO Complaints VALUES
(1001,1,101,4,'2026-07-01','High','Open','Unable to login to employee portal'),
(1002,1,102,1,'2026-07-02','Medium','Resolved','ERP application crashes frequently'),
(1003,2,103,3,'2026-07-02','High','In Progress', 'Office internet is not working'),
(1004,2,104,2,'2026-07-03','Low','Closed','Desktop not powering on'),
(1005,3,101,5,'2026-07-03','High','Resolved','Unauthorized login attempt detected'),
(1006,3,105,6,'2026-07-04','Medium','Open','Need access to shared folder'),
(1007,4,106,2,'2026-07-04','High','In Progress', 'Printer not detecting system'),
(1008,4,107,6,'2026-07-05','Low','Closed','Request for workstation relocation'),
(1009,5,108,1,'2026-07-05','Medium','Resolved','Payroll software not responding'),
(1010,5,103,3,'2026-07-06','High','Open','VPN connection failed'),
(1011,6,104,4,'2026-07-06','Medium','Resolved','Password reset email not received'),
(1012,6,105,5,'2026-07-07','High','Closed','Suspicious email reported'),
(1013,7,106,2,'2026-07-07','Low','Open','Keyboard keys are not working'),
(1014,7,101,1,'2026-07-08','Medium','In Progress', 'MS Excel keeps crashing'),
(1015,8,102,6,'2026-07-08','Low','Resolved','Need new software installation'),
(1016,8,107,3,'2026-07-09','High','Open','LAN cable disconnected'),
(1017,9,108,4,'2026-07-09','Medium','Closed','Unable to login after password change'),
(1018,9,103,5,'2026-07-10','High','Resolved','System blocked due to security policy'),
(1019,10,104,1,'2026-07-10','Low','In Progress', 'Application loading very slowly'),
(1020,10,105,6,'2026-07-11','Medium','Open','General technical assistance required');


#1. List all complaints
select * from complaints;

#2. Show complaint with user name
select c.complaint_id ,u.full_name from users u join complaints c on u.user_id=c.user_id;

#3. Display all employee names in uppercase and lowercase
select upper(full_name) from users;
select lower(full_name) from users; 

#4. Display the first 4 characters & last 5 characters of every complaint description
select left(description,4) as first_char,right(description,5) as last_char from complaints;

#5. Concatenate employee name and department name with and without separator
#with separator
select concat(e.employee_name,' ',d.department_name) as emp_dept from employees e 
join departments d on e.department_id=d.department_id;

#without separator
select concat(e.employee_name, d.department_name) as emp_dept from employees e 
join departments d on e.department_id=d.department_id;

#6. Replace the word "login" with "authentication" in complaint descriptions
select replace(description,'login','authentication') as description from complaints;

#7. Find complaints raised in the last 7 days
select * from Complaints where complaint_date >= curdate() - interval 7 day;

#8. Count complaints raised department-wise this month
select d.department_name, count(*) as total from Complaints c join Employees e on c.employee_id = e.employee_id
join departments d on e.department_id = d.department_id where month(c.complaint_date) = month(CURDATE())
and year(c.complaint_date) = year(curdate()) group by d.department_name;

#9. Display complaint dates in the format 08-Jul-2026
select complaint_id, date_format(complaint_date, '%d-%b-%Y') as complaint_date from Complaints;

#10. Show complaints with employee and department
select c.complaint_id, c.description,e.employee_name, d.department_name from Complaints c
join Employees e on c.employee_id = e.employee_id join departments d on e.department_id = d.department_id;

#11. Count complaints by status
select status, COUNT(*) as total from Complaints group by status;

#12. Count complaints by priority
select priority ,count(*) as total from complaints group by 1;

#13. Department with maximum complaints
select d.department_name, count(*) as total from Complaints c join Employees e on c.employee_id = e.employee_id
join departments d on e.department_id = d.department_id group by d.department_id, d.department_name order by total desc
limit 1;

#14. Employee handling maximum complaints
select e.employee_name, count(*) as total from Complaints c join Employees e on c.employee_id = e.employee_id
group by e.employee_id, e.employee_name order by total desc limit 1;

#15. Display open complaints
select * from Complaints where status = 'Open'; 

#16. Display resolved complaints
select * from Complaints where status = 'Resolved';

#17. Display complaints raised today
select * from Complaints where complaint_date = curdate();

#18. Find users with multiple complaints
select user_id, count(*) as total_complaints from Complaints group by user_id having 2 > 1;

#19. Find categories with more than one complaint
select category_id, count(*) as total_complaints from Complaints group by category_id having 2 > 1;

#20. Calculate average complaints per employee
select avg(total_complaints) as average_complaints from (select employee_id, count(*) as total_complaints 
from Complaints where employee_id is not null group by employee_id
) as emp_complaints;

#21. Top 5 latest complaints
select * from Complaints order by complaint_date desc limit 5;

#22. Complaints assigned to IT department
select c.* from Complaints c join Employees e on c.employee_id = e.employee_id 
join departments d on e.department_id = d.department_id where d.department_name = 'IT';

#23. Users without complaints
select u.* from Users u left join Complaints c on u.user_id = c.user_id where c.user_id is null;

#24. Employees without assigned complaints
select e.* from Employees e left join Complaints c on e.employee_id = c.employee_id where c.employee_id is null;
    
#25. Show the current status of complaints raised in the last 15 days
select complaint_id, complaint_date, status from Complaints where complaint_date >= curdate() - interval 15 day
and complaint_date <= curdate();

#26. Generate a complaint reference by combining category name and complaint ID (e.g., SOFTWARE-1001)
select concat(upper(ca.category_name), '-', c.complaint_id) as complaint_reference from Complaints c
join complaint_Categories ca on c.category_id = ca.category_id;

#27. Display employee name in uppercase along with the number of complaints assigned
select upper(e.employee_name) as employee_name, count(c.complaint_id) as total_complaints from Employees e
left join Complaints c on e.employee_id = c.employee_id group by e.employee_id, e.employee_name;

#28. Display high-priority open complaints
select * from Complaints where priority = 'High' and status = 'Open';

#29. Create a view for open complaints and retrieve data from it
create view Open_Complaints as select * from Complaints where status = 'Open';
select * from open_complaints;

#30. Transaction: assign employee, then update status
start transaction;
update Complaints set employee_id = 101 where complaint_id = 1001;
update Complaints set status = 'In Progress' where complaint_id = 1001;
commit;

#31. Create a stored procedure to display all complaints assigned to a particular employee.
#• Input: employee_id
#• Display complaint_id, priority, status, and description.
call pfs39.GetEmployeeComplaints(102);

#32. Create a stored procedure to display all complaints having a particular priority.
#• Input: priority
#• For example, display all High priority complaints.
call pfs39.GetComplaintsByPriority('high');

#33. Create a stored procedure to count the number of complaints for a particular category.
#• Input: category_id
#• Display the total number of complaints.
call pfs39.CountComplaintsByCategory(1);

#34
create table Complaint_Log (complaint_id int,user_id int,category_id int,complaint_date date);
select * from Complaint_Log;

#35
alter table Complaints add column old_status varchar(20), add column new_status varchar(20), add column update_date datetime;