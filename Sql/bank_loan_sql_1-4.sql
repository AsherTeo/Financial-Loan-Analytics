SELECT *
  FROM [Bank Loan].[dbo].[financial_loan]

-- 1a) Total Amount of Loan

Select SUM(loan_amount) as Total_Amount_of_Loan
	from [Bank Loan].[dbo].[financial_loan]

-- 1b) Total Amount of Loan - Month-To-Date

Select SUM(loan_amount) as Total_Amount_of_Loan_MTD
	from [Bank Loan].[dbo].[financial_loan]
	where MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) AS max_month from [Bank Loan].[dbo].[financial_loan]) 
	and YEAR(issue_date) = (SELECT MAX(Year(issue_date)) AS max_year from [Bank Loan].[dbo].[financial_loan])

-- 1c) Total Amount of Loan - Previous Month-To-Date

Select SUM(loan_amount) as Total_Amount_of_Loan_PMTD
	from [Bank Loan].[dbo].[financial_loan]
	where MONTH(issue_date) = (SELECT MAX(MONTH(issue_date) - 1) AS max_month from [Bank Loan].[dbo].[financial_loan]) 
	and YEAR(issue_date) = (SELECT MAX(Year(issue_date)) AS max_year from [Bank Loan].[dbo].[financial_loan])

-- 1d) Total Amount of Loan - % Current Month-To-Date and Previous Month-To-Date

WITH current_cte AS (
    SELECT 
        SUM(loan_amount) AS Total_Amount_of_Loan_MTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
),
previous_cte AS (
    SELECT 
        SUM(loan_amount) AS Total_Amount_of_Loan_PMTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) - 1 FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
)

SELECT 
    current_cte.Total_Amount_of_Loan_MTD,
    previous_cte.Total_Amount_of_Loan_PMTD,
    (CAST((current_cte.Total_Amount_of_Loan_MTD - previous_cte.Total_Amount_of_Loan_PMTD) AS DECIMAL(18,2)) / previous_cte.Total_Amount_of_Loan_PMTD) * 100 AS MoM_growth_percentage
FROM 
    current_cte, previous_cte

-- 2a Total Number of Loans

Select Count(id) as Total_Number_of_Loans
	from [Bank Loan].[dbo].[financial_loan]

-- 2b Total Number of Loans - MTD

Select Count(id) as Total_Number_of_Loans_MTD
	from [Bank Loan].[dbo].[financial_loan]
	where MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) AS max_month from [Bank Loan].[dbo].[financial_loan]) 
	and YEAR(issue_date) = (SELECT MAX(Year(issue_date)) AS max_year from [Bank Loan].[dbo].[financial_loan])

-- 2c Total Number of Loans - PMTD

Select Count(id) as Total_Number_of_Loans_PMTD
	from [Bank Loan].[dbo].[financial_loan]
	where MONTH(issue_date) = (SELECT MAX(MONTH(issue_date) - 1) AS max_month from [Bank Loan].[dbo].[financial_loan]) 
	and YEAR(issue_date) = (SELECT MAX(Year(issue_date)) AS max_year from [Bank Loan].[dbo].[financial_loan])

-- 2d) Total Number of Loans - % Current Month-To-Date and Previous Month-To-Date

WITH current_cte AS (
    SELECT 
        Count(id) AS Total_Number_of_Loans_MTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
),
previous_cte AS (
    SELECT 
        Count(id) AS Total_Number_of_Loans_PMTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) - 1 FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
)

SELECT 
    current_cte.Total_Number_of_Loans_MTD,
    previous_cte.Total_Number_of_Loans_PMTD,
    (CAST((current_cte.Total_Number_of_Loans_MTD - previous_cte.Total_Number_of_Loans_PMTD) AS DECIMAL(18,2)) / previous_cte.Total_Number_of_Loans_PMTD) * 100 AS MoM_growth_percentage
FROM 
    current_cte, previous_cte

-- 3a) Total Amount Recieved

select SUM(total_payment) as Total_Amount_Recieved 
	from [Bank Loan].[dbo].[financial_loan]

-- 3b) Total Amount Recieved MTD

Select SUM(total_payment) as Total_Amount_Recieved_MTD
	from [Bank Loan].[dbo].[financial_loan]
	where MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) AS max_month from [Bank Loan].[dbo].[financial_loan]) 
	and YEAR(issue_date) = (SELECT MAX(Year(issue_date)) AS max_year from [Bank Loan].[dbo].[financial_loan])

-- 3c) Total Amount Recieved PTD

Select SUM(total_payment) as Total_Amount_Recieved_MTD
	from [Bank Loan].[dbo].[financial_loan]
	where MONTH(issue_date) = (SELECT MAX(MONTH(issue_date) - 1) AS max_month from [Bank Loan].[dbo].[financial_loan]) 
	and YEAR(issue_date) = (SELECT MAX(Year(issue_date)) AS max_year from [Bank Loan].[dbo].[financial_loan])

-- 3d) Total Amount Recieved  - % Current Month-To-Date and Previous Month-To-Date

WITH current_cte AS (
    SELECT 
         SUM(total_payment) as Total_Amount_Recieved_MTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
),
previous_cte AS (
    SELECT 
         SUM(total_payment) as Total_Amount_Recieved_PMTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) - 1 FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
)

SELECT 
    current_cte.Total_Amount_Recieved_MTD,
    previous_cte.Total_Amount_Recieved_PMTD,
    (CAST((current_cte.Total_Amount_Recieved_MTD - previous_cte.Total_Amount_Recieved_PMTD) AS DECIMAL(18,2)) / previous_cte.Total_Amount_Recieved_PMTD) * 100 AS MoM_growth_percentage
FROM 
    current_cte, previous_cte


-- 4a Total Profit Earned

SELECT 
    SUM(total_payment) as Total_Amount_Received, 
    SUM(loan_amount) as Total_Amount_of_Loan,  
	SUM(total_payment) -  SUM(loan_amount) as Profit,
    CAST(((SUM(total_payment) - SUM(loan_amount)) * 100.0 / NULLIF(SUM(total_payment), 0)) AS decimal(18,2)) as Profit_percent
FROM 
    [Bank Loan].[dbo].[financial_loan]

-- 4b Total Profit Earned - MTD

SELECT 
    SUM(total_payment) as Total_Amount_Received, 
    SUM(loan_amount) as Total_Amount_of_Loan,  
	SUM(total_payment) -  SUM(loan_amount) as Profit,
    CAST(((SUM(total_payment) - SUM(loan_amount)) * 100.0 / NULLIF(SUM(total_payment), 0)) AS decimal(18,2)) as Profit_percent
FROM 
    [Bank Loan].[dbo].[financial_loan]
 WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])

-- 4c Total Profit Earned - PMTD

SELECT 
    SUM(total_payment) as Total_Amount_Received, 
    SUM(loan_amount) as Total_Amount_of_Loan,  
	SUM(total_payment) -  SUM(loan_amount) as Profit,
    CAST(((SUM(total_payment) - SUM(loan_amount)) * 100.0 / NULLIF(SUM(total_payment), 0)) AS decimal(18,2)) as Profit_percent
FROM 
    [Bank Loan].[dbo].[financial_loan]
 WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date) - 1 ) FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])

-- 4d) Total Profit Earned - % Current Month-To-Date and Previous Month-To-Date

WITH current_cte AS (
    SELECT 
        SUM(total_payment) as Total_Amount_Received_MTD, 
		SUM(loan_amount) as Total_Amount_of_Loan_MTD,  
		SUM(total_payment) -  SUM(loan_amount) as Profit_MTD,
		CAST(((SUM(total_payment) - SUM(loan_amount)) * 100.0 / NULLIF(SUM(total_payment), 0)) AS decimal(18,2)) as Profit_percent_MTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
),
previous_cte AS (
    SELECT 
        SUM(total_payment) as Total_Amount_Received_PMTD, 
		SUM(loan_amount) as Total_Amount_of_Loan_PMTD,  
		SUM(total_payment) -  SUM(loan_amount) as Profit_PMTD,
		CAST(((SUM(total_payment) - SUM(loan_amount)) * 100.0 / NULLIF(SUM(total_payment), 0)) AS decimal(18,2)) as Profit_percent_PMTD
    FROM 
        [Bank Loan].[dbo].[financial_loan]
    WHERE 
        MONTH(issue_date) = (SELECT MAX(MONTH(issue_date)) - 1 FROM [Bank Loan].[dbo].[financial_loan]) 
        AND YEAR(issue_date) = (SELECT MAX(YEAR(issue_date)) FROM [Bank Loan].[dbo].[financial_loan])
)

SELECT 
    current_cte.Profit_percent_MTD,
    previous_cte.Profit_percent_PMTD,
    (CAST((current_cte.Profit_percent_MTD - previous_cte.Profit_percent_PMTD) AS DECIMAL(18,2)) / previous_cte.Profit_percent_PMTD) * 100 AS MoM_growth_percentage
FROM 
    current_cte, previous_cte

Use [Bank Loan]
