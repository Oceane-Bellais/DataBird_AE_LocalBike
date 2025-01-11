SELECT 
    store_id,
    store_name,
    store_city,
    store_state,
    total_orders,
    total_revenue,
    avg_order_value,
    unique_customers,
    unique_products_sold,
    last_order_date,
    first_order_date,
    store_lifetime_days,
    total_staff
FROM {{ ref('int_gsheet_sales__stores_performance') }}
