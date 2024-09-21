SELECT DISTINCT 
    ship_key,  -- Unique key for shipping info
    LOWER(TRIM(`ship-city`)) AS ship_city,
    LOWER(TRIM(`ship-state`)) AS ship_state,
    `ship-postal-code` AS ship_postal_code,
    UPPER(TRIM(`ship-country`)) AS ship_country,
    LOWER(TRIM(`ship-service-level`)) AS ship_service_level
FROM `amazon-service-436209.Amazon_sales.t_Dim_ship`