{{ config(
    materialized = "view"
) }}

WITH src_listings AS (

    SELECT
        *
    FROM
        {{ ref('src_listings') }}
)
SELECT
    listing_id,
    listing_name,
    listing_room_type,
    CASE
        WHEN listing_minimum_nights = 0 THEN 1
        ELSE listing_minimum_nights
    END AS listing_minimum_nights,
    host_id,
    REPLACE(
        listing_price_str,
        '$',
        ''
    ) :: NUMBER(
        10,
        2
    ) AS listing_price,
    created_at,
    updated_at
FROM
    src_listings
