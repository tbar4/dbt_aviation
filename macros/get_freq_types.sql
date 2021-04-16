{% macro get_freq_types() %}

{% set freq_type_query %}
select
UPPER(REGEXP_REPLACE(type, '/', '_')) as type
from {{ source('aviation', 'airport_frequencies') }}
where substring(airport_ident, 1, 1) = 'K'
group by 1
having COUNT(*) > 100
order by 1
{% endset %}

{% set results = run_query(freq_type_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}
