# Data Overview

## Data Sources
This project uses a synthetic, multi-CSV e-commerce dataset sourced from Kaggle, designed to simulate user behaviour on an online retail platform. 

## CSVs Used

- `customers.csv`: user-level information, including signup date and demographics
  - Fields: 9
  - Rows: 20,000
- `sessions.csv` – browsing sessions associated with each customer
  -  Fields: 6
  -  Rows: 120,000
- `events.csv` – user interactions such as page views and add-to-cart actions
  -  Fields: 10
  -  Rows: 760,958
- `orders.csv` – completed purchases with timestamps
  -  Fields: 10
  -  Rows: 33,580

These CSVs were imported into SQL as individual tables.

## Relationships
Customers are linked to sessions via `customer_id`, sessions are linked to events via `session_id`, and orders are linked directly to customers. This structure enables tracking user behaviour from signup through purchase.
<img width="538" height="532" alt="entity-relationship-diagram" src="https://github.com/user-attachments/assets/b9e562a6-e4b1-4698-9874-a4c3e09296c0" />

## Key Assumptions
- Only events occurring after signup are included in the funnel  
- Funnel stages are defined by the first occurrence of each relevant event  
- Customers who do not complete a purchase remain in the funnel for drop-off analysis

