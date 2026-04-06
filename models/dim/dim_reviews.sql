with  preethi1 as (
    select 
    * 
    from 
    {{ ref('src_reviews') }}
)
select * from preethi1
