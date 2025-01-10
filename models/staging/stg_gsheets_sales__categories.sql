SELECT 
    category_id, 
    category_name
FROM {{ source('gsheets_sales', 'categories') }}