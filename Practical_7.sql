-- Analyze Loan Risk Using Window Functions

-- The finance department wants to perform advanced loan analysis 
-- without combining multiple rows into a single result.

-- Instead of generating only summarized reports, they want to keep 
-- every loan record visible while performing calculations such 
-- as ranking, numbering, and cumulative totals.

-- To achieve this, SQL uses the OVER() clause.

-- The OVER() clause defines the window (set of rows) 
-- on which a Window Function performs its calculation.

-- Unlike the GROUP BY clause, which combines rows into a 
-- single summary, the OVER() clause performs calculations 
-- without reducing the number of rows.

-- Every loan record remains visible while additional 
-- analytical information is calculated.

-- The OVER() clause is used with functions like:

-- RANK()
-- DENSE_RANK()
-- ROW_NUMBER()
-- SUM()
-- LAG()
-- LEAD()

-- Window_Function() OVER (
--     ORDER BY column_name
-- )


-- Rank Customer Loans Using RANK()
-- The finance department wants to identify the highest-value loans issued by the bank.

-- Instead of manually sorting loan records every time, they want SQL to 
-- automatically assign rankings based on loan amount.

-- Loans with larger amounts should receive higher rankings.

-- The RANK() function assigns a rank to every row according to the specified ordering.

-- When duplicate values exist:
-- Equal values receive the same rank.
-- The next rank is skipped.


Select
    LoanID,
    CustomerID, LoanAmount, RANK() OVER
    (ORDER BY LoanAmount DESC) AS LoanRank
FROM Loans;


-- The system displays customer loans ranked from the highest loan amount to the lowest

-- Task 3: Rank Customer Loans Using DENSE_RANK()
-- The finance department wants to generate rankings without skipping rank numbers when duplicate loan amounts exist.
-- To achieve this, SQL provides the DENSE_RANK() function.

-- The DENSE_RANK() function works similarly to RANK(), but it does not skip rank numbers.
-- Unlike RANK(), the numbering remains consecutive.

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    DENSE_RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS DenseRank
FROM Loans;
-- The system displays consecutive rankings for all loan records.

-- Task 4: Assign Row Numbers Using ROW_NUMBER()

-- The finance department wants every loan record to have a unique sequential number for reporting purposes.
-- Even if two loans have the same loan amount, each record should receive a different sequence number.
-- To achieve this, SQL uses the ROW_NUMBER() function.


-- The ROW_NUMBER() function assigns a unique sequential number to every row after sorting the data.
-- Unlike RANK() and DENSE_RANK(), duplicate values never share the same row number.

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        ORDER BY LoanAmount DESC
    ) AS RowNumber
FROM Loans;


-- Task 5: Understanding PARTITION BY

-- The finance department wants to analyze loan records separately for each customer instead of considering all loan records together.
-- To achieve this, SQL provides the PARTITION BY clause, which divides the result set into smaller groups before applying a Window Function



-- Task 5: Understanding PARTITION BY

-- The finance department wants to analyze loan records separately for each customer instead of considering all loan records together.

-- To achieve this, SQL provides the PARTITION BY clause, which divides the result set into smaller groups before applying a Window Function

-- The PARTITION BY clause splits the result set into logical partitions (groups).

-- Each partition is processed independently while keeping every row visible.

-- Unlike GROUP BY, it does not merge rows. Instead, it allows window functions to restart their calculations for each partition.

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY LoanAmount DESC
    ) AS RowNum
FROM Loans;

-- Task 6: Calculate Running Total Using SUM() OVER()

-- The finance department wants to monitor how the total loan portfolio grows as each loan record is processed.
-- Instead of calculating only one total loan amount, they want to calculate the cumulative (running) total.
-- The SUM() OVER() function calculates a cumulative total while keeping all rows visible.
-- It continuously adds values from the beginning of the result set up to the current row.
-- This is known as a Running Total.

SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
FROM Loans;

use bankingdb;

-- The system displays the running total of loan amounts from the highest loan amount to the lowest.


-- Task 7: Compare Previous Loan Records Using LAG()

-- The finance department wants to compare every loan amount with the previous loan amount.
-- This helps identify increases or decreases in loan values between consecutive records.
-- To perform this comparison, SQL provides the LAG() function.

-- What is LAG()?

-- The LAG() function retrieves the value from the previous row in the result set.
-- It is commonly used to compare the current record with the immediately preceding record.
-- Unlike self-joins, LAG() provides an efficient way to access previous row values.

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;


-- The system displays each loan amount along with the previous loan amount.


-- Task 8: Compare Next Loan Records Using LEAD()

-- The finance department wants to compare every loan amount with the next loan amount.
-- This helps identify changes between consecutive loan records.
-- To achieve this, SQL provides the LEAD() function.

-- What is LEAD()?

-- The LEAD() function retrieves the value from the next row in the result set.
-- It allows users to compare the current row with the following row without writing complex self-joins.
SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;

-- The system displays each loan amount along with the next loan amount


use bankingDB;

select * from accounts;


SELECT
    AccountID,AccountType,Balance,
    SUM(Balance) OVER() AS Total
FROM Accounts;


select sum(balance) from Accounts;


use products;

select * from prod;

SELECT
    *,
    SUM(price) OVER(partition by category) AS Total
FROM prod;

SELECT
    *,
    SUM(price) OVER(order by price desc) AS Total
FROM prod;