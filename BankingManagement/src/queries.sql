CREATE TABLE Employee (
    employeeId INT NOT NULL PRIMARY KEY,
    employeeFirstName VARCHAR(100) NOT NULL,
    employeeLastName VARCHAR(100) NOT NULL,
    employeeEmail VARCHAR(150) NOT NULL UNIQUE,
    employeePassword VARCHAR(100) NOT NULL,
    employeeContactNumber VARCHAR(10) NOT NULL,
    employeeAddress varchar(100) NOT NULL
);

INSERT INTO Employee (employeeId, employeeFirstName, employeeLastName, employeeEmail, employeePassword, employeeContactNumber, employeeAddress) 
VALUES 
(5678912, 'John', 'Doe', 'john.doe@example.com', 'password123', '9876543210', '123 Elm Street'),
(5678913, 'Jane', 'Smith', 'jane.smith@example.com', 'securePass456', '8765432109', '456 Maple Avenue'),
(5678914, 'Robert', 'Brown', 'robert.brown@example.com', 'robert123!', '7654321098', '789 Oak Lane'),
(5678915, 'Emily', 'Davis', 'emily.davis@example.com', 'emilyStrong99', '6543210987', '321 Pine Street'),
(5678916, 'Michael', 'Wilson', 'michael.wilson@example.com', 'mike2024$', '5432109876', '654 Cedar Road')


CREATE TABLE Customer (
    customerSSNId INT NOT NULL PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    customerEmail VARCHAR(150) NOT NULL UNIQUE,
    customerPassword VARCHAR(100) NOT NULL,
    customerPhoneNumber VARCHAR(10) NOT NULL,
    customerAadharNumber VARCHAR(12) NOT NULL UNIQUE,
    customerPanNumber VARCHAR(10) NOT NULL UNIQUE,
    customerAddress VARCHAR(200) NOT NULL
);

INSERT INTO Customer (customerSSNId, customerName, customerEmail, customerPassword, customerPhoneNumber, customerAadharNumber, customerPanNumber, customerAddress)
VALUES 
(2123456, 'Ravi Kumar', 'ravi.kumar@example.com', 'ravi@123', '9876543210', '123456789012', 'ABCDE1234F', '12 Main Street, Delhi'),
(2123457, 'Priya Sharma', 'priya.sharma@example.com', 'priya@456', '8765432109', '234567890123', 'BCDEF2345G', '45 Park Avenue, Mumbai'),
(2123458, 'Amit Verma', 'amit.verma@example.com', 'amit@789', '7654321098', '345678901234', 'CDEFG3456H', '78 Rose Street, Bengaluru'),
(2123459, 'Anjali Gupta', 'anjali.gupta@example.com', 'anjali@999', '6543210987', '456789012345', 'DEFGH4567I', '90 Green Lane, Hyderabad'),
(2123460, 'Manish Mehta', 'manish.mehta@example.com', 'manish@2024', '5432109876', '567890123456', 'EFGHI5678J', '102 Lake View, Chennai')

CREATE TABLE Account (
    AccountNumber INT NOT NULL PRIMARY KEY,
    CustomerSSNId INT NOT NULL,
    AccountType VARCHAR(10) CHECK (AccountType IN ('Savings', 'Current')),
    Balance DOUBLE NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('Active', 'Closed')),
    CONSTRAINT fk_Customer FOREIGN KEY (CustomerSSNId) REFERENCES Customer(customerSSNId) ON DELETE CASCADE
);

CREATE TABLE Transactions (
    transactionId INT NOT NULL PRIMARY KEY,
    AccountNumber INT NOT NULL,
    transactionAmount DOUBLE NOT NULL,
    transactionType VARCHAR(10) CHECK (transactionType IN ('Credit', 'Debit')),
    method VARCHAR(10) CHECK (method IN ('Withdraw', 'Deposit', 'Transfer')),
    CONSTRAINT fk_Account FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber) ON DELETE CASCADE
)

INSERT INTO Account (AccountNumber, CustomerSSNId, AccountType, Balance, Status) 
VALUES 
(100001, 2123456, 'Savings', 15000.50, 'Active'),
(100002, 2123457, 'Current', 25000.75, 'Active'),
(100003, 2123458, 'Savings', 8000.20, 'Active'),
(100004, 2123459, 'Current', 5000.00, 'Active'),
(100005, 2123460, 'Savings', 12000.00, 'Closed');



INSERT INTO Transactions (transactionId, AccountNumber, transactionAmount, transactionType, method) 
VALUES 
(1, 100001, 5000.00, 'Credit', 'Deposit'),
(2, 100002, 1500.00, 'Debit', 'Withdraw'),
(3, 100003, 2000.00, 'Debit', 'Withdraw'),
(4, 100004, 3000.00, 'Credit', 'Deposit'),
(5, 100001, 2500.50, 'Debit', 'Withdraw'),
(6, 100003, 1000.00, 'Credit', 'Deposit'),
(7, 100002, 500.00, 'Credit', 'Deposit'),
(8, 100004, 2000.00, 'Debit', 'Transfer');



