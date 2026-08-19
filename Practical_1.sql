create database BankingDB;
use BankingDB;

select database();

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

alter table Customers add DateofBirth date;

alter table Customers modify Phone varchar(20);


ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

desc Accounts;



desc Accounts;
desc Customers;









describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);


CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

describe branches;




use sakila;


desc Customers;
desc Accounts;

-- 1st Task -> Accounts → Connect with Customers
-- Add a foreign key on CustomerID that references Customers(CustomerID)


ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);


-- 2nd Task
-- Accounts → Connect with Branches
-- Add a foreign key on BranchID that references Branches(BranchID).
desc Branches;

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Branches
ADD CONSTRAINT PK_Branches
PRIMARY KEY (BranchID);

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

-- 3rd Task
-- Transactions → Connect with Accounts
-- Add a foreign key on AccountID that references Accounts(AccountID)

desc Transactions;

ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Accounts
ADD CONSTRAINT PK_Accounts
PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID);

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);
select * from Accounts;

desc Accounts;


-- 4th Task
-- Loans → Connect with Customers
-- Add a foreign key on CustomerID that references Customers(CustomerID).


desc Loans;
ALTER TABLE Loans
ADD CustomerID INT;

ALTER TABLE Loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

desc Loans;

select * from Customers;
select * from Accounts;
select * from Branches; select * from Loans; select * from Transacions;


select * from Loans;
