with raw_listings as(
    select 
    * from 
    airbnb.raw.raw_listings

)
select 
ID as listing_id, LISTING_URL, NAME as listing_name, ROOM_TYPE, MINIMUM_NIGHTS, HOST_ID, PRICE as listing_price, CREATED_AT, UPDATED_AT
from raw_listings
