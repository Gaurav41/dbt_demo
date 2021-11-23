{% macro cent_to_dollar(col_name,decimal_places=2) %}
-- {{col_name}}/100
round(1.0*{{col_name}}/100,{{decimal_places}})
{%endmacro %}