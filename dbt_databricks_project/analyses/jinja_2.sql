{%- set mobiles = ["apple", "samsung", "nothing", "Google","Oneplus"] -%}


{% for i in mobiles %}
    {% if  i != "nothing" %}
        {{i}}
    {% else %}
        I hate {{ i }}
    {% endif %}
{% endfor %}

