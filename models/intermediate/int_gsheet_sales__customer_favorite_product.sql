WITH customer_favorite_product 
AS (
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
    )
SELECT
    cp.customer_id,
    cp.favorite_product_id,
    p.product_name AS favorite_product_name
FROM customer_favorite_product cp
LEFT JOIN {{ ref('stg_gsheets_sales__products') }} p
    ON cp.favorite_product_id = p.product_id

