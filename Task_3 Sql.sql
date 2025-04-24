Create  database Ecommerce

use Ecommerce

Select * from Trans_dim


--1.Use SELECT, WHERE, ORDER BY, GROUP B

select 
	payment_key,
	trans_type,
	bank_name
From
	Trans_dim
where 
	trans_type= 'card'
order by
	bank_name;


select 
	trans_type,
	COUNT(*) as txn_count
from
	Trans_dim
group by 
	trans_type
order by 
	txn_count Desc;

Select * from Trans_dim

--2.Use JOINS (INNER, LEFT, RIGHT)'

--Inner JOin

SELECT
  f.payment_key,
  d.trans_type,
  d.bank_name
FROM
  Trans_dim AS f
INNER JOIN
  Trans_dim AS d
    ON f.payment_key = d.payment_key
ORDER BY
  f.bank_name DESC;


--Left Join

SELECT
  d.payment_key,
  d.trans_type,
  d.bank_name
FROM
  Trans_dim AS d
LEFT JOIN
  Trans_dim AS f
    ON d.payment_key = f.payment_key
ORDER BY
  d.payment_key;

SELECT
  d.payment_key,
  d.trans_type,
  d.bank_name
FROM
  Trans_dim AS f
RIGHT JOIN
  Trans_dim AS d
    ON f.payment_key = d.payment_key
WHERE
  f.payment_key IS NULL
ORDER BY
  d.payment_key;

Select * from Trans_dim

--Write subqueries
1. Scalar Subquery
2. Multi row 
3. Correlated 
4. Squbquery in Where clause
5.from Clause
6.Select clause
7.Having Clause
8. Multi Column Subquery
9.CTEs

Select * from Trans_dim

--Use aggregate functions (SUM, AVG)

SELECT
  d.trans_type,
  SUM(f.payment_key) AS total_amount
FROM
  Trans_dim AS f
JOIN
  Trans_dim AS d
    ON f.payment_key = d.payment_key
GROUP BY
  d.trans_type
ORDER BY
  total_amount DESC;


SELECT
  d.bank_name,
  AVG(f.payment_key) AS avg_amount
FROM
  Trans_dim AS f
JOIN
  Trans_dim AS d
    ON f.payment_key = d.payment_key
WHERE
  d.bank_name IS NOT NULL
GROUP BY
  d.bank_name
ORDER BY
  avg_amount DESC;

--Optimize queries with indexes'

CREATE INDEX idx_td_type_bank_covering
  ON Trans_dim (trans_type, bank_name)
  INCLUDE (payment_key);

Drop INDEX idx_td_type_bank_covering on Trans_dim;

select * from Trans_dim

CREATE INDEX idx_td_trans_type
  ON Trans_dim (trans_type);

Drop INDEX idx_td_trans_type
  ON Trans_dim;

select * from Trans_dim








