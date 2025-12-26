-- Marketing Funnel for ecommerce
/*
Skills used: Data cleaning, Joins, , Joins, Aggregate Functions, GROUP BY, CASE Statements, Date & Time Filtering, Data Type Casting, NULL Handling, CREATE TABLE / CREATE VIEW.
For ERD diagram check data_overview.md
*/

DROP TABLE IF EXISTS clean_customers;
-- Cleaned raw_customers table
CREATE TABLE clean_customers AS
SELECT
    -- Changed typecast to match data type
    customer_id::int  AS customer_id, 
    name,
    email,
    country,
    age::int          AS age,
    signup_date::date AS signup_date,
    marketing_opt_in
FROM raw_customers
-- Removing null values as it might interfere with further analyses
WHERE customer_id IS NOT NULL;


DROP TABLE IF EXISTS clean_sessions;
-- Cleaned raw_sessions table to later join with events table
CREATE TABLE clean_sessions AS
SELECT
    session_id::int  AS session_id,
    customer_id::int AS customer_id,
    start_time::timestamp AS start_time,
    device,
    source,
    country
FROM raw_sessions
WHERE session_id IS NOT NULL
  AND customer_id IS NOT NULL;


DROP TABLE IF EXISTS clean_events;
-- Cleaned raw_events table
CREATE TABLE clean_events AS
SELECT
    e.event_id::int                 AS event_id,
    e.session_id::int               AS session_id,
    s.customer_id                   AS customer_id,
    e."timestamp"::timestamp        AS event_time,
    e.event_type                    AS event_type,
    e.product_id::numeric::int      AS product_id,
    e.qty::numeric::int             AS qty,
    e.cart_size::numeric::int       AS cart_size
FROM raw_events e
-- Joined sessions table as events table did not contain customer_id
JOIN clean_sessions s
  ON e.session_id::int = s.session_id
WHERE e.event_id IS NOT NULL
  AND e.session_id IS NOT NULL
  AND e."timestamp" IS NOT NULL
  AND e.event_type IS NOT NULL;


DROP TABLE IF EXISTS clean_orders;
--  Clean orders so purchase time and revenue can be analysed
CREATE TABLE clean_orders AS
SELECT
    order_id::int                 AS order_id,
    customer_id::int              AS customer_id,
    order_time::timestamp         AS order_time,
    payment_method,
    total_usd::numeric            AS total_usd,
    country,
    device,
    source
FROM raw_orders
WHERE order_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND order_time IS NOT NULL;

/* Started creating 
MARKETING FUNNEL where  signup is AWARENESS
                        page_view is INTEREST
                        add_to cart and checkout are DESIRE
                        purchase is ACTION
*/

DROP TABLE IF EXISTS funnel_base;
-- Creating base of the funnel with signup as awareness
CREATE TABLE funnel_base AS
SELECT
    customer_id,
    signup_date::timestamp AS signup_time
FROM clean_customers
WHERE signup_date IS NOT NULL;


DROP TABLE IF EXISTS funnel_interest;
-- Creating funnel interst with page view as interest
CREATE TABLE funnel_interest AS
SELECT
    b.customer_id,
    -- Taking initial page_view after signup as interest time as some users have multiple
    MIN(e.event_time) AS interest_time
FROM funnel_base b
JOIN clean_events e
  ON e.customer_id = b.customer_id
WHERE e.event_type = 'page_view'
    -- For sequential funnel marketing tables
  AND e.event_time >= b.signup_time
GROUP BY b.customer_id;


DROP TABLE IF EXISTS funnel_desire;
-- Creating funnel desire with add to cart and checkout as interest
CREATE TABLE funnel_desire AS
SELECT
    i.customer_id,
    MIN(e.event_time) AS desire_time
FROM funnel_interest i
JOIN clean_events e
  ON e.customer_id = i.customer_id
WHERE e.event_type IN ('add_to_cart', 'checkout')
    -- For sequential funnel marketing tables
  AND e.event_time >= i.interest_time
GROUP BY i.customer_id;


DROP TABLE IF EXISTS funnel_action;
-- Creating funnel action with purchase as action
CREATE TABLE funnel_action AS
SELECT
    d.customer_id,
    -- Use of MIN for selecting first purchase
    MIN(o.order_time) AS action_time
FROM funnel_desire d
JOIN clean_orders o
  ON o.customer_id = d.customer_id
  -- For sequential funnel marketing tables
WHERE o.order_time >= d.desire_time
GROUP BY d.customer_id;


DROP TABLE IF EXISTS marketing_funnel;
-- Creating marketing funnel table
CREATE TABLE marketing_funnel AS
SELECT
    b.customer_id,
    b.signup_time::date AS signup_date,
-- Matching record across tables to examine if customer progressed to the next level
    CASE WHEN i.customer_id IS NOT NULL THEN 1 ELSE 0 END AS interest,
    CASE WHEN d.customer_id IS NOT NULL THEN 1 ELSE 0 END AS desire,
    CASE WHEN a.customer_id IS NOT NULL THEN 1 ELSE 0 END AS action,

    i.interest_time,
    d.desire_time,
    a.action_time
FROM funnel_base b
-- Joining all stages together using customer_id
LEFT JOIN funnel_interest i ON i.customer_id = b.customer_id
LEFT JOIN funnel_desire  d ON d.customer_id = b.customer_id
LEFT JOIN funnel_action  a ON a.customer_id = b.customer_id;

-- Drop-off counts between each funnel stage
SELECT
  (COUNT(*) - SUM(interest)) AS drop_after_signup,
  (SUM(interest) - SUM(desire)) AS drop_after_interest,
  (SUM(desire) - SUM(action)) AS drop_after_desire
FROM marketing_funnel;

-- Funnel counts
SELECT
  COUNT(*) AS signups,
  SUM(interest) AS interest_users,
  SUM(desire) AS desire_users,
  SUM(action) AS purchasers,
-- Calculating the percentage of dropoffs
  (SUM(interest) * 100.0 / COUNT(*)) AS signup_to_interest_pct,
  (SUM(desire) * 100.0 / NULLIF(SUM(interest),0)) AS interest_to_desire_pct,
  (SUM(action) * 100.0 / NULLIF(SUM(desire),0)) AS desire_to_action_pct,
  (SUM(action) * 100.0 / COUNT(*)) AS signup_to_purchase_pct
FROM marketing_funnel;


-- Created a Power BI ready view
DROP VIEW IF EXISTS marketing_funnel_export;

CREATE VIEW marketing_funnel_export AS
SELECT
    f.customer_id,
    f.signup_date,
    f.interest,
    f.desire,
    f.action,
    f.interest_time,
    f.desire_time,
    f.action_time,
    c.country,
    c.age,
    c.marketing_opt_in
FROM marketing_funnel f
JOIN clean_customers c
  ON c.customer_id = f.customer_id;





