SELECT
    CONCAT(staff_first_name, " ", staff_last_name),
    staff_email
FROM {{ ref('stg_gsheets_sales__staffs') }}
WHERE staff_email NOT LIKE '%@bikes.shop%'
