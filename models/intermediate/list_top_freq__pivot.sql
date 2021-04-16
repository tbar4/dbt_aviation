
{%- set freq_types = get_freq_types() -%}

select
af.airport_ident,
{%- for freq_type in freq_types %}
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = '{{freq_type}}'
  then frequency_mhz
  end) as {{freq_type}}_freq
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ source('aviation', 'airport_frequencies') }} af

INNER JOIN {{ ref('stg_us_large_airports') }} sula
  ON af.airport_ident = sula.ident

GROUP BY 1
