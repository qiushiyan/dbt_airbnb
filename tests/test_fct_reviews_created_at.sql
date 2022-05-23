WITH listings AS (
    SELECT
        *
    FROM
        {{ ref(
            "dim_listings_clean",
        ) }}
),
reviews AS (
    SELECT
        *
    FROM
        {{ ref("fct_reviews") }}
)
SELECT
    *
FROM
    listings AS l
    INNER JOIN reviews AS r
    ON l.listing_id = r.listing_id
    AND l.created_at >= r.review_date
