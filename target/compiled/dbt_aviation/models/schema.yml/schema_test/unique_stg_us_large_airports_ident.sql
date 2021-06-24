
    
    



select count(*) as validation_errors
from (

    select
        ident

    from "datadazed"."aviation"."stg_us_large_airports"
    where ident is not null
    group by ident
    having count(*) > 1

) validation_errors


