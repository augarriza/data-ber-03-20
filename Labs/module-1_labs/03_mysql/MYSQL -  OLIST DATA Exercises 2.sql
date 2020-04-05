{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\partightenfactor0

\f0\fs24 \cf0 \'971. From the `marketing_qualified_leads` table, find the earliest and latest first_contact_date.\
\
SELECT \
	MAX(first_contact_date),\
    MIN(first_contact_date)\
FROM olist.marketing_qualified_leads;\
\
\'972. From the `marketing_qualified_leads` table, find the top 3 most frequent origin types for all first_contact_date entries in 2018.\
\
SELECT	\
    origin,\
    COUNT(origin) AS number_times\
FROM olist.marketing_qualified_leads\
WHERE DATE(first_contact_date) LIKE '2018%'\
GROUP BY origin\
ORDER BY number_times DESC\
LIMIT 3;\
\
\'973. From the `marketing_qualified_leads` table, find the first_contact_date with the highest number of mql_id entries and state the number of entries on that date.\
\
SELECT \
	first_contact_date,\
	COUNT(mql_id) AS mql_id_entries\
FROM olist.marketing_qualified_leads\
GROUP BY first_contact_date\
ORDER BY mql_id_entries DESC\
LIMIT 1;\
\
\'974. From the `products` table, find the name and count of the top 2 product category names.\
\
SELECT \
	product_category_name,\
    COUNT(product_category_name) AS times_per_category\
FROM olist.products\
GROUP BY product_category_name\
ORDER BY times_per_category DESC\
LIMIT 2;\
\
\'975. From the `products` table, find the product_category_name with the highest recorded product weight in grams.\
\
SELECT \
	product_category_name,\
    product_weight_g\
FROM olist.products\
ORDER BY product_weight_g DESC\
LIMIT 1;\
\
\'976. From the `products` table, find the product_category_name with the greatest sum of dimensions including length, height and width in centimeters.\
\
SELECT \
	product_category_name,\
    product_height_cm + product_length_cm + product_width_cm AS sum_dimensions\
FROM olist.products\
ORDER BY sum_dimensions DESC\
LIMIT 1;\
\
\'977. From the `order_payments table`, find the payment_type with the greatest number of order_id entries and the count of that payment type.\
\
SELECT \
	payment_type,\
    COUNT(order_id) AS number_times\
FROM olist.order_payments\
GROUP BY payment_type\
ORDER BY number_times DESC\
LIMIT 1;\
\
\'978. From the `order_payments table`, find the highest payment value for an individual order_id.\
\
SELECT \
	payment_value\
FROM olist.order_payments\
ORDER BY payment_value DESC\
LIMIT 1;\
\
\'979. From the `sellers` table, find the 3 seller states with the greatest number of distinct seller cities.\
\
SELECT \
	seller_state,\
    COUNT(DISTINCT(seller_city)) AS number_cities\
FROM olist.sellers\
GROUP BY seller_state\
ORDER BY number_cities DESC\
LIMIT 3;\
}