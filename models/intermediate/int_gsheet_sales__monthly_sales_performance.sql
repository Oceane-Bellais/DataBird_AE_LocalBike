SELECT 
    s.store_id,
    s.store_name,
    c.category_name,
    p.product_name,
    DATE_TRUNC(o.order_date, MONTH) AS sales_month,
    ROUND(SUM(oi.total_order_item_amount),2) AS total_sales,
    SUM(oi.item_quantity) AS total_units_sold,
    AVG(oi.item_price) AS avg_price_per_unit,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM {{ ref('stg_gsheets_sales__order_items') }} oi
JOIN {{ ref('stg_gsheets_sales__products') }} p 
    ON oi.product_id = p.product_id
JOIN {{ ref('stg_gsheets_sales__categories') }} c 
    ON p.category_id = c.category_id
JOIN {{ ref('stg_gsheets_sales__orders') }} o 
    ON oi.order_id = o.order_id
JOIN {{ ref('stg_gsheets_sales__stores') }} s 
    ON o.store_id = s.store_id
GROUP BY 
    s.store_id, s.store_name, c.category_name, p.product_name, DATE_TRUNC(o.order_date, MONTH)
