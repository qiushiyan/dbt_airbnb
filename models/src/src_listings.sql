WITH raw_listings AS (
    SELECT
        *
    FROM
        {{ source(
            "airbnb",
            "listings"
        ) }}
)
SELECT
    id AS listing_id,
    NAME AS listing_name,
    listing_url,
    room_type AS listing_room_type,
    minimum_nights AS listing_minimum_nights,
    host_id,
    price AS listing_price_str,
    created_at,
    updated_at
FROM
    raw_listings
