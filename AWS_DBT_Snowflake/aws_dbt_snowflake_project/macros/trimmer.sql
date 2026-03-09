{% macro trimmer(column_name,node) %}
    trim({{ col_name | trim | upper }})
{% endmacro %}