select
af.airport_ident,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'A_D'
  then frequency_mhz
  end) as A_D_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'APP'
  then frequency_mhz
  end) as APP_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'ASOS'
  then frequency_mhz
  end) as ASOS_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'ATIS'
  then frequency_mhz
  end) as ATIS_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'AWOS'
  then frequency_mhz
  end) as AWOS_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'CLD'
  then frequency_mhz
  end) as CLD_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'CNTR'
  then frequency_mhz
  end) as CNTR_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'CTAF'
  then frequency_mhz
  end) as CTAF_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'DEP'
  then frequency_mhz
  end) as DEP_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'GND'
  then frequency_mhz
  end) as GND_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'MISC'
  then frequency_mhz
  end) as MISC_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'OPS'
  then frequency_mhz
  end) as OPS_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'PMSV'
  then frequency_mhz
  end) as PMSV_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'RDO'
  then frequency_mhz
  end) as RDO_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'TWR'
  then frequency_mhz
  end) as TWR_freq,
MAX(
  case when UPPER(REGEXP_REPLACE(af.type, '/', '_')) = 'UNIC'
  then frequency_mhz
  end) as UNIC_freq
from "datadazed"."aviation"."airport_frequencies" af

INNER JOIN "datadazed"."aviation"."stg_us_large_airports" sula
  ON af.airport_ident = sula.ident

GROUP BY 1