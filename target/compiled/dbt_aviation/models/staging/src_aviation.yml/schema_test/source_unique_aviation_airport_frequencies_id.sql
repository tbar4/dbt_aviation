
    
    



select count(*) as validation_errors
from (

    select
        id

    from "datadazed"."aviation"."airport_frequencies"
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


