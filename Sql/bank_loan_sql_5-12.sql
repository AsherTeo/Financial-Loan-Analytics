SELECT *
  FROM [Bank Loan].[dbo].[financial_loan]

-- 5) Group By loan status

SELECT loan_status, 
	   Count(id) as Total_Number_of_Loans,
	   AVG(int_rate) * 100 as Avg_Interest_rate,
	   AVG(dti) as AVG_Debt_to_Income,
	   SUM(loan_amount) as Total_Amount_of_Loan,
	   SUM(total_payment) as Total_Amount_Recieved,
	   (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by loan_status
  order by Profit_Percent DESC

-- 6) Group By State

SELECT address_state, 
	   Count(id) as Total_Number_of_Loans,
	   AVG(int_rate) * 100 as Avg_Interest_rate,
	   AVG(annual_income) as AVG_anunal_income,
	   AVG(dti) as AVG_Debt_to_Income,
	   SUM(loan_amount) as Total_Amount_of_Loan,
	   SUM(total_payment) as Total_Amount_Recieved,
	   (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by address_state
  order by Total_Number_of_Loans DESC 

 -- 7) Group By Months

  SELECT 
	   DATENAME(Month, issue_date) as Month_name, 
	   Count(id) as Total_Number_of_Loans,
	   AVG(int_rate) * 100 as Avg_Interest_rate,
	   AVG(annual_income) as AVG_anunal_income,
	   AVG(dti) as AVG_Debt_to_Income,
	   SUM(loan_amount) as Total_Amount_of_Loan,
	   SUM(total_payment) as Total_Amount_Recieved,
	   (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by Month(issue_date), DATENAME(Month, issue_date)
  order by Month(issue_date) ASC

  -- 8) Group by empolyment lenght

   SELECT 
	   distinct emp_length as Durations, 
	   Count(id) as Total_Number_of_Loans,
	   AVG(int_rate) * 100 as Avg_Interest_rate,
	   AVG(annual_income) as AVG_anunal_income,
	   AVG(dti) as AVG_Debt_to_Income,
	   SUM(loan_amount) as Total_Amount_of_Loan,
	   SUM(total_payment) as Total_Amount_Recieved,
	   (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by emp_length
  order by Profit_Percent DESC

  -- 9) Group by Home Ownerships

SELECT 
	  distinct home_ownership , 
	  Count(id) as Total_Number_of_Loans,
	  AVG(int_rate) * 100 as Avg_Interest_rate,
	  AVG(annual_income) as AVG_anunal_income,
	  AVG(dti) as AVG_Debt_to_Income,
	  SUM(loan_amount) as Total_Amount_of_Loan,
	  SUM(total_payment) as Total_Amount_Recieved,
	  (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by home_ownership
  order by Profit_Percent DESC

 -- 10) Group by Purpose

SELECT 
	  distinct purpose , 
	  Count(id) as Total_Number_of_Loans,
	  AVG(int_rate) * 100 as Avg_Interest_rate,
	  AVG(annual_income) as AVG_anunal_income,
	  AVG(dti) as AVG_Debt_to_Income,
	  SUM(loan_amount) as Total_Amount_of_Loan,
	  SUM(total_payment) as Total_Amount_Recieved,
	  (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by purpose
  order by Profit_Percent DESC

  -- 11) Group by Grade

SELECT 
	  grade , 
	  Count(id) as Total_Number_of_Loans,
	  AVG(int_rate) * 100 as Avg_Interest_rate,
	  AVG(annual_income) as AVG_anunal_income,
	  AVG(dti) as AVG_Debt_to_Income,
	  SUM(loan_amount) as Total_Amount_of_Loan,
	  SUM(total_payment) as Total_Amount_Recieved,
	  (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by grade
  order by Profit_Percent DESC

  -- Group by Terms

SELECT 
	  term , 
	  Count(id) as Total_Number_of_Loans,
	  AVG(int_rate) * 100 as Avg_Interest_rate,
	  AVG(annual_income) as AVG_anunal_income,
	  AVG(dti) as AVG_Debt_to_Income,
	  SUM(loan_amount) as Total_Amount_of_Loan,
	  SUM(total_payment) as Total_Amount_Recieved,
	  (CAST(SUM(total_payment) - SUM(loan_amount) AS DECIMAL(18,2)) / SUM(loan_amount)) * 100 AS Profit_Percent
  FROM [Bank Loan].[dbo].[financial_loan]
  group by term
  order by Profit_Percent DESC

  SELECT *
  FROM [Bank Loan].[dbo].[financial_loan]
  where grade = 'F'