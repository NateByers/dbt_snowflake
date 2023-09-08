select 
    id,
    count(*) as "count"
from {{ ref('my_second_dbt_model') }}
group by id