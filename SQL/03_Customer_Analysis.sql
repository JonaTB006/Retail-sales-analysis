use WideWorldImportersDW;

/*============================================================
  CUSTOMER ANALYSIS

  Business Questions:

  1. Who are the top customers by revenue?
  2. What percentage of total revenue comes from top customers?
  3. How is revenue distributed among customer categories?
  4. Is there evidence of a Pareto (80/20) effect?

============================================================*/

/*------------------------------------------------------------
1.Who are the company's top customers?
------------------------------------------------------------*/

SELECT 
	TOP 10 C.Customer AS Customer,
	SUM([Total Including Tax]) as Total_Revenue,
	COUNT(DISTINCT S.[WWI Invoice ID]) AS Orders,
		ROUND(SUM([Total Including Tax]) /
		COUNT(DISTINCT S.[WWI Invoice ID]),
		2
		) AS Avg_Order_Value
FROM Fact.Sale AS S
INNER JOIN Dimension.Customer AS C
	ON S.[Customer Key] = C.[Customer Key]
GROUP BY C.Customer
ORDER BY Total_Revenue DESC;

/*------------------------------------------------------------
2.What percentage of total revenue do they generate?
------------------------------------------------------------*/

WITH TOP_CUSTOMER AS (
	SELECT 
		C.Customer AS Customer,
		SUM([Total Including Tax]) as Total_Revenue,
		COUNT(DISTINCT S.[WWI Invoice ID]) AS Orders
	FROM Fact.Sale AS S
	INNER JOIN Dimension.Customer AS C
		ON S.[Customer Key] = C.[Customer Key]
	GROUP BY C.Customer)
SELECT TOP 10 Customer,
	Total_Revenue,
	Orders,
	(Total_Revenue / SUM(Total_Revenue) OVER()) * 100 AS Porcentage,
	ROUND((Total_Revenue * 100.0) /
		SUM(Total_Revenue) OVER(),2) AS Revenue_Percentage,
	SUM((Total_Revenue * 100.0) /SUM(Total_Revenue) OVER()) 
		OVER(ORDER BY Total_Revenue DESC) AS Cumulative_Percentage
FROM TOP_CUSTOMER
ORDER BY 2 DESC;