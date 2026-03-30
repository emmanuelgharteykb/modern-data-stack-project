WITH raw_data AS (
    SELECT * FROM {{ ref('online_retail') }}
)

SELECT
    InvoiceNo AS invoice_id,
    StockCode AS product_id,
    Description AS product_description,
    CAST(Quantity AS INTEGER) AS quantity,
    CAST(InvoiceDate AS TIMESTAMP) AS invoice_date,
    CAST(UnitPrice AS DECIMAL(10,2)) AS unit_price,
    CAST(CustomerID AS INTEGER) AS customer_id,
    Country AS country
FROM raw_data
WHERE customer_id IS NOT NULL 
  AND quantity > 0
