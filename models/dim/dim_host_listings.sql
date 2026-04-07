{{
    config(
        materialized='table'
    )
}}
with host as(
    select * from {{ ref('dim_hosts') }}
), 
 listings as(
    select * from {{ ref('dim_listings') }}
)
SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name1,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM listings  l
LEFT JOIN host h ON (h.host_id = l.host_id)
 



