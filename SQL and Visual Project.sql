Create database project_db;
use project_db;
show tables;
select * from financial_loan_dataset;
Select count(id) as total_loan_application from financial_loan_dataset; #Total Loan Application
select sum(loan_amount) as total_funded_amount from financial_loan_dataset; #Amount circulated in the market
select sum(total_payment) as total_amount_collected from financial_loan_dataset; #Amount received back by the bank
select avg(int_rate)*100 as avg_interest_rate from financial_loan_dataset; #Average interest rate
select avg(dti)*100 as avg_dti from financial_loan_dataset; #Average dti rate

Select loan_status from financial_loan_dataset; #fully paid or current > good loan charged off > bad loan
#Total good Loan Application
select count(id) as good_loan_application from financial_loan_dataset
where loan_status='Fully Paid' or loan_Status='Current'; #Total Good loan Application

select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)/count(id) 
as good_loan_percent from financial_loan_dataset; #Good Loan Percent

select (count(case when loan_status='Charged off' then id end)*100)/count(id) 
as bad_loan_percent from financial_loan_dataset; #Bad Loan Percent


select count(id) as bad_loan_application from financial_loan_dataset
where loan_status='Charged off' or loan_Status='Charged off'; #Total bad loan Application

#Good Loan funded Amount
select sum(loan_amount) as good_loan_amount from financial_loan_dataset 
where loan_status='Fully Paid' or loan_status='Current'; #Good loan Funded Amount
select sum(loan_amount) as bad_loan_amount from financial_loan_dataset 
where loan_status='Charged off'; #Bad loan Funded Amount

#How much amount have been received by bank
select sum(total_payment) as bad_loan_amount_received from financial_loan_dataset
where loan_status='Charged off'; #bad loan amount that bank was able to retreive
select sum(total_payment) as good_loan_amount_received from financial_loan_dataset
where loan_status='Fully Paid'or loan_status='Current'; #good loan amount that bank was able to retreive 