CREATE OR REPLACE TABLE `amazon-service-436209.Amazon_sales.t_Dim_ship` AS
SELECT DISTINCT 
    FARM_FINGERPRINT(CONCAT(`ship-city`, `ship-state`, `ship-postal-code`, `ship-country`, `ship-service-level`)) AS ship_key,  -- Unique fingerprint key
    `ship-city`,
    `ship-state`,
    `ship-postal-code`,
    `ship-country`,
    `ship-service-level`
FROM
    `amazon-service-436209.Amazon_sales.sales`;
