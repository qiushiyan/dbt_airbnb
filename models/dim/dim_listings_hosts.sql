WITH l AS (
    SELECT
        *
    FROM
        {{ ref('dim_listings_clean') }}
),
h AS (
    SELECT
        *
    FROM
        {{ ref('dim_hosts_clean') }}
),
FINAL AS (
    SELECT
        l.listing_id,
        l.listing_name,
        l.listing_room_type,
        l.listing_minimum_nights,
        l.listing_price,
        l.host_id,
        h.host_name,
        h.host_is_superhost,
        l.created_at,
        GREATEST(
            l.updated_at,
            h.updated_at
        ) AS updated_at
    FROM
        l
        LEFT JOIN h
        ON (
            h.host_id = l.host_id
        )
)
SELECT
    *
FROM
    FINAL
