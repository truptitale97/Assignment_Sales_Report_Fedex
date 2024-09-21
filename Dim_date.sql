CREATE OR REPLACE TABLE `amazon-service-436209.Amazon_sales.t_Dim_date` AS
SELECT DISTINCT 
  Date
FROM
   amazon-service-436209.Amazon_sales.sales
