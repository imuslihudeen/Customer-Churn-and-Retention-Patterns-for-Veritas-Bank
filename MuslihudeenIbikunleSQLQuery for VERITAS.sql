SELECT *
  FROM [VERITAS].[dbo].[AccountDetails]

 SELECT *
  FROM [VERITAS].[dbo].[CustomerInfo]

  SELECT TOP 10 *
  FROM [VERITAS].[dbo].[CustomerInfo]
 
 SELECT COUNT (* ) FROM VERITAS.dbo.AccountDetails

 SELECT COUNT (* ) FROM VERITAS.dbo.CustomerInfo


 ----Exploratory Data Analysis____

 ------Univariate Analysis-------
 SELECT ExitStatus, COUNT (CustomerId) AS ChurnCount FROM AccountDetails
 Group BY ExitStatus

 SELECT ActiveMember, COUNT (CustomerId) AS ActivityCount FROM AccountDetails
 Group BY ActiveMember

 SELECT CreditRating, COUNT (CustomerId) AS ActivityRating FROM AccountDetails
 Group BY CreditRating

  ------Bivariate Analysis-------
   SELECT ExitStatus,ActiveMember, COUNT (CustomerId) AS Count FROM AccountDetails
 Group BY ExitStatus, ActiveMember

 SELECT ActiveMember,CreditRating, COUNT (CustomerId) AS Count FROM AccountDetails
 Group BY ActiveMember, CreditRating

  ------Multivariate Analysis-------
   SELECT ExitStatus,ActiveMember,Creditcard, COUNT (CustomerId) AS Count FROM AccountDetails
 Group BY ExitStatus, ActiveMember,Creditcard


 ---Customer Table-------
 SELECT COUNT (*) AS TotalCustomers FROM CustomerInfo

 SELECT 
  AgeGroup,
  COUNT(*) AS CustomerCount
FROM CustomerInfo
GROUP BY AgeGroup
ORDER BY AgeGroup;

SELECT 
  Gender,
  COUNT(*) AS GenderCount
FROM CustomerInfo
GROUP BY Gender
ORDER BY Gender;


SELECT 
  Country,
  COUNT(*) AS CountryCount
FROM CustomerInfo
GROUP BY Country
ORDER BY Country;

-----CreditScore------

SELECT * FROM AccountDetails
SELECT CreditRating FROM AccountDetails

------Create Column CreditRating-------
Update AccountDetails
SET CreditRating =
 CASE 
    WHEN CreditScore BETWEEN 300 AND 579 THEN 'Poor'
    WHEN CreditScore BETWEEN 580 AND 669 THEN 'Fair'
    WHEN CreditScore BETWEEN 670 AND 739 THEN 'Good'
    WHEN CreditScore BETWEEN 740 AND 799 THEN 'Very Good'
    WHEN CreditScore >= 800 THEN 'Excellent'
    ELSE 'Unknown'
    END

-----Credit Rating Analysis---------

SELECT CreditScore AS TotalCreditScore
FROM AccountDetails

SELECT SUM(CreditScore) AS TotalCreditScore
FROM AccountDetails

SELECT AVG(CreditScore) AS AverageTenure
FROM AccountDetails

SELECT 
    ci.Country,ad.CreditRating
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY  ci.Country, ad.CreditRating
ORDER BY  ci.Country, ad.CreditRating

SELECT 
    ci.Country,
    ad.CreditRating,
    COUNT(*) AS CustomerCount
FROM CustomerInfo ci
JOIN AccountDetails ad ON ci.CustomerID = ad.CustomerID
GROUP BY 
    ci.Country,
    ad.CreditRating
ORDER BY 
    ci.Country,
    ad.CreditRating DESC;

    SELECT 
    ci.Gender,
    ad.CreditRating,
    COUNT(*) AS CustomerCount
FROM CustomerInfo ci
JOIN AccountDetails ad ON ci.CustomerID = ad.CustomerID
GROUP BY 
    ci.Gender,
    ad.CreditRating
ORDER BY 
    ci.Gender,
    ad.CreditRating DESC;

    SELECT 
    ci.AgeGroup,
    ad.CreditRating,
    COUNT(*) AS CustomerCount
FROM CustomerInfo ci
JOIN AccountDetails ad ON ci.CustomerID = ad.CustomerID
GROUP BY 
    ci.AgeGroup,
    ad.CreditRating
ORDER BY 
    ci.AgeGroup,
    ad.CreditRating DESC;

-----Tenure-------
SELECT SUM(Tenure) AS TotalTenure
FROM AccountDetails

SELECT AVG(Tenure) AS AverageTenure
FROM AccountDetails

SELECT 
    ci.Country,
    SUM(ad.Tenure) AS TotalTenure
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Country
ORDER BY ci.Country;

SELECT 
    ci.Gender,
    SUM(ad.Tenure) AS TotalTenure
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Gender
ORDER BY ci.Gender;

SELECT 
    ci.AgeGroup,
    SUM(ad.Tenure) AS TotalTenure
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.AgeGroup
ORDER BY ci.AgeGroup;

-----Account Balance-------

SELECT ROUND(SUM(AccountDetails.Balance),2) AS TotalBalance FROM AccountDetails

SELECT CEILING(SUM(AccountDetails.Balance)) AS TotalBalance FROM AccountDetails

SELECT CEILING(AVG(AccountDetails.Balance)) AS AverageBalance FROM AccountDetails


 SELECT 
    ci.Country,
    CEILING(SUM(ad.Balance)) AS TotalBalance
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Country
ORDER BY ci.Country;

SELECT 
    ci.Gender,
    CEILING(SUM(ad.Balance)) AS TotalBalance
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Gender
ORDER BY ci.Gender;

SELECT 
    ci.AgeGroup,
    CEILING(SUM(ad.Balance)) AS TotalBalance
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.AgeGroup
ORDER BY ci.AgeGroup;


 ------------Credit Card------------
 SELECT 
    CreditCard,
    COUNT(*) AS TotalCreditcard
FROM AccountDetails
GROUP BY CreditCard;
 
 SELECT 
    ci.Country, ad.CreditCard,
    COUNT(*) AS TotalCrditcard
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Country, ad.CreditCard;


SELECT 
    ci.Gender, ad.CreditCard,
    COUNT(*) AS TotalCreditcard
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Gender, ad.CreditCard;

SELECT
    ci.AgeGroup, ad.CreditCard,
    COUNT (*) As TotalCreditCard
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.AgeGroup, ad.CreditCard


-----Products-----
SELECT SUM(Products) AS TotalProdcuts
FROM AccountDetails
    
SELECT 
    ci.Country,
    SUM(ad.Products) AS TotalProducts
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Country
ORDER BY ci.Country;

SELECT 
    ci.Gender,
    SUM(ad.Products) AS TotalProducts
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Gender
ORDER BY ci.Gender;

SELECT 
    ci.AgeGroup,
    SUM(ad.Products) AS TotalProducts
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.AgeGroup
ORDER BY ci.AgeGroup;


--------------ActiveMember----------
SELECT 
    ActiveMember,
    COUNT(*) AS TotalActiveMember
FROM AccountDetails
GROUP BY ActiveMember;

SELECT 
    ci.Country, ad.ActiveMember,
    COUNT(*) AS TotalActiveMember
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Country, ad.ActiveMember;

SELECT 
    ci.Gender, ad.ActiveMember,
    COUNT(*) AS TotalActiveMember
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Gender, ad.ActiveMember;

SELECT 
    ci.AgeGroup, ad.ActiveMember,
    COUNT(*) AS TotalActiveMember
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.AgeGroup, ad.ActiveMember;

 -------------ExitStatus------------
 SELECT 
    ExitStatus,
    COUNT(*) AS TotalExitStatus
FROM AccountDetails
GROUP BY ExitStatus;

SELECT 
    ci.Country, ad.ExitStatus,
    COUNT(*) AS TotalExitStatus
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Country, ad.ExitStatus;

SELECT 
    ci.Gender, ad.ExitStatus,
    COUNT(*) AS TotalExitStatus
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.Gender, ad.ExitStatus;

SELECT 
    ci.AgeGroup, ad.ExitStatus,
    COUNT(*) AS TotalExitStatus
FROM AccountDetails ad
JOIN CustomerInfo ci ON ad.CustomerID = ci.CustomerID
GROUP BY ci.AgeGroup, ad.ExitStatus;

-----CHURN RATE Analysis---------
SELECT ExitStatus FROM AccountDetails
Where ExitStatus = 'Churned'


SELECT 
    ci.Country,
    COUNT(*) AS ChurnedCustomers
FROM 
    CustomerInfo ci
JOIN 
    AccountDetails ad ON ci.CustomerId = ad.CustomerId
WHERE 
    ad.ExitStatus = 'Churned'
GROUP BY 
    ci.Country
ORDER BY 
    ChurnedCustomers DESC;

SELECT 
    ci.Country,
    COUNT(*) AS ChurnedCustomers,
    CAST(COUNT(*) * 100.0 / NULLIF(tc.TotalCustomers, 0) AS DECIMAL(5,2)) AS ChurnRatePercentage
FROM CustomerInfo ci
JOIN AccountDetails ad ON ci.CustomerID = ad.CustomerID
JOIN (
    SELECT ci.Country, COUNT(*) AS TotalCustomers
    FROM CustomerInfo ci
    JOIN AccountDetails ad ON ci.CustomerID = ad.CustomerID
    GROUP BY ci.Country
) tc ON ci.Country = tc.Country
WHERE ad.ExitStatus = 'Churned'
GROUP BY ci.Country, tc.TotalCustomers
ORDER BY ChurnRatePercentage DESC;


SELECT 
    CAST(SUM(CASE WHEN ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS FLOAT) /
    COUNT(*) * 100 AS ChurnRatePercentage
FROM 
    AccountDetails;

    SELECT 
    ci.Country,
    ROUND(CAST(SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS FLOAT) /
    COUNT(*) * 100,1) AS ChurnRatePercentage
FROM 
    AccountDetails ad
JOIN 
    CustomerInfo ci ON ad.CustomerId = ci.CustomerId
GROUP BY 
    ci.Country
ORDER BY 
    ChurnRatePercentage DESC;
    

---ChurnRate by Country-------
    SELECT 
    ci.Country,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(CAST(SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100,1) AS ChurnRatePercentage
FROM 
    AccountDetails ad
JOIN 
    CustomerInfo ci ON ad.CustomerId = ci.CustomerId
GROUP BY 
    ci.Country
ORDER BY 
    ChurnRatePercentage DESC;

-----Churn Rate by Gender--------
     SELECT 
    ci.Gender,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(CAST(SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100,1) AS ChurnRatePercentage
FROM 
    AccountDetails ad
JOIN 
    CustomerInfo ci ON ad.CustomerId = ci.CustomerId
GROUP BY 
    ci.Gender
ORDER BY 
    ChurnRatePercentage DESC;

    -----Churn Rate by AgeGroup--------
     SELECT 
    ci.AgeGroup,
    COUNT(*) AS TotalCustomers,
    SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    ROUND(CAST(SUM(CASE WHEN ad.ExitStatus != 'Retained' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100,1) AS ChurnRatePercentage
FROM 
    AccountDetails ad
JOIN 
    CustomerInfo ci ON ad.CustomerId = ci.CustomerId
GROUP BY 
    ci.AgeGroup
ORDER BY 
    ChurnRatePercentage DESC;

    Select * from AccountDetails