SELECT 
    c.customer_id,
    c.customer_name,
    c.customer_email,
    c.total_orders,
    c.total_spent,
    c.last_order_date,
    c.first_order_date,
    c.customer_lifetime_days,
    c.avg_order_value,
    c.unique_products_purchased,
    c.stores_visited,
    cf.favorite_product_id,
    cf.favorite_product_name
FROM {{ ref('int_gsheet_sales__customers_performance') }} c
LEFT JOIN {{ ref('int_gsheet_sales__customer_favorite_product') }} cf
    ON c.customer_id = cf.customer_id


