SELECT 
    product_id,
    product_name,
    brand_name,
    model_year,
    product_price,
    category_name,
    sales_month,
    total_sales,
    total_units_sold,
    total_orders
FROM {{ ref('int_gsheet_sales__monthly_products_performance') }}