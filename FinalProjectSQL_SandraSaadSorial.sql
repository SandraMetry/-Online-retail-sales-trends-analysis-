--Q1.FROM SalesData: Identify total number of invoices,Unique Customers,Product Categories
--Answer:307 Invoices,92 Unique_Customers,7 Product_Categories
SELECT
       COUNT(DISTINCT ORDERNUMBER) AS Total_Invoices,
       COUNT(DISTINCT customername) AS Unique_Customers,
       COUNT(DISTINCT productline) as Product_Categories
from SalesData

--Q2. Calculate Basic Summary Statistics for Key Metrics: Total Sales Amount, Average order Value, Most Frequently Purshased Items
--Answer:10.03 M,Average_Order_Value:3.55K,Most_Frequently_Purchased_Items:7
SELECT SUM(SALES) AS Total_Sales,
       AVG(SALES) as Average_Order_Value,
       COUNT(DISTINCT productline) AS Most_Frequently_Purchased_Items
       from SalesData
      
 --Most Frequently Purchased Productlines.      
SELECT productline,
COUNT(productline) AS purchase_Count, 
       SUM(quantityordered) AS total_quantity
       FROM SalesData
       group by 1
       order by purchase_Count DESC,total_quantity DESC
       

       
Q3.Explore purchase patterns by country or any other relevant demographic information (if available).
--This query will show the purchase patterns by product line for each territory,country,City,State.

SELECT territory,country,city,state,productline,
count(productline)AS Purchase_Count,
sum(quantityordered) AS Total_Quantity
FROM SalesData
GROUP BY 1,4
Order by 1,5 DESC,6 DESC

--Total Orders,Total_Quantity according to demographic information
SELECT territory,country,city,state, COUNT(ordernumber) AS Total_orders, SUM(quantityordered) AS Total_Quantity
FROM SalesData
GROUP BY 1
ORDER BY 4 DESC, 5  DESC


   




