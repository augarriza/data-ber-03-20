{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;\f1\fnil\fcharset0 HelveticaNeue-Bold;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\partightenfactor0

\f0\fs24 \cf0 \'971. From the `client` table, what are the ids of the first 5 clients from `disrict_id` 1?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT *\
FROM bank.client\
WHERE district_id = 1\
ORDER BY client_id \
LIMIT 5;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'972. From the `client` table, what is the id of the last client from `district_id` 72?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT *\
FROM bank.client\
WHERE district_id = 72\
ORDER BY client_id DESC\
LIMIT 1;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'973. From the `loan` table, what are the 3 lowest amounts?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	amount\
FROM bank.loan\
ORDER BY amount \
LIMIT 3;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'974. From the `loan` table, what are the possible values for status, ordered alphabetically in ascending order?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT DISTINCT\
	status\
FROM bank.loan\
ORDER BY status ;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'975. From the `loans` table, what is the `loan_id` of the highest payment received?\
\pard\pardeftab560\partightenfactor0

\f1\b \cf0 \'97 I get a different result, but after checking, I don\'92t understand why my result differs.\
\pard\pardeftab560\slleading20\partightenfactor0

\f0\b0 \cf0 \
SELECT \
	loan_id\
FROM bank.loan\
ORDER BY amount DESC\
LIMIT 1;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'976. From the `loans` table, what is the loan `amount` of the lowest 5 `account_id`s. Show the `account_id` and the corresponding `amount`\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	account_id,\
    amount\
FROM bank.loan\
ORDER BY account_id \
LIMIT 5;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'977. From the `loans` table, which are the `account_id`s with the lowest loan `amount` have a loan `duration` of 60?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	account_id,\
    amount\
FROM bank.loan\
WHERE duration = 60\
ORDER BY amount \
LIMIT 5;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'978. From the `order` table, what are the unique values of `k_symbol`?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT distinct\
	k_symbol\
FROM bank.`order`\
ORDER BY k_symbol;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'979. From the `order` table, which are the `order_id`s from the client with the `account_id` 34?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT distinct\
	order_id\
FROM bank.`order`\
WHERE account_id = 34;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'9710.  From the `order` table, which `account_id`s were responsible for orders between `order_id` 29540 and `order_id` 29560 (inclusive)?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT distinct\
	account_id\
FROM bank.`order`\
WHERE order_id > 29540 \
	AND order_id < 29560;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'9711. From the `order` table, what are the individual amounts that were sent to (`account_to`) id 30067122?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	amount\
FROM bank.`order`\
WHERE account_to = 30067122;\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 \'9712. From the `trans` table, show the `trans_id`, `date`, `type` and `amount` of the 10 first transactions from `account_id` = 793 in chronological order, from newest to oldest.\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT \
	trans_id,\
    `date`,\
    `type`,\
    amount\
FROM bank.`trans`\
WHERE account_id = 793\
ORDER BY `date` DESC\
LIMIT 10;}