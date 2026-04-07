# US Domestic Airline Data Analysis
**Description:**

This project analyzes the operational performance of major US domestic airlines using 2024 flight performance data from the Bureau of Transportation Statistics (BTS). The analysis focuses on understanding delay patterns, identifying key causes of disruptions, and benchmarking Southwest Airlines against industry performance. The goal is to identify operational trends affecting airline reliability and evaluate how Southwest compares to its competitors.

**Tools used:**

- Python libraries: Pandas, Matplotlib, NumPy and Seaborn
- Jupyter Notebook

**Techniques used:** 

- Python: lambda transformations, loops

- Pandas: data cleaning, filtering, groupby aggregation, pivot tables, MultiIndex handling, merging tables, boolean indexing, feature engineering, datetime manipulation, percentage calculations

- EDA: KPI analysis, delay rate calculation, comparative benchmarking, seasonal trend analysis, route performance analysis

- Data Visualisation: heatmaps, stacked bar charts, line charts, multi-subplot figures, chart labeling and formatting


## About the Data
The dataset comes from the U.S. Bureau of Transportation Statistics (BTS) and contains domestic flight performance data for 2024 across 14 major US airlines. It includes over 7 million records which each row represented a flight with information including flight date, destination and origin airports, flight time, departure & arrival time, duration, delays, cancellations and diversions. 

The dataset was cleaned to remove unnecessary columns and focus on variables relevant to operational performance analysis.

## What I Did

The project was completed in four main stages:

1. **Data Cleaning**

- Removed irrelevant columns and duplicated rows
- Fixed data types

2. **Data Manipulation**

- Merged airline lookup tables to include carrier names

3. **Industry Analysis**

- Identified airlines and routes with the highest delays and their causes
- Examined seasonal delay patterns

4. **Southwest vs Industry Comparison**

- Compared delay causes between Southwest and the industry
- Compared cancellation and diversion rates
- Compared early, on-time, and late arrival distributions
- Compared monthly delay trends

## Key Findings
- Late aircraft delay is the largest contributor to delays across the industry, suggesting delay propagation is a major operational challenge.
- Weather delays contribute relatively little compared to operational delay causes.
- Delays tend to peak during summer months, likely due to higher travel demand.
- Southwest generally shows slightly lower average delays than the industry across most delay categories.
- Southwest shows a higher proportion of late aircraft delays, suggesting delays often carry forward through its network.

## Acknowlegments
This data is publicly available on Kaggle and on BTS. You can find the raw data [here](https://www.kaggle.com/datasets/hrishitpatil/flight-data-2024?resource=download)

