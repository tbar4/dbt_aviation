
  create view "datadazed"."aviation"."stg_us_large_airports__dbt_tmp" as (
    WITH large_us_airports AS (
	SELECT
	*
	FROM "datadazed"."aviation"."airports"

	WHERE SUBSTRING(ident, 1, 1) = 'K'
        AND type = 'large_airport'
	)
SELECT * FROM large_us_airports
  );
