
    
    



select count(*) as validation_errors
from (

    select
        accident_number

    from "datadazed"."aviation"."ntsb_accidents"
    where accident_number is not null
    group by accident_number
    having count(*) > 1

) validation_errors


