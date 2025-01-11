SELECT
    customer_id,
    COUNT(DISTINCT order_id) as total_orders
FROM {{ ref('stg_gsheets_sales__orders') }}
GROUP BY customer_id
HAVING total_orders <= 0