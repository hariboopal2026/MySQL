-- Perform Branch Performance Analysis Using Subqueries

-- Single-Row Subquery-A Single-Row Subquery returns only one value.

USE BANKINGdB;
SELECT AVG(Amount)
FROM Transactions;
-- Identify Transactions Above the Average Transaction Amount
SELECT *
FROM Transactions
WHERE Amount >
(
    SELECT AVG(Amount)
    FROM Transactions
);


-- Identify Accounts with Above-Average Balance

SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance >
(
    SELECT AVG(Balance)
    FROM Accounts
)
ORDER BY Balance ASC;

 -- Identify Deposit Accounts Using a Multi-Row Subquery
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE AccountID IN
(
    SELECT AccountID
    FROM Transactions
    WHERE TransactionType = 'Deposit'
);

-- Identify the Account with the Highest Balance
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance =
(
    SELECT MAX(Balance)
    FROM Accounts
);

-- Identify the Account with the lOWEST Balance
SELECT
    AccountID,
    AccountType,
    Balance,
    CustomerID
FROM Accounts
WHERE Balance =
(
    SELECT MIN(Balance)
    FROM Accounts
);