CREATE DATABASE library_db;

USE library_db;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(200),
    Contact_no VARCHAR(20)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(200),
    Reg_date DATE
);

CREATE TABLE Books (
    ISBN VARCHAR(50) PRIMARY KEY,
    Book_title VARCHAR(200),
    Category VARCHAR(200),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(200),
    Issue_date DATE,
    Isbn_book VARCHAR(50),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(200),
    Return_date DATE,
    Isbn_book2 VARCHAR(50),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


-- Inserting values into tables

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(101, 1001, '123 Main Street, Cityville', '555-123-4567'),
    (102, 1002, '456 Elm Street, Townsville', '555-234-5678'),
    (103, 1003, '789 Oak Street, Villagetown', '555-345-6789'),
    (104, 1004, '321 Maple Street, Hamletville', '555-456-7890'),
    (105, 1005, '654 Pine Street, Countryside', '555-567-8901');


INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(2001, 'John Smith', 'Librarian', 60000, 101),
    (2002, 'Jane Doe', 'Assistant Librarian', 50000, 101),
    (2003, 'Michael Johnson', 'Library Clerk', 40000, 102),
    (2004, 'Emily Brown', 'Assistant Librarian', 55000, 102),
    (2005, 'David Jones', 'Librarian', 62000, 103),
    (2006, 'Jessica White', 'Library Clerk', 38000, 103),
    (2007, 'Christopher Lee', 'Library Clerk', 38000, 101),
    (2008, 'Sarah Taylor', 'Assistant Librarian', 53000, 104),
    (2009, 'Matthew Wilson', 'Librarian', 61000, 104),
    (2010, 'Amanda Martinez', 'Library Clerk', 39000, 105),
    (2011, 'Daniel Garcia', 'Library Clerk', 40000, 101),
    (2012, 'Olivia Hernandez', 'Librarian', 59000, 104),
    (2013, 'Andrew Smith', 'Assistant Librarian', 52000, 101),
    (2014, 'Isabella Martinez', 'Library Clerk', 38000, 104),
    (2015, 'Ethan Johnson', 'Librarian', 63000, 105),
    (2016, 'Sophia Wilson', 'Assistant Librarian', 51000, 101),
    (2017, 'Jacob Thompson', 'Library Clerk', 41000, 102),
    (2018, 'Mia Garcia', 'Assistant Librarian', 54000, 103),
    (2019, 'William Rodriguez', 'Library Clerk', 37000, 104),
    (2020, 'Emily Davis', 'Librarian', 64000, 104);


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(3001, 'Alice Johnson', '123 Maple Street, Cityville', '2023-05-10'),
    (3002, 'Bob Smith', '456 Oak Avenue, Townsville', '2023-06-15'),
    (3003, 'Carol Williams', '789 Elm Drive, Villagetown', '2023-07-20'),
    (3004, 'David Brown', '321 Pine Road, Hamletville', '2023-08-25'),
    (3005, 'Emma Davis', '654 Cedar Lane, Countryside', '2020-09-30'),
    (3006, 'Frank Wilson', '987 Birch Court, Mountainville', '2023-10-05'),
    (3007, 'Grace Martinez', '246 Walnut Circle, Lakeside', '2021-11-10'),
    (3008, 'Henry Taylor', '135 Cherry Boulevard, Riverside', '2023-12-15'),
    (3009, 'Isabella Anderson', '579 Sycamore Street, Hillside', '2022-01-20'),
    (3010, 'Jack Thompson', '802 Willow Avenue, Lakeshore', '2024-02-25');


INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9780061120084', 'To Kill a Mockingbird', 'Fiction', 5.99, 'Yes', 'Harper Lee', 'HarperCollins'),
    ('9780451524935', '1984', 'Dystopian Fiction', 6.99, 'Yes', 'George Orwell', 'Signet Classic'),
    ('9780747532743', 'Harry Potter and the Philosopher''s Stone', 'Fantasy', 7.99, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
    ('9780743273565', 'The Great Gatsby', 'Fiction', 6.50, 'No', 'F. Scott Fitzgerald', 'Scribner'),
    ('9780141439518', 'Pride and Prejudice', 'Romance', 5.75, 'Yes', 'Jane Austen', 'Penguin Classics'),
    ('9780307277727', 'The Catcher in the Rye', 'Fiction', 5.25, 'No', 'J.D. Salinger', 'Little, Brown and Company'),
    ('9780805042599', 'The Diary of a Young Girl', 'Autobiography', 7.25, 'Yes', 'Anne Frank', 'Bantam'),
    ('9780143036661', 'A People''s History of the United States', 'History', 8.50, 'Yes', 'Howard Zinn', 'Harper Perennial Modern Classics'),
    ('9780375705243', 'The Guns of August', 'History', 9.99, 'No', 'Barbara W. Tuchman', 'Random House Trade Paperbacks'),
    ('9780679722762', 'The Origins of Totalitarianism', 'History', 10.25, 'Yes', 'Hannah Arendt', 'Harcourt Brace & Company');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
 (4001, 3001, 'To Kill a Mockingbird', '2024-03-10', '9780061120084'),
    (4002, 3001, '1984', '2024-03-12', '9780451524935'),
    (4003, 3001, 'Harry Potter and the Philosopher''s Stone', '2024-03-15', '9780747532743'),
    (4004, 3002, 'Pride and Prejudice', '2024-03-17', '9780141439518'),
    (4005, 3002, 'The Catcher in the Rye', '2024-03-20', '9780307277727'),
    (4006, 3003, 'The Great Gatsby', '2024-03-22', '9780743273565'),
    (4007, 3003, 'The Diary of a Young Girl', '2023-06-25', '9780805042599'),
    (4008, 3003, 'A People''s History of the United States', '2024-03-27', '9780143036661'),
    (4009, 3004, 'The Guns of August', '2024-03-30', '9780375705243'),
    (4010, 3004, 'The Origins of Totalitarianism', '2023-06-01', '9780679722762');


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(5001, 3001, 'To Kill a Mockingbird', '2024-04-12', '9780061120084'),
    (5002, 3002, '1984', '2024-04-13', '9780451524935'),
    (5003, 3003, 'Harry Potter and the Philosopher''s Stone', '2024-04-14', '9780747532743'),
    (5004, 3004, 'Pride and Prejudice', '2024-04-15', '9780141439518');



-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category, Rental_Price FROM Books Where Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(Category) AS Total FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN ( SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, count(Emp_name) AS Total_Employees FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT Customer.Customer_name FROM Customer JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Category = 'History';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, Count(*) AS Total_employees From Employee GROUP BY Branch_no HAVING Count(*) > 5;
