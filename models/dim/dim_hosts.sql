WITH manish AS (
    SELECT
        *
    FROM
        {{ ref('src_hosts') }}
)
select 
 host_id,
    is_superhost,
    created_at,
    updated_at ,
    nvl(host_name,'Anonymous') as host_name1
    from manish