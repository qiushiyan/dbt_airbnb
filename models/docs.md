{% docs dim_listings_clean__listing_id %}
Primary key
{% enddocs %}

{% docs dim_listings_clean__host_id %}
Foreign key referencing dim_hosts_clean (host_id)
{% enddocs %}

{% docs dim_listings_clean__minimum_nights %}
Minimum number of nights required to rent this property.
Keep in mind that old listings might have `minimum_nights` set
to 0 in the source tables. Our cleansing algorithm updates this to `1`.
{% enddocs %}

{% docs dim_hosts_clean__host_id %}
Primary key
{% enddocs %}

{% docs dim_hosts_clean__host_is_superhost %}
Boolean value showing if a host is a [superhost](https://www.airbnb.com/d/superhost)
{% enddocs %}
