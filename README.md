# Mysql_project
The Library Management Database consists of six core tables: Branch, Employee, Books, Customer, IssueStatus, and ReturnStatus, each serving a distinct function in the library system. The Branch table contains essential details about each library branch, including a unique identifier, the branch manager's ID, the branch's address, and contact information. The Employee table tracks the employees working in various branches, storing their employee ID, name, position, salary, and branch affiliation. The Books table maintains a catalog of all books available for rental in the library, with attributes like the ISBN, title, category, rental price, status (availability), author, and publisher.

The Customer table holds information about library patrons, including their ID, name, address, and registration date, enabling the library to track who is borrowing books. The IssueStatus table records the details of books issued to customers, including the issue date and references to both the customer and the book. The ReturnStatus table manages the return process by logging the details of returned books, along with the return date and references to the books and customers involved.

This database structure is designed to support various queries and reports, such as retrieving available books, listing employees by salary, tracking book issues and returns, and identifying customers who have not yet borrowed books. It can also be used to monitor the status of books, rental prices, and branch employee counts, offering a comprehensive view of the library's operations. By centralizing this data, the library management system can efficiently manage resources, track book circulation, and ensure smooth operations.






