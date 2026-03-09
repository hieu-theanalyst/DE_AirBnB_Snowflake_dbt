{% set configs = [
    {
        "table" : "AIRBNB.silver.silver_BOOKINGS",
        "column" : "silver_bookings.BOOKING_ID, silver_bookings.LISTING_ID, silver_bookings.BOOKING_DATE, silver_bookings.TOTAL_AMOUNT, silver_bookings.SERVICE_FEE, silver_bookings.CLEANING_FEE, silver_bookings.BOOKING_STATUS, silver_bookings.CREATED_AT",
        "alias" : "silver_bookings",
    },
    {
        "table" : "AIRBNB.silver.silver_LISTINGS",
        "column" : "silver_listings.HOST_ID, silver_listings.PROPERTY_TYPE, silver_listings.CITY, silver_listings.COUNTRY, silver_listings.ACCOMMODATES, silver_listings.BEDROOMS, silver_listings.BATHROOMS, silver_listings.PRICE_PER_NIGHT, silver_listings.PRICE_PER_NIGHT_TAG, silver_listings.CREATED_AT AS LISTING_CREATED_AT",
        "alias" : "silver_listings",
        "join_condition" : "silver_bookings.LISTING_ID = silver_listings.LISTING_ID"
    },
    {
        "table" : "AIRBNB.silver.silver_HOSTS",
        "column" : "silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE, silver_hosts.RESPONSE_RATE_QUALITY, silver_hosts.CREATED_AT AS HOST_CREATED_AT",
        "alias" : "silver_hosts",
        "join_condition" : "silver_listings.HOST_ID = silver_hosts.HOST_ID"
    }
]%}


SELECT 
    {% for config in configs %}
        {{ config['column'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for config in configs %}
    {% if loop.first %}
        {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }} ON {{ config['join_condition'] }}
    {% endif %}
    {% endfor %}