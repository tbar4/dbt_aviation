{% macro get_freq_types() %}

{% set freq_type_query %}
select distinct
UPPER(type)
from {{ source('aviation', 'airport_frequencies') }}

group by type

having COUNT(*) > 1000

order by COUNT(*) DESC
{% endset %}

{% set results = run_query(freq_type_query) %}

{{ log(results, info=True) }}

{{ return([]) }}

{% endmacro %}
