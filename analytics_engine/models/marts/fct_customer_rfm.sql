WITH customer_data AS (
    SELECT * FROM {{ ref('stg_sales') }}
),

customer_summary AS (
    SELECT
        customer_id,
        MAX(sales_at) as last_order_date,
        COUNT(DISTINCT invoice_id) as frequency,
        SUM(quantity * unit_price) as monetary_value
    FROM customer_data
    GROUP BY 1
)

SELECT
    customer_id,
    last_order_date,
    frequency,
    ROUND(monetary_value, 2) as total_spent,
    -- Simple ranking: 1 is the best
    RANK() OVER (ORDER BY monetary_value DESC) as spend_rank
FROM customer_summary
