use bankingDB;

-- Generate Banking Summary Reports Using Aggregations

-- String Functions
-- These functions help clean and format text values.

select * from customers;

-- Display all customer FirstName in uppercase
SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

-- Display all customer FirstName in lowercase
SELECT
FirstName,
lower(FirstName) AS UpperCaseName
FROM customers;

-- Find the total number of characters in each customer FirstName .
SELECT
FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

-- Display only the first three characters of customer FirstName 

SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;


SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;


-- Combine customer's FirstName with LastName
SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

-- Math Functions
-- These functions perform financial calculations

-- ROUND()-Rounds a decimal number to the nearest whole number.
SELECT ROUND(1256.75) AS Rounded_Value;

-- CEIL()-Returns the smallest integer greater than or equal to a number.
SELECT CEIL(1256.25) AS Ceiling_Value;

-- FLOOR()-Returns the largest integer less than or equal to a number
SELECT FLOOR(1256.75) AS Floor_Value;

-- ABS()-Returns the absolute (positive) value of a number.
SELECT ABS(-2500) AS Absolute_Value;

-- MOD()-Returns the remainder after dividing one number by another
SELECT MOD(25,4) AS Remainder;



-- Date Functions - These functions analyze dates and time.
select * from customers;

-- Display the current system date
SELECT CURDATE(); 

-- Display the current system date and time
SELECT NOW();

-- Display the Birth of year
SELECT
CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

-- Display the Birth month
SELECT
CustomerID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;

-- Calculate the number of days since BirthDate
SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- Comparison Functions-Categorize customers as Adult or Young based on their birth year
SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

-- Display 'Not Available' if a phone number is NULL
SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

-- Find the latest birth date.
SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

-- Find the earliest birth date
SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;


-- Compare two customer names
SELECT
    FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;

-- UPDATE Customers
-- SET FirstName = NULL
-- WHERE FirstName = 'Priya';

-- NULLIF(FirstName, 'Priya') returns:

-- NULL if FirstName = 'Priya'
-- The original FirstName otherwise.


-- Task 2: Analyze Overall Banking Performance
-- Calculate the total balance maintained across all customer accounts
SELECT SUM(Balance) as total_balance
FROM Accounts;

-- Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
SELECT AVG(Balance) AS average_balance
FROM Accounts;

-- Identify the highest balance maintained in any customer account.
SELECT MAX(Balance) AS highest_balance
FROM Accounts;

-- Identify the lowest balance maintained in any customer account
SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

-- Determine the total number of customer accounts available in the system.
SELECT COUNT(*) AS total_accounts
FROM Accounts;

-- Task 3: Analyze Account-wise Performance
-- The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

-- Task 4: Identify High-Performing Categories
-- The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;



