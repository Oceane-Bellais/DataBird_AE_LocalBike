SELECT 
    s.store_id,
    s.store_name,
    s.store_city,
    s.store_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.total_order_item_amount) AS total_revenue,
    AVG(oi.total_order_item_amount) AS avg_order_value,
    COUNT(DISTINCT c.customer_id) AS unique_customers,
    COUNT(DISTINCT p.product_id) AS unique_products_sold,
    MAX(o.order_date) AS last_order_date,
    MIN(o.order_date) AS first_order_date,
    DATE_DIFF(MAX(o.order_date), MIN(o.order_date), DAY) AS store_lifetime_days,
    COUNT(DISTINCT st.staff_id) AS total_staff
FROM {{ ref('stg_gsheets_sales__stores') }} s
LEFT JOIN {{ ref('stg_gsheets_sales__orders') }} o 
    ON s.store_id = o.store_id
LEFT JOIN {{ ref('stg_gsheets_sales__order_items') }} oi 
    ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_gsheets_sales__customers') }} c 
    ON o.customer_id = c.customer_id
LEFT JOIN {{ ref('stg_gsheets_sales__products') }} p 
    ON oi.product_id = p.product_id
LEFT JOIN {{ ref('stg_gsheets_sales__staffs') }} st 
    ON s.store_id = st.store_id
GROUP BY 
    s.store_id, s.store_name, s.store_city, s.store_state
