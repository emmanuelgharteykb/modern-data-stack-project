select 
    invoice_id,
    invoice_date,
    customer_id,
    country,
    sum(quantity) as total_items,
    sum(total_revenue) as total_invoice_value
from {{ ref('stg_retail_data') }}
group by 1, 2, 3, 4
