SELECT DISTINCT 
    product_key,
    COALESCE(SKU, 'N/A') AS sku,
    LOWER(TRIM(COALESCE(Style, 'Not Specified'))) AS style,
    LOWER(TRIM(COALESCE(Category, 'Not Specified'))) AS category,
    LOWER(TRIM(COALESCE(Size, 'N/A'))) AS size,
    COALESCE(ASIN, 'Unknown') AS asin
FROM `amazon-service-436209.Amazon_sales.t_Dim_product`
