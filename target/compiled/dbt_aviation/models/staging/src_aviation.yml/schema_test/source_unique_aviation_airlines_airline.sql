
    
    



select count(*) as validation_errors
from (

    select
        airline

    from "datadazed"."aviation"."airlines"
    where airline is not null
    group by airline
    having count(*) > 1

) validation_errors


