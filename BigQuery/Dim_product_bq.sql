CREATE OR REPLACE TABLE `amazon-service-436209.Amazon_sales.t_Dim_product` AS
SELECT 
    FARM_FINGERPRINT(CONCAT(SKU, Style, Category, Size, ASIN)) AS product_key,  -- Generates consistent unique key
    SKU,
    Style,
    Category,
    Size,
    ASIN
FROM
    `amazon-service-436209.Amazon_sales.sales`;
