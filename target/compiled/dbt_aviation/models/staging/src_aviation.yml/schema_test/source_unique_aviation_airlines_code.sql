
    
    



select count(*) as validation_errors
from (

    select
        code

    from "datadazed"."aviation"."airlines"
    where code is not null
    group by code
    having count(*) > 1

) validation_errors


