SELECT 
    store_id,
    store_name,
    category_name,
    product_name,
    sales_month,
    total_sales,
    total_units_sold,
    avg_price_per_unit,
    total_orders,
    unique_customers
FROM {{ ref('int_gsheet_sales__monthly_sales_performance') }}

