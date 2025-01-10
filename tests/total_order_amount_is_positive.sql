SELECT
    order_id,
    SUM(total_order_item_amount) as total_amount
FROM {{ ref('stg_gsheets_sales__order_items') }}
GROUP BY order_id
HAVING total_amount < 0