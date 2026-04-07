{{
    config(
        materialized='table'
    )
}}
with fact_reviews as (
    Select * from {{ ref('fact_reviews') }}
),
see_moon as (
    select * from {{ ref('seed_full_moon_dates') }}
)

SELECT
  r.*,
  CASE
    WHEN fm.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
  END AS is_full_moon
FROM
  fact_reviews
  r
  LEFT JOIN see_moon
  fm
  ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))
