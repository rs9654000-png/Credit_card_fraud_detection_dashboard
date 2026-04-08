--overall fraud statistics
SELECT COUNT(*) AS TOTAL_TRANSACTIONS,
SUM(CLASS) AS FRAUD_TRANSACTIONS,
(SUM(CLASS)* 100/COUNT(*)) AS FRAUD_PERCENTAGE
FROM [dbo].[cleaned_fraud_data];
--FRAUD VS NORTMAL TRANSACTIONS
SELECT CLASS,COUNT(*) AS COUNT
FROM [dbo].[cleaned_fraud_data]
GROUP BY CLASS;
--FRAUD BY HOUR
SELECT HOUR,COUNT(*) AS FRAUD_COUNT
FROM [dbo].[cleaned_fraud_data]
WHERE CLASS=1
GROUP BY HOUR
ORDER BY FRAUD_COUNT DESC;
--FRAUD BY DAY
SELECT DAY,COUNT(*) AS FRAUD_COUNT
FROM [dbo].[cleaned_fraud_data]
WHERE CLASS =1
GROUP BY DAY
ORDER BY FRAUD_COUNT DESC;
--AVERAGE TRANSACTION AMOUNT
SELECT CLASS,AVG(AMOUNT) AS AVG_AMOUNT
FROM [dbo].[cleaned_fraud_data]
GROUP BY CLASS;
--HIGH VALUE FRAUD TRANSACTIONS
SELECT TOP 10 * 
FROM [dbo].[cleaned_fraud_data]
WHERE CLASS = 1
ORDER BY AMOUNT DESC;
--FRAUD COUNT BY AMOUNT RANGE
SELECT AMOUNT_CATEGORY,COUNT(*) AS FRAUD_COUNT
FROM(
SELECT 
  CASE 
    WHEN Amount < 50 THEN 'Low'
    WHEN Amount BETWEEN 50 AND 200 THEN 'Medium'
    ELSE 'High'
  END AS amount_category
FROM [dbo].[cleaned_fraud_data]
WHERE Class = 1
)AS SUB
GROUP BY AMOUNT_CATEGORY;
--TOP SUSPICIOUS HOURS+HIGH AMOUNT
SELECT Hour, COUNT(*) AS fraud_count, AVG(Amount) AS avg_amount
FROM [dbo].[cleaned_fraud_data]
WHERE Class = 1
GROUP BY Hour
ORDER BY fraud_count DESC;
--FRAUD TREND
SELECT Hour, COUNT(*) AS total_transactions,
       SUM(Class) AS fraud_transactions
FROM [dbo].[cleaned_fraud_data]
GROUP BY Hour
ORDER BY Hour;
--FRAUD PERCENTAGE BY HOUR
SELECT 
  Hour,
  (SUM(Class) * 100.0 / COUNT(*)) AS fraud_percentage
FROM [dbo].[cleaned_fraud_data]
GROUP BY Hour
ORDER BY fraud_percentage DESC;

