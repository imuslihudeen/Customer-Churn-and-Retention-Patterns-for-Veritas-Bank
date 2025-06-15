# Veritas-Portfolio

## Table of Contents
1. [Project Overview](#Project-Overview)
2. [Project Aim](#Project-Aim)
3. [Objectives](#objectives)  
4. [Beneficiaries](#beneficiaries)  
5. [Dashboard](#dashboard)
6. [Key insights](#key-insights)
7. [Recommendation](#Recommendation)

# Project Overview
This project focused on analysing customer churn and retention patterns at Veritas Bank, a multinational retail bank operating in the UK, Germany, and France.

# Project Aim
The goal is to identify churn patterns, segment customers, and present findings through interactive dashboards.

# Project Objectives
- Identify key characteristics of customers who churned.
- Compare churn behaviour across the UK, Germany, and France.
- Segment customers based on churn risk and usage.
- Build interactive dashboards to aid strategic decisions.
  
# Technology Stack 
- SQL Server – Data storage, queries, and transformations
- Power BI – Data visualisation and dashboarding

# Dataset Description 
## The dataset includes information on:
- Customer demographics (Age, Gender, Country)
- Credit Score and Balance
- Product and Tenure History
- Credit Card status and activity
- Churn flag (Exited column)

# Project Workflow
## Phase 1: Data Setup & Import
- Created SQL Server database and tables
- Imported raw customer data
- Performed basic data quality checks

# Phase 2: Data Transformation
- Created derived columns (e.g., risk scores, Tenure Segment, Credit rating)
- Created SQL views for churned vs. active users
- Identified high-risk customer profiles
  
# Phase 3: Power BI Dashboarding
- Connected Power BI to SQL Server
- Built DAX measures for KPIs (e.g., Churn Rate, Avg Tenure)
- Developed two main dashboard pages:
- Customer Demographics & Segment Analysis
- Churn Analysis & Risk Profiling
  
## Phase 5: Reporting & Documentation
- Visualise customer demographics and segment analysis.
- Visualise risk profile, product recalls, crisis response, and complaint trends.

# Key Insights
- High churn among customers with low credit scores and low engagement
- Highest churn is among 26–35-year-olds, especially in Germany and France, where churn exceeds 17%.
- The majority of customers have  fair credit ratings and low to moderate account balances. 
- Regional churn variation: higher in Germany and France
- Tenure and product ownership strongly influence retention.
- Dormant, high-risk customers account for a significant share of churn. 

# Recommendations: 
1. Customer Retention Strategy Target Segments:  
- Focus on 26–45-year-old customers in Germany and France, particularly those with Fair/Poor credit ratings.
- Create custom retention programs for high-risk, dormant users before they churn.

2. Risk-Based Engagement Monitor 
- Engage with customers tagged as "High Risk", especially if they are dormant. 
- Consider early warning systems to flag customers approaching high-risk thresholds based on behaviour or balance changes.

3. Country-Specific Strategy
- Germany & France: Investigate local causes of churn  to improve service quality, competition, and regulation? 
- Localise offerings or customer service improvements in these markets.
  
4. Product & Credit Score 
- Offer credit education tools or personalised financial advice to customers with lower credit ratings to improve their score and reduce churn.
- Personalised retention campaigns & region-specific strategies
