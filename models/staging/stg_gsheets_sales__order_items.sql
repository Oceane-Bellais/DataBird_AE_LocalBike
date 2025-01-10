SELECT
    CONCAT(order_id,"_", item_id) AS order_item_id, -- Creation of the primary key
    order_id, 
    item_id, 
    product_id,
    quantity AS item_quantity,
    list_price AS item_price,
    discount,
    quantity * (list_price * (1 - discount)) AS total_order_item_amount
FROM {{ source('gsheets_sales', 'order_items') }}
