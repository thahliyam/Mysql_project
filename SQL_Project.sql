-- Create a database named library 
-- and following TABLES in the database:
-- 1. Branch 2. Employee 3. Books 
-- 4. Customer 5. IssueStatus 6. ReturnStatus 
 
 create database library;
 use library;

 
 create table Branch(Branch_no int primary key not null,
  Manager_id int not null,Branch_address varchar(50),
  contact_no varchar(20));
  
  INSERT INTO Branch (Branch_no, Manager_id, Branch_address, Contact_no)
VALUES (1, 101, 'TrivandrumJn', '989501234'),
(2, 102, 'Kochi', '9895023456'),
(3, 103, 'Calicut Beach rd', '9895034567'),
(4, 104, 'Thrissur Railway rd', '9895045678'),
(5, 105, 'Kannur ln', '9895056789'),
(6, 106, 'Kollam rlwy', '9895067890'),
(7, 107, 'Alappuzha ln', '9895078901'),
(8, 108, 'Palakkad jn', '9895089012'),
(9, 109, 'Kottayam', '9895090123'),
(10, 110, 'Malappuram airport rd', '9895101234');

select * from branch;

  create table Employee(Emp_id int primary key not null,Emp_name varchar(20) not null,
  Position varchar(30) not null,Salary int not null,Branch_no int,
Foreign key(Branch_no) References Branch(Branch_no));

INSERT INTO Employee (Emp_id, Emp_name, Position, Salary, Branch_no)
VALUES 
(101, 'Rajesh', 'Manager', 75000, 1),
(102, 'Anjali', 'Clerk', 40000, 1),
(103, 'Suraj', 'Assistant', 35000, 2),
(104, 'Maya', 'Clerk', 45000, 2),
(105, 'Sreekanth', 'Manager', 80000, 1),
(106, 'Nandana', 'Assistant', 38000, 3),
(107, 'Akhil', 'Manager', 78000, 4),
(108, 'Divya', 'Clerk', 42000, 4),
(109, 'Vishnu', 'Assistant', 36000, 1),
(110, 'Lakshmi', 'Clerk', 47000, 5),
(111, 'Amal', 'Assistant', 38000, 6),
(112, 'Neena', 'Clerk', 45000, 1),
(113, 'Kiran', 'Manager', 80000, 1);

select * from employee;

create table Books(ISBN int primary key not null,Book_title varchar(50) not null,
Category varchar(30) not null,Rental_price int not null,Status varchar(10) not null,
Author varchar(50) not null,Publisher varchar(30) not null);

INSERT INTO Books (ISBN, Book_title, Category, Rental_price, Status, Author, Publisher)
VALUES 
(1001, 'English Poetry Classics', 'Poetry', 50, 'yes', 'John Keats', 'Oxford Press'),
(1002, 'The History of Kerala', 'History', 15, 'no', 'Madhavan Nair', 'Kerala Books'),
(1003, 'Advanced Mathematics', 'Mathematics', 60, 'yes', 'R. Gupta', 'DC Books'),
(1004, 'Modern Physics', 'Science', 45, 'yes', 'Stephen Hawking', 'Cambridge'),
(1005, 'Malayalam Literature', 'Literature', 30, 'no', 'Vaikom Muhammed Basheer', 'DC Books'),
(1006, 'Topology', 'Mathematics', 20, 'yes', 'KD Joshi', 'Printx'),
(1007, 'South Indian Recipes', 'Cooking', 50, 'yes', 'Meera Nair', 'Tirur Books'),
(1008, 'Basics of Economics', 'Economics', 25, 'no', 'Amartya Sen', 'Harvard Press'),
(1009, 'Indian Geography', 'Geography', 15, 'yes', 'Bharat Das', 'NCERT'),
(1010, 'World War II', 'History', 35, 'yes', 'Winston Churchill', 'Vintage');

select * from books;

create table Customer(Customer_id int primary key not null,Customer_name varchar(30) not null,
Customer_address varchar(50) not null,Reg_date date not null);

INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date)
VALUES 
(301, 'Arun', 'Arun villa', '2021-12-25'),
(302, 'Deepa', 'Gandhi st', '2022-01-10'),
(303, 'Manoj', 'Manu bhavan', '2023-03-15'),
(304, 'Megha', 'Gopura house', '2021-11-30'),
(305, 'Nikhil', 'sarojini lane', '2022-04-20'),
(306, 'Riya', 'Kollam st', '2023-06-01'),
(307, 'Anand', 'Anandham', '2020-08-15'),
(308, 'Neethu', 'Neethuus', '2022-09-10'),
(309, 'Sandeep', 'sandeep villa', '2021-10-05'),
(310, 'Swathi', 'Swathi villa', '2023-02-18'),
(311,'Karun','Nandhanam','2021-05-10');

select * from customer;

create table Issuestatus(Issue_id int primary key not null,Issued_cust_id int,
Foreign key(Issued_cust_id)references customer(customer_id),Issued_book_name
varchar(50) not null,Issued_date date not null,ISBN_book int,Foreign key(ISBN_book)references Books(ISBN));

INSERT INTO Issuestatus (Issue_id, Issued_cust_id, Issued_book_name, Issued_date, ISBN_book)
VALUES 
(401, 301, 'English Poetry Classics', '2023-06-05', 1001),
(402, 303, 'Modern Physics', '2023-06-15', 1004),
(403, 306, 'World War II', '2023-06-20', 1010),
(404, 309, 'Advanced Mathematics', '2021-07-10', 1003),
(405, 304, 'The History of Kerala', '2023-05-05', 1002),
(406, 305, 'Malayalam Literature', '2023-04-12', 1005),
(407, 307, 'Basics of Economics', '2020-03-01', 1008),
(408, 308, 'Indian Geography', '2023-02-20', 1009),
(409, 302, 'Topology', '2023-01-15', 1006),
(410, 310, 'South Indian Recipes', '2023-06-10', 1007);

select * from Issuestatus;

create table ReturnStatus(Return_id int primary key not null,Return_cust int not null,
Return_book_name varchar(30) not null,Return_date date not null,ISBN_Book2 int,
Foreign key(ISBN_Book2)References Books(ISBN));

INSERT INTO ReturnStatus (Return_id, Return_cust, Return_book_name, Return_date, ISBN_Book2)
VALUES 
(501, 601, 'English Poetry Classics', '2023-06-10', 1001),
(502, 603, 'Modern Physics', '2023-06-18', 1004),
(503, 606, 'World War II', '2023-06-25', 1010),
(504, 609, 'Advanced Mathematics', '2021-07-15', 1003),
(505, 604, 'The History of Kerala', '2021-05-10', 1002),
(506, 605, 'Malayalam Literature', '2023-04-15', 1005),
(507, 607, 'Basics of Economics', '2023-03-05', 1008),
(508, 608, 'Indian Geography', '2023-02-25', 1009),
(509, 602, 'Introduction to Philosophy', '2023-01-20', 1006),
(510, 610, 'South Indian Recipes', '2023-06-15', 1007);

select * from Returnstatus;

--   Display all the tables and Write the queries for the following :
-- 1. Retrieve the book title, category, and rental price of all available books. 
select Book_title, Category, Rental_price from Books where Status='Yes';

--  2. List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;
 
-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT B.Book_title, C.Customer_name FROM Books B JOIN IssueStatus I ON
B.ISBN = I.Isbn_book JOIN Customer C ON I.Issued_cust_id = C.Customer_Id;

-- 4. Display the total count of books in each category. 
select category,count(*) from books group by category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select emp_name,Position from employee where salary>50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT C.Customer_name FROM Customer C LEFT JOIN IssueStatus I
ON C.Customer_id = I.Issued_cust_id WHERE C.Reg_date < '2022-01-01'
AND I.Issued_cust_id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch. 
select branch_no ,count(emp_id) as Total_employee from employee  group by branch_no;

--  8. Display the names of customers who have issued books in the month of June 2023.
select c.customer_name from customer c join IssueStatus I ON C.Customer_Id = I.Issued_cust_id
WHERE MONTH(Issued_date) = 6 AND YEAR(Issued_date) = 2023;

--  9. Retrieve book_title from book table containing history. 
select Book_title from books where Book_title like '%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select branch_no ,count(*) as Num_of_employees from employee group by branch_no having count(*)>5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address FROM Employee E
JOIN Branch B ON E.emp_id = B.manager_id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
select  C.Customer_name FROM Customer C JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust_id
JOIN Books B ON I.Isbn_book = B.ISBN WHERE B.Rental_Price > 25;

  
  