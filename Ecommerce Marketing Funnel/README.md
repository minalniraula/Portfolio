# E-commerce Marketing Funnel Analysis
**Description**

This project analyses a multi-CSV e-commerce dataset capturing customer signups, sessions, behavioural events, and completed orders. This raw transactional and clickstream data was cleaned and used to create a  sequential signup-to-purchase funnel to track user progression and identify where drop-offs occur after signup. The analysis focuses on translating granular user activity into clear conversion and drop-off metrics that can inform optimisation decisions.


**Funnel Stages**

<img width="200" height="133" alt="marekting-funnel-aida" src="https://github.com/user-attachments/assets/2d02ef7f-c304-44cc-9dba-9441eba9d804" />

- Awareness → User signup
- Interest → First page view after signup
- Desire → Add to cart or checkout
- Action → Purchase

**Tools used**
- [SQL](sql-scripts.sql) for data cleaning and funnel table construction(PostgreSQL) 
- Power BI for visualisation
## Key Questions
- Where do customers drop off after signing up?
- Which funnel stage shows the highest attrition?
- What percentage of signups convert to purchases?
## About the Data
This synthetic multi-CSV dataset emulates an e-commerce site selling products in multiple categories, like beauty, electronics, and fashion. The dataset represents user signups, sessions, events, and purchases across various product categories. 

More about the data and ERD [here](data_overview.md).
## Key Findings
<img width="661" height="461" alt="power-bi-dashboard" src="https://github.com/user-attachments/assets/88b314b7-8350-47f6-ba0a-4136f79247ee" />

- A significant proportion of users drop off between the desire and purchase stage. Hence, customers leave after adding to the cart and hitting checkout without actual purchase.
- Sign up (awareness) to page views (interest) and page views to adding to the cart have high retention rates.
- The signup-to-purchase conversion is around 51%.
## Recommendations
Given that users are showing intent in initiating checkout, the drop off could be caused by a process or usability issue. Therefore, the following recommendations could be explored:
- Prioritising checkout experience optimisation could increase purchase action.
- Review potential friction points in checkout flow by limiting the number of steps, potential jargons, complexities, payment options and error handling.
- Run A/B tests on the purchase page to identify potential roadblocks and validate whether the design changes convert.
## Acknowlegments
This data is publicly available on Kaggle. You can find the raw data [here](https://www.kaggle.com/datasets/wafaaelhusseini/e-commerce-transactions-clickstream). 
