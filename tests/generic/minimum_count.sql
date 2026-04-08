{% test minimum_count(model,minimum_count_row) %}
    select count(*) as row_Count 
    from {{model}} having count(*)< {{minimum_count_row}} 
{% endtest %}