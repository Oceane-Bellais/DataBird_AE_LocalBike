WITH products_aggreation AS 
    (
        SELECT 
        p.product_id,
        p.product_name,
        DATE_TRUNC(o.order_date, MONTH) AS sales_month,
        ROUND(SUM(oi.total_order_item_amount),2) AS total_sales,
        ROUND(SUM(oi.item_quantity),0) AS total_units_sold,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM {{ ref('stg_gsheets_sales__order_items') }} oi
    LEFT JOIN {{ ref('stg_gsheets_sales__products') }} p
        ON oi.product_id = p.product_id
    LEFT JOIN {{ ref('stg_gsheets_sales__orders') }} o
        ON oi.order_id = o.order_id
    GROUP BY
        p.product_id, p.product_name, DATE_TRUNC(o.order_date, MONTH)
    )
SELECT 
    pa.product_id,
    pa.product_name,
    b.brand_name,
    p.model_year,
    p.product_price,
    c.category_name,
    pa.sales_month,
    pa.total_sales,
    pa.total_units_sold,
    pa.total_orders
FROM products_aggreation pa
LEFT JOIN {{ ref('stg_gsheets_sales__products') }} p
    ON pa.product_id = p.product_id
LEFT JOIN {{ ref('stg_gsheets_sales__categories') }} c
    ON p.category_id = c.category_id
LEFT JOIN {{ ref('stg_gsheets_sales__brands') }} b
    ON p.brand_id = b.brand_id