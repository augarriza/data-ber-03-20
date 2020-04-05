{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab560
\pard\pardeftab560\slleading20\partightenfactor0

\f0\fs24 \cf0 \'971 Who Have Published What At Where?\
\pard\pardeftab560\slleading20\pardirnatural\partightenfactor0
\cf0 \
\pard\pardeftab560\slleading20\partightenfactor0
\cf0 SELECT\
	pa.au_id AS AUTHOR_ID,\
    pa.au_lname  AS LAST_NAME,\
    pa.au_fname AS FAMILY_NAME,\
    pt.title AS TITLE,\
    pp.pub_name AS PUBLISHER\
FROM publications.titles pt\
INNER JOIN publications.publishers pp\
	ON pt.pub_id = pp.pub_id\
INNER JOIN publications.titleauthor pta\
	ON pt.title_id = pta.title_id\
INNER JOIN publications.authors pa\
	ON pta.au_id = pa.au_id\
LIMIT 10;\
\
\
\'972 Who Have Published How Many At Where?\
\
SELECT \
	pa.au_id AS AUTHOR_ID,\
    pa.au_lname  AS LAST_NAME,\
    pa.au_fname AS FIRST_NAME,\
    pp.pub_name AS PUBLISHER,\
    COUNT(*)    AS TITLE_COUNT\
FROM publications.titles pt\
INNER JOIN publications.publishers pp\
	ON pt.pub_id = pp.pub_id\
INNER JOIN publications.titleauthor pta\
	ON pt.title_id = pta.title_id\
INNER JOIN publications.authors pa\
	ON pta.au_id = pa.au_id\
GROUP BY AUTHOR_ID,\
	pa.au_lname,\
    pa.au_fname,\
    pp.pub_name\
ORDER BY TITLE_COUNT DESC\
LIMIT 10;\
\
\
\'973 Best Selling Authors\
\
SELECT \
	pa.au_id      AS AUTHOR_ID,\
    pa.au_lname   AS LAST_NAME,\
    pa.au_fname   AS FIRST_NAME,\
    COUNT(pt.title_id)      AS TOTAL  \
FROM publications.titles pt\
INNER JOIN publications.publishers pp\
	ON pt.pub_id = pp.pub_id\
INNER JOIN publications.titleauthor pta\
	ON pt.title_id = pta.title_id\
INNER JOIN publications.authors pa\
	ON pta.au_id = pa.au_id\
GROUP BY author_id,\
	last_name,\
    first_name\
ORDER BY total DESC\
LIMIT 3;\
\
\'974 Best Selling Authors Ranking\
\
SELECT \
	pa.au_id                            AS AUTHOR_ID,\
    pa.au_lname                         AS LAST_NAME,\
    pa.au_fname                         AS FIRST_NAME,\
    COALESCE(COUNT(pt.title_id), 0)     AS TOTAL  \
FROM publications.titles pt\
INNER JOIN publications.publishers pp\
	ON pt.pub_id = pp.pub_id\
INNER JOIN publications.titleauthor pta\
	ON pt.title_id = pta.title_id\
INNER JOIN publications.authors pa\
	ON pta.au_id = pa.au_id\
GROUP BY author_id,\
	last_name,\
    first_name\
HAVING total >= 0\
ORDER BY total DESC;\
}