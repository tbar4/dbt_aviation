
    
    



select count(*) as validation_errors
from (

    select
        airport_ident

    from "datadazed"."aviation"."list_top_freq__pivot"
    where airport_ident is not null
    group by airport_ident
    having count(*) > 1

) validation_errors


