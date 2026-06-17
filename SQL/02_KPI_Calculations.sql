use WideWorldImportersDW;

/*------------------------------------------------------------
Total Revenue
-------------------------------------------------------------*/

SELECT 
    SUM([Total Including Tax]) as Total_Revenue
FROM Fact.Sale;

/*------------------------------------------------------------
Total Orders
--------------------------------------------------------------*/

SELECT
    COUNT(DISTINCT [WWI Invoice ID]) AS Total_Orders
FROM Fact.Sale;

/*-------------------------------------------------------------
Total Customers
---------------------------------------------------------------*/

SELECT
    COUNT(DISTINCT [Customer Key]) AS Total_Customers
FROM Fact.Sale;

/*-------------------------------------------------------------
Average Order Value
---------------------------------------------------------------*/

SELECT 
    ROUND(SUM([Total Including Tax]) / 
          COUNT(DISTINCT [WWI Invoice ID]),2) as Average_Order_Value
FROM Fact.Sale;


/*-------------------------------------------------------------
 Revenue Trend
---------------------------------------------------------------*/

WITH Revenue_Growth as (
        SELECT 
        SUM(FS.[Total Including Tax]) as Total_Revenue,
        DD.[Calendar Year] AS Year,
        DD.[Calendar Month Number] as Month_Number
    FROM Fact.Sale as FS
    INNER JOIN Dimension.Date as DD
        ON FS.[Delivery Date Key] = DD.Date
    GROUP BY DD.[Calendar Year], DD.[Calendar Month Number])
SELECT 
    YEAR,
    Month_Number,
    Total_Revenue,
    SUM(Total_Revenue) OVER(
        PARTITION BY YEAR 
        ORDER BY Month_Number) AS Running_Total
FROM Revenue_Growth
ORDER BY 1

/*-------------------------------------------------------------
Top Customers  
---------------------------------------------------------------*/

SELECT TOP 10
    C.Customer,
    SUM(S.[Total Including Tax]) AS Revenue
FROM Fact.Sale S
INNER JOIN Dimension.Customer AS C
    ON S.[Customer Key] = C.[Customer Key]
GROUP BY C.Customer
ORDER BY Revenue DESC;

/*-------------------------------------------------------------
Top Products 
---------------------------------------------------------------*/

SELECT TOP 10
    I.[Stock Item],
    SUM(S.[Total Including Tax]) AS Revenue
FROM Fact.Sale S
INNER JOIN Dimension.[Stock Item] AS I
    ON S.[Stock Item Key] = I.[Stock Item Key]
GROUP BY I.[Stock Item]
ORDER BY Revenue DESC;

/*-------------------------------------------------------------
Revenue by City
---------------------------------------------------------------*/

SELECT
    C.[City],
    SUM(S.[Total Including Tax]) AS Revenue
FROM Fact.Sale S
INNER JOIN Dimension.[City] AS C
    ON S.[City Key] = C.[City Key]
GROUP BY C.[City]
ORDER BY Revenue DESC;





