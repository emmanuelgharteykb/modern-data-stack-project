/* This is a Staging Model. 
   Goal: Clean the raw data, cast types correctly, and fix Date formatting.
*/

WITH raw_data AS (
    SELECT * FROM {{ ref('raw_sales') }}
)

SELECT
    InvoiceNo AS invoice_id,
    StockCode AS product_id,
    Description AS product_name,
    CAST(Quantity AS INTEGER) AS quantity,
    -- Using strptime to handle the "MM/DD/YYYY HH:MM" slash format
    strptime(InvoiceDate, '%m/%d/%Y %H:%M') AS sales_at,
    CAST(UnitPrice AS DECIMAL(10,2)) AS unit_price,
    CustomerID AS customer_id,
    Country AS country
FROM raw_data
WHERE quantity > 0 AND customer_id IS NOT NULL