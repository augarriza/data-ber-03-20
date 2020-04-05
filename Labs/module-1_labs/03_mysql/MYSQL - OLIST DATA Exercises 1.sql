{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;\f1\fnil\fcharset0 HelveticaNeue-Bold;}
{\colortbl;\red255\green255\blue255;\red191\green191\blue191;}
{\*\expandedcolortbl;;\csgray\c79525;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\partightenfactor0

\f0\fs24 \cf0 \'971 . From the `order_items` table, find the price of the highest priced order item and lowest price order item.\
\
SELECT \
	MAX(price) AS max_price,\
    MIN(price) AS min_price\
FROM olist.order_items;\
\
\'972. From the `order_items` table, what is range of the shipping_limit_date of the orders?\
\
SELECT \
	MIN(shipping_limit_date),\
    MAX(shipping_limit_date)\
FROM olist.order_items;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'973. From the `customers` table, find the 3 states with the greatest number of customers.\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	customer_state,\
	COUNT(customer_state) AS num_cust_state\
FROM olist.customers\
GROUP BY customer_state\
ORDER BY num_cust_state DESC\
LIMIT 3;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'974. From the `customers` table, within the state with the greatest number of customers, find the 3 cities with the greatest number of customers.\
\
SELECT customer_state,\
	customer_city,\
    COUNT(customer_city) AS num_cust_city\
FROM olist.customers\
WHERE customer_state = 'SP'\
GROUP BY customer_city\
ORDER BY num_cust_city DESC\
LIMIT 3;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'97. From the `closed_deals` table, how many distinct business segments are there (not including null)?\
\pard\pardeftab560\partightenfactor0

\f1\b \cf0 \
\pard\pardeftab560\slleading20\partightenfactor0

\f0\b0 \cf0 SELECT \
	business_segment,\
    COUNT(business_segment) AS num_bus_in_seg\
FROM olist.closed_deals\
GROUP BY business_segment\
ORDER BY num_bus_in_seg DESC;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'97And we check how many rows are returned\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'976. From the closed_deals table, sum the declared_monthly_revenue for each business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	business_segment,\
    SUM(declared_monthly_revenue) AS monthly_revenue\
FROM olist.closed_deals\
GROUP BY business_segment\
ORDER BY monthly_revenue DESC\
LIMIT 3;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'977. From the order_reviews table, find the total number of distinct review score values.\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	COUNT(DISTINCT review_score) \
FROM olist.order_reviews;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'978. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5.\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT\
	review_score,\
    CASE\
		WHEN review_score = 1 THEN 'very disappointed'\
        WHEN review_score = 2 THEN 'disappointed'\
        WHEN review_score = 3 THEN 'neutral'\
        WHEN review_score = 4 THEN 'satisfied'\
        ELSE 'very satisfied'\
	END                         AS review_category\
	\
FROM olist.order_reviews\
LIMIT 100;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'979. From the order_reviews table, find the review value occurring most frequently and how many times it occurs\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT\
	review_score,\
    SUM(review_score) AS frequency\
FROM olist.order_reviews\
GROUP BY review_score\
ORDER BY frequency DESC;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trbrdrt\brdrnil \trbrdrl\brdrnil \trbrdrr\brdrnil 
\clvertalc \clshdrawnil \clbrdrt\brdrs\brdrw20\brdrcf2 \clbrdrl\brdrs\brdrw20\brdrcf2 \clbrdrb\brdrs\brdrw20\brdrcf2 \clbrdrr\brdrs\brdrw20\brdrcf2 \clpadl100 \clpadr100 \gaph\cellx2880
\clvertalc \clshdrawnil \clbrdrt\brdrs\brdrw20\brdrcf2 \clbrdrl\brdrs\brdrw20\brdrcf2 \clbrdrb\brdrs\brdrw20\brdrcf2 \clbrdrr\brdrs\brdrw20\brdrcf2 \clpadl100 \clpadr100 \gaph\cellx5760
\clvertalc \clshdrawnil \clbrdrt\brdrs\brdrw20\brdrcf2 \clbrdrl\brdrs\brdrw20\brdrcf2 \clbrdrb\brdrs\brdrw20\brdrcf2 \clbrdrr\brdrs\brdrw20\brdrcf2 \clpadl100 \clpadr100 \gaph\cellx8640
\pard\intbl\itap1\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \cell 
\pard\intbl\itap1\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \cell 
\pard\intbl\itap1\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \cell \row

\itap1\trowd \taflags1 \trgaph108\trleft-108 \trbrdrl\brdrnil \trbrdrt\brdrnil \trbrdrr\brdrnil 
\clvertalc \clshdrawnil \clbrdrt\brdrs\brdrw20\brdrcf2 \clbrdrl\brdrs\brdrw20\brdrcf2 \clbrdrb\brdrs\brdrw20\brdrcf2 \clbrdrr\brdrs\brdrw20\brdrcf2 \clpadl100 \clpadr100 \gaph\cellx2880
\clvertalc \clshdrawnil \clbrdrt\brdrs\brdrw20\brdrcf2 \clbrdrl\brdrs\brdrw20\brdrcf2 \clbrdrb\brdrs\brdrw20\brdrcf2 \clbrdrr\brdrs\brdrw20\brdrcf2 \clpadl100 \clpadr100 \gaph\cellx5760
\clvertalc \clshdrawnil \clbrdrt\brdrs\brdrw20\brdrcf2 \clbrdrl\brdrs\brdrw20\brdrcf2 \clbrdrb\brdrs\brdrw20\brdrcf2 \clbrdrr\brdrs\brdrw20\brdrcf2 \clpadl100 \clpadr100 \gaph\cellx8640
\pard\intbl\itap1\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \cell 
\pard\intbl\itap1\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \cell 
\pard\intbl\itap1\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \cell \lastrow\row
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
}