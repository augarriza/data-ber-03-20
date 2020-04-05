{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\partightenfactor0

\f0\fs24 \cf0 \'971. From the `client` table, of all districts with a `district_id` lower than 10, how many clients are from each `district_id`? Show the results sorted by district_id in ascending order.\
\
SELECT \
	district_id,\
    COUNT(client_id) AS clients\
FROM bank.client\
WHERE district_id < 10\
GROUP BY district_id\
ORDER BY district_id;\
\
\'972. From the `card` table, how many cards exist for each `type`? Rank the result starting with the most frequent `type`.\
\
SELECT \
	`type`,\
    COUNT(card_id) AS frequency\
FROM bank.card\
GROUP BY `type`\
ORDER BY frequency DESC;\
\
\'973. Using the `loan` table, print the top 10 `account_id`s based on the sum of all of their loan amounts.\
\
SELECT \
	account_id,\
    SUM(amount) AS total_amount\
FROM bank.loan\
GROUP BY account_id\
ORDER BY total_amount DESC\
LIMIT 10;\
\
\'974. From the `loan` table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order\
\
SELECT \
	`date`,\
    COUNT(loan_id) AS number_issued_loans\
FROM bank.loan\
WHERE `date`< 930907\
GROUP BY `date`\
ORDER BY `date`DESC;\
\
\'975. From the `loan` table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.\
\
SELECT \
	`date`,\
    duration,\
    COUNT(loan_id) AS number_loans\
FROM bank.loan\
WHERE `date`LIKE '9712%'\
GROUP BY `date`,duration\
ORDER BY `date`, duration;\
\
\'976. From the `trans` table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as `total_amount`. Sort alphabetically by type.\
\
SELECT\
	account_id,\
    `type`,\
    SUM(amount) AS total_amount\
FROM bank.`trans`\
WHERE account_id = 396\
GROUP BY account_id, `type`\
ORDER BY `type`;\
\
\'977. From the previous output, translate the values for `type` to English, rename the column to `transaction_type`, round `total_amount` down to an integer\
\
SELECT\
	account_id,\
    CASE\
		WHEN `type`= 'PRIJEM' THEN 'INCOMING'\
        ELSE 'OUTCOMING'\
	END         AS transaction_type,\
    CAST(SUM(amount) AS SIGNED) AS total_amount\
FROM bank.`trans`\
WHERE account_id = 396\
GROUP BY account_id, transaction_type\
ORDER BY transaction_type;\
\
\'978. From the previous result, modify you query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference\
\
SELECT\
	account_id,\
	(SELECT \
		CAST(SUM(amount) AS signed) \
		FROM bank.`trans`\
		GROUP BY account_id, `type`\
		HAVING `type` = 'PRIJEM'\
			AND account_id = 396) AS incoming,\
	(SELECT \
		CAST(SUM(amount) AS signed) \
	FROM bank.`trans`\
	GROUP BY account_id, `type`\
	HAVING `type` = 'VYDAJ'\
		AND account_id = 396) AS outgoing ,\
	(SELECT \
		CAST(SUM(amount) AS signed) \
		FROM bank.`trans`\
		GROUP BY account_id, `type`\
		HAVING `type` = 'PRIJEM'\
			AND account_id = 396) -\
	(SELECT \
		CAST(SUM(amount) AS signed) \
	FROM bank.`trans`\
	GROUP BY account_id, `type`\
	HAVING `type` = 'VYDAJ'\
		AND account_id = 396) AS difference\
FROM bank.`trans`\
WHERE account_id = 396\
LIMIT 1;\
\
\'979. Continuing with the previous example, rank the top 10 account_ids based on their difference\
\
CREATE TEMPORARY TABLE prijem_per_id AS\
SELECT\
	CAST(SUM(amount) AS SIGNED) AS incoming\
FROM bank.`trans`\
WHERE `type` = 'PRIJEM'\
GROUP BY account_id;\
\
CREATE TEMPORARY TABLE vydaj_per_id AS\
SELECT\
	CAST(SUM(amount) AS SIGNED) AS outgoing\
FROM bank.`trans`\
WHERE `type` = 'VYDAJ'\
GROUP BY account_id;\
\
SELECT\
	bt.account_id,\
    ppi.incoming - vpi.outgoing AS difference\
FROM bank.`trans` bt\
	INNER JOIN prijem_per_id ppi\
    ON bt.account_id = ppi.account_id\
    INNER JOIN vydaj_per_id vpi\
    ON ppi.account_id = vpi.account_id\
GROUP BY bt.account_id,difference\
ORDER BY difference DESC\
LIMIT 10;\
}