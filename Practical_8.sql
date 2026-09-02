
-- A JOIN is used to combine data from two or more related tables using 
-- a common column.

-- Instead of storing all information in one table, 
-- relational databases divide information into multiple 
-- tables to reduce redundancy. 
-- SQL Joins help retrieve related information from these tables.

-- INNER JOIN
-- Returns only the matching records from both tables.
-- Non-matching rows are excluded.
-- Example: If a customer has an account, their data is displayed.

-- LEFT JOIN (LEFT OUTER JOIN)
-- Returns all records from the left table and the matching records from the right table.
-- If there is no match, NULL values are returned for the right table.
-- Example: Shows all customers, even those without an account.


-- RIGHT JOIN (RIGHT OUTER JOIN)
-- Returns all records from the right table and the matching records from the left table.
-- If there is no match, NULL values are returned for the left table.
-- Example: Shows all accounts, even if some are not linked to a customer.


-- FULL OUTER JOIN
-- Returns all records from both tables.
-- Matching rows are combined, while non-matching rows from either table contain NULL values.
-- Note: MySQL does not support FULL OUTER JOIN directly. It can be simulated using LEFT JOIN + RIGHT JOIN with UNION.

-- Example: Displays all customers and all accounts, whether they match or not.




use bankingDB;

select * from Accounts;
select * from Transactions;
desc Transactions;


-- Task 1:
-- Generate Accounts Transaction Reports

-- The finance department wants to generate a report that displays every bank account along with its corresponding transaction details.
-- Since account information and transaction information are stored in different tables, SQL needs to combine both tables using a common column.
-- To achieve this, we use an INNER JOIN.

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

-- Display All Accounts Including Those Without Transactions

-- The bank management wants to identify all bank accounts, including those that have not yet performed any transactions.
-- To include every account in the report, SQL provides the LEFT JOIN.

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;

-- Generate Deposit Transaction Reports
SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

select * from accounts;

insert into accounts(AccountID,AccountType,Balance,CustomerID) 
values(206,'Savings',20000,102);


-- Generate High Balance Account Transaction Reports

-- The bank management wants to identify customers who maintain high account balances and analyze their transaction activities.
-- This report helps the bank identify premium account holders and understand their banking transactions.
-- To achieve this, we will combine the Accounts and Transactions tables and filter accounts having a balance greater than ₹30,000.
-- SQL allows us to combine multiple conditions with JOIN and WHERE clauses.

-- After joining related tables, we can apply conditions to retrieve only the required records.
-- This approach helps generate meaningful business reports

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;






