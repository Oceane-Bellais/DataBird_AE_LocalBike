SELECT 
    c.customer_id,
    CONCAT(c.customer_first_name, ' ', c.customer_last_name) AS customer_name,
    c.customer_email,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.total_order_item_amount),2) AS total_spent,
    MAX(o.order_date) AS last_order_date,
    MIN(o.order_date) AS first_order_date,
    DATE_DIFF(MAX(o.order_date), MIN(o.order_date), DAY) AS customer_lifetime_days,
    ROUND(AVG(oi.total_order_item_amount),2) AS avg_order_value,
    COUNT(DISTINCT p.product_id) AS unique_products_purchased,
    COUNT(DISTINCT s.store_id) AS stores_visited
FROM {{ ref('stg_gsheets_sales__customers') }} c
LEFT JOIN {{ ref('stg_gsheets_sales__orders') }} o  
    ON c.customer_id = o.customer_id
LEFT JOIN {{ ref('stg_gsheets_sales__order_items') }} oi  
    ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_gsheets_sales__products') }} p 
    ON oi.product_id = p.product_id
LEFT JOIN {{ ref('stg_gsheets_sales__stores') }} s 
    ON o.store_id = s.store_id
GROUP BY 
    c.customer_id, c.customer_first_name, c.customer_last_name, c.customer_email
