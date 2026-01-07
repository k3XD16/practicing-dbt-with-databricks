{% set incr_flag = 1%}
{% set last_load = 3%}

{% set col_list = ["sales_id", "date_sk", "quantity", "unit_price", "gross_amount", "payment_method"]%}

SELECT
    {% for columns in col_list%}
    {{columns}}{% if not loop.last%},{% endif%}
    {% endfor %}
FROM 
    {{ ref('bronze_sales') }}

{% if incr_flag == 1 %}

    WHERE date_sk > {{last_load}}

{% endif %}
