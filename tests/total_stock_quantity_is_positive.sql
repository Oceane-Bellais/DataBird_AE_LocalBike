SELECT
    store_id,
    product_id,
    SUM(stock_quantity) as total_quantity
FROM {{ ref('stg_gsheets_sales__stocks') }}
GROUP BY 
    store_id, product_id
HAVING total_quantity < 0