SELECT DISTINCT `Order ID`  AS order_id,
    CASE WHEN Qty >= 0 THEN Qty ELSE 0 END AS qty,  -- Ensure no negative quantities
    CASE WHEN Amount >= 0 THEN Amount ELSE 0.0 END AS amount,  -- Ensure no negative amounts
   CASE 
        WHEN Currency IS NULL AND LOWER(TRIM(ship_dim.`ship-country`)) = 'IN' THEN 'INR'
        ELSE LOWER(TRIM(COALESCE(Currency, 'Unknown')))
    END AS currency,  -- Handle currency logic
    LOWER(TRIM(COALESCE(Fulfilment, 'Unknown'))) AS fulfilment,
    LOWER(TRIM(`Courier Status`)) AS courier_status,
    `Promotion-ids`,
    B2B AS b2b,
    `Fulfilled-by` AS fulfilled_by,
    DATE(COALESCE(date, CURRENT_DATE())) AS order_date,
    LOWER(TRIM(`Sales Channel`)) AS sales_channel,
    product_key,  -- Use the cleaned product key from the product dimension
    ship_dim.ship_key  

FROM `amazon-service-436209.Amazon_sales.t_fact_orders`a
JOIN `amazon-service-436209.Amazon_sales.t_Dim_ship` ship_dim
ON ship_dim.ship_key=a.ship_key