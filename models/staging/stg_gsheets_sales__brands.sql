SELECT
    brand_id,
    brand_name
FROM {{ source('gsheets_sales', 'brands') }}