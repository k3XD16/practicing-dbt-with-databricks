WITH b_sales AS
(
    SELECT 
        sales_id,
        product_sk,
        customer_sk,
        gross_amount,
        quantity,
        unit_price,
        {{ multiply('quantity','unit_price')}} AS calc_gross_amount,
        payment_method
    FROM {{ ref('bronze_sales') }}
),
b_product AS
(
    SELECT
        product_sk,
        category
    FROM {{ ref('bronze_product') }} 
),
b_customer AS
(
    SELECT
        customer_sk,
        gender
    FROM {{ ref('bronze_customer') }}
),
joined_query AS
(
SELECT
    s.sales_id,
    s.gross_amount,
    s.quantity,
    s.unit_price,
    s.calc_gross_amount,
    s.payment_method,
    p.category,
    c.gender
FROM 
    b_sales s
JOIN
    b_product p ON s.product_sk = p.product_sk
JOIN
    b_customer c ON s.customer_sk = c.customer_sk
)
SELECT 
    category,
    gender,
    SUM(gross_amount) AS total_gross_amount
FROM
    joined_query
GROUP BY
    category,
    gender
ORDER BY
    total_gross_amount DESC