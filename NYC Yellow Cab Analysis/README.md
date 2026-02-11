# NYC Yellow Taxi Analysis
**Description:** This project analyses NYC Yellow Taxi trip data (July 2021) using Microsoft Excel to demonstrate practical business and data analysis skills. The focus is on answering realistic operational and customer-focused questions using pivot tables, KPIs, charts, and slicers. The analysis covers demand patterns across time and location, trip duration and revenue distribution, and customer payment and tipping behaviour. The final output consists of interactive dashboards built with pivot tables, charts, and slicers to support exploratory analysis.

**Tools used:** This project uses Microsoft Excel with utilising data skills in Excel such as:
  - Power Query (data cleaning and creating custom columns)
  - Power Pivot (data modelling and relationships)
  - DAX measures (KPIs and new measures)
  - Pivot Tables & Pivot Charts
  - Slicers

 **Output:** Find the excel worksheet here: [Link](https://github.com/minalniraula/Portfolio/raw/refs/heads/main/NYC%20Yellow%20Cab%20Analysis/NYC%20Yellow%20Cab.xlsx)
 
## Key Questions
1. What are the key performance indicators (KPIs) for NYC Yellow Taxis?
2. When and where is taxi demand the highest?
3. How do trip volume and total revenue vary by trip duration?
4. How do customers choose to pay, and how does payment method influence tipping behaviour?

## Findings
### 1. KPIs
![Recording 2026-02-10 133052 (1)](https://github.com/user-attachments/assets/7496a61f-481a-4596-8f7d-74d3d482d125)
**Method:** Created DAX measures in Power Pivot (Total Trips, Total Revenue, Avg Revenue per Trip, Tip %) and built dynamic KPI cards linked to slicers.

**Findings:**
- ~83,000 trips generated ~$2.0M in revenue
- Average revenue per trip ≈ $24
- Overall tip percentage ≈ 4.4%
### 2. Highest Demand Area and Time
<img width="1780" height="567" alt="image" src="https://github.com/user-attachments/assets/b36be9b8-0d70-4ef0-a4b9-a645d35e4166" />

**Method:** Built a Date dimension using Power Query and analysed trip counts by day, borough, and time of day with interactive slicers.

**Findings:**
- Demand peaks on Thursday and Friday
- Manhattan dominates overall trip volume
- Morning and Afternoon periods show higher demand levels
### 3. Trip Volume and Revenue by Trip Duration
<img width="1635" height="519" alt="image" src="https://github.com/user-attachments/assets/4efd56b1-822d-4e5d-997e-c079a003b74a" />

**Method:** Calculated trip duration and grouped trips into duration bins in Power Query, then compared volume and revenue using pivot charts.

**Findings:**
- Trips under 15 minutes account for most journeys
- 16–30 minute trips contribute the largest share of total revenue
- Long trips are less frequent and higher in Staten Island
### 4. Customer Behaviour
<img width="1312" height="459" alt="image" src="https://github.com/user-attachments/assets/ca880ad5-e4e0-450f-ac3d-cae662af9278" />

**Method:** Connected payment method as a dimension table and calculated Tip % as a DAX measure to compare behaviour across payment type, time, and borough.

**Findings:**
- Credit card payments dominate recorded tipping behaviour
- Tip percentage is higher in Manhattan and in the evening
- Passengers mainly travel alone
## About the Data
`yellow_tripdata_2021-07.csv` : a yellow taxi trip record where each row represents a single trip with information about the dropup and drop off borough locations, passenger information (payment method, counts), payment amounts and time dimensions
- Fields: 20
- Rows: 83,692
Additional 
## Acknowledgements
This data is publicly available on NYC Taxi Trip Record Data. You can find the raw data [here](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page).
