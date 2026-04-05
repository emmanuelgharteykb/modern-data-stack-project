select
    InvoiceNo as invoice_id,
    StockCode as product_id,
    Description as description,
    cast(Quantity as integer) as quantity,
    cast(InvoiceDate as timestamp) as invoice_date,
    cast(UnitPrice as float) as unit_price,
    CustomerID as customer_id,
    Country as country,
    (quantity * unit_price) as total_revenue
from {{ ref('raw_retail_data') }}
where customer_id is not null
  and quantity > 0
  and unit_price > 0
