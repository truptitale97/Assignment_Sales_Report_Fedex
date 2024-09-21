CREATE OR REPLACE TABLE `amazon-service-436209.Amazon_sales.t_fact_orders` AS
WITH product_dim AS (
   SELECT DISTINCT
    FARM_FINGERPRINT(CONCAT(SKU, Style, Category, Size, ASIN)) AS product_key,  -- Generates consistent unique key
    SKU,
    Style,
    Category,
    Size,
    ASIN
FROM
    `amazon-service-436209.Amazon_sales.sales`
),
ship_dim AS (
    SELECT DISTINCT
        `ship-city`, 
        `ship-state`, 
        `ship-postal-code`,
        `ship-country`, 
        `ship-service-level`, 
        FARM_FINGERPRINT(CONCAT(`ship-city`, `ship-state`, `ship-postal-code`, `ship-country`, `ship-service-level`)) AS ship_key
    FROM `amazon-service-436209.Amazon_sales.t_Dim_ship`
)
SELECT DISTINCT 
     `Order ID`,
    Qty,
    Amount,
    Currency,
    Fulfilment,
    `Courier Status`,
    `Promotion-ids`,
    B2B,
    `Fulfilled-by`,
    date,
    product_dim.product_key,  -- Store product_key instead of product-related columns
    ship_dim.ship_key,
    ship_dim.`ship-city`
    `Sales Channel`, 
FROM
    `amazon-service-436209.Amazon_sales.sales` AS sales
JOIN
    product_dim ON sales.sku = product_dim.SKU
JOIN
    ship_dim ON sales.`ship-city` = ship_dim.`ship-city`
    AND sales.`ship-state` = ship_dim.`ship-state`
    AND sales.`ship-postal-code` = ship_dim.`ship-postal-code`
    AND sales.`ship-country` = ship_dim.`ship-country`
    AND sales.`ship-service-level` = ship_dim.`ship-service-level`;
