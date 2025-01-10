SELECT
    staff_id, 
    first_name AS staff_first_name,
    last_name AS staff_last_name,
    email AS staff_email,
    phone AS staff_phone,
    CASE WHEN active = 1 
        THEN true ELSE false 
        END AS staff_is_active,
    store_id,
    CASE WHEN manager_id = 'NULL' 
        THEN null ELSE manager_id 
        END AS manager_id
FROM {{ source('gsheets_sales', 'staffs') }}
