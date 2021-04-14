WITH large_us_airports AS (
	SELECT
	*
	FROM {{ source('aviation', 'airports') }}

	WHERE SUBSTRING(ident, 1, 1) = 'K'
        AND type = 'large_airport'
	)
SELECT * FROM large_us_airports
