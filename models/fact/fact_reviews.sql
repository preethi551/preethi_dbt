{{
    config(
        materialized='incremental',
        on_schema_change='fail'

    )
}}
with src_reviews As(
    select * from {{ ref('src_reviews') }}
)
select
{{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name','review_text']) }} as supported,
* 
from 

src_reviews where review_text is not null 
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
   AND   review_date > (select max(review_date) from {{ this }}) 
{% endif %}

