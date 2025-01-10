SELECT 
    customer_id, 
    first_name AS customer_first_name,
    last_name AS customer_last_name,
    CASE WHEN phone = 'NULL'
        THEN null ELSE phone 
        END AS customer_phone,
    email AS customer_email, 
    street AS customer_street,
    city AS customer_city,
    state AS customer_state
FROM {{ source('gsheets_sales', 'customers') }}
