{{ config(
    materialized = 'incremental'
) }}

WITH src_reivews AS (

    SELECT
        *
    FROM
        {{ ref(
            "src_reviews"
        ) }}
)
SELECT
    {{ dbt_utils.surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} AS review_id,*
FROM
    src_reivews
WHERE
    review_text IS NOT NULL

{% if is_incremental() %}
-- this filter will only be applied on an incremental run
AND review_date > (
    SELECT
        MAX(review_date)
    FROM
        {{ this }}
)
{% endif %}
