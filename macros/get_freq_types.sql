{% macro get_freq_types() %}

{% set freq_type_query %}
select distinct
type
from {{ source('aviation', 'airport_frequencies') }}
group by 1

{% endset %}

{% set results = run_query(freq_type_query) %}

{% if execute %}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ log(results, info=True) }}

{{ return([]) }}

{% endmacro %}
