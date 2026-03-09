


SELECT 
    
        silver_bookings.BOOKING_ID, silver_bookings.LISTING_ID, silver_bookings.BOOKING_DATE, silver_bookings.TOTAL_AMOUNT, silver_bookings.SERVICE_FEE, silver_bookings.CLEANING_FEE, silver_bookings.BOOKING_STATUS, silver_bookings.CREATED_AT,
    
        silver_listings.HOST_ID, silver_listings.PROPERTY_TYPE, silver_listings.CITY, silver_listings.COUNTRY, silver_listings.ACCOMMODATES, silver_listings.BEDROOMS, silver_listings.BATHROOMS, silver_listings.PRICE_PER_NIGHT, silver_listings.PRICE_PER_NIGHT_TAG, silver_listings.CREATED_AT AS LISTING_CREATED_AT,
    
        silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE, silver_hosts.RESPONSE_RATE_QUALITY, silver_hosts.CREATED_AT AS HOST_CREATED_AT
    
FROM
    
    
        AIRBNB.silver.silver_BOOKINGS AS silver_bookings
    
    
    
        LEFT JOIN AIRBNB.silver.silver_LISTINGS AS silver_listings ON silver_bookings.LISTING_ID = silver_listings.LISTING_ID
    
    
    
        LEFT JOIN AIRBNB.silver.silver_HOSTS AS silver_hosts ON silver_listings.HOST_ID = silver_hosts.HOST_ID
    
    