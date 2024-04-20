SELECT *
  FROM [Bank Loan].[dbo].[financial_loan]
 -- Server Name for Python

	select @@SERVERNAME

 -- Make the first letter upper and rest lower for home ownership
UPDATE [Bank Loan].[dbo].[financial_loan]
SET home_ownership = CONCAT(UPPER(LEFT(home_ownership, 1)), LOWER(SUBSTRING(home_ownership, 2, LEN(home_ownership) - 1)));
 
 -- Make the first letter upper and rest lower for home purpose

UPDATE [Bank Loan].[dbo].[financial_loan]
SET purpose = CONCAT(UPPER(LEFT(purpose, 1)), LOWER(SUBSTRING(purpose, 2, LEN(purpose) - 1)))

 -- Make the first letter upper and rest lower for Emp Title
UPDATE [Bank Loan].[dbo].[financial_loan]
SET emp_title = UPPER(emp_title)


-- Remove Verification Status Column, member ID and application type
ALTER Table [Bank Loan].[dbo].[financial_loan]
Drop Column member_id, verification_status, application_type

-- Replace 10+ years with 10 > years

UPDATE [Bank Loan].[dbo].[financial_loan]
SET emp_length = REPLACE(emp_length, '10+ years', '10 > years')

-- Create new Columns for Term

Alter Table [Bank Loan].[dbo].[financial_loan]
ADD Term_Mnths FLOAT 

Update [Bank Loan].[dbo].[financial_loan]
SET Term_Mnths = left(term,2)

-- Convert VARCHAR to FLOAT
ALTER TABLE [Bank Loan].[dbo].[financial_loan]
ALTER COLUMN loan_amount FLOAT;

ALTER TABLE [Bank Loan].[dbo].[financial_loan]
ALTER COLUMN int_rate FLOAT;

SELECT *
  FROM [Bank Loan].[dbo].[financial_loan]
 
-- ADD Profit Columns

ALTER TABLE [Bank Loan].[dbo].[financial_loan]
ADD Profit FLOAT

Update [Bank Loan].[dbo].[financial_loan]
SET Profit = total_payment - loan_amount

-- ADD Profit Columns in %

ALTER TABLE [Bank Loan].[dbo].[financial_loan]
ADD Profit_Percent FLOAT

Update [Bank Loan].[dbo].[financial_loan]
SET Profit_Percent = (Profit / loan_amount) * 100