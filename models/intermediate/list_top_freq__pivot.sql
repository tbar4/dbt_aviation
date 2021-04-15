
{%- set freq_types = get_freq_types() -%}

select
airport_ident,
{%- for freq_type in freq_types %}
case when type = '{{freq_type}}' then frequency_mhz end as {{freq_type}}_amount
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{ source('aviation', 'airport_frequencies') }}
group by 1
