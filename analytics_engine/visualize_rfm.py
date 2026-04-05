import duckdb
import plotly.express as px

# 1. Connect to your dbt database
con = duckdb.connect('dev.duckdb')

# 2. Query your Top 10 Customers from the Gold Layer
df = con.execute("""
    SELECT 
        CAST(customer_id AS VARCHAR) as customer_id, 
        total_spent 
    FROM fct_customer_rfm 
    ORDER BY total_spent DESC 
    LIMIT 10
""").df()

# 3. Create a beautiful Bar Chart
fig = px.bar(
    df, 
    x='customer_id', 
    y='total_spent',
    title='Top 10 Customers by Total Spend (Gold Layer)',
    labels={'customer_id': 'Customer ID', 'total_spent': 'Total Revenue (£)'},
    color='total_spent',
    color_continuous_scale='Viridis'
)

# 4. Show the chart
fig.show()
