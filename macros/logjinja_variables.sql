 {% macro logging_jinja() %}
     {% set name='preethi' %}
    {{ log('my name is' ~name ,info=true )}}
 {% endmacro %}