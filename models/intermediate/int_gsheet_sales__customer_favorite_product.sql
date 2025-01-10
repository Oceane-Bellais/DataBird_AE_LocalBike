SELECT
    o.customer_id,
    oi.product_id AS favorite_product_id
FROM {{ ref('stg_gsheets_sales__order_items') }} oi
LEFT JOIN {{ ref('stg_gsheets_sales__orders') }} o
    ON oi.order_id = o.order_id
GROUP BY
    o.customer_id, oi.product_id
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY o.customer_id
        ORDER BY SUM(oi.item_quantity) DESC
        ) = 1