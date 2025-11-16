---
title: "Data Infrastructure for Mobility Authorities"
date: "2025-11-10"
draft: false
tags:
- Data Engineering
- Public Policy
- Dashboards
- Transportation
- BigQuery
summary: Development of automated dashboards for regional authorities to track carpooling subsidy effectiveness.
---

# Data Infrastructure for Mobility Authorities

## Automated Dashboards for Transport Policy

Led the design and deployment of automated dashboards for French Mobility Organizing Authorities (AOM) and Regions, enabling data-driven management of carpooling subsidy programs.

### Project Overview

As French regions and local authorities began subsidizing carpooling to promote sustainable mobility, they needed tools to:

- Track subsidy program performance in real-time
- Measure modal shift and environmental impact
- Optimize subsidy levels and eligibility criteria
- Justify public spending with evidence
- Identify fraud and ensure compliance

### Technical Solution

**Data Warehouse:** Google BigQuery
- Consolidated data from multiple sources
- Processed over 100,000 carpooling trips per month
- Enabled complex analytical queries at scale

**ETL Pipelines:**
- Automated data ingestion from application databases
- Data cleaning and validation
- Calculation of key performance indicators
- Integration with external data sources (geographic, demographic)

**Visualization:** Tableau & Data Studio
- Interactive dashboards for different stakeholder levels
- Automated daily/weekly/monthly reports
- Geographic visualizations showing trip patterns
- Trend analysis and forecasting

### Key Metrics & Insights

#### Subsidy Effectiveness
- Cost per modal shift (users switching from solo driving)
- Subsidy cost per ton of CO2 avoided
- Long-term adoption rates post-subsidy

#### Network Development
- Geographic coverage and gaps
- Trip origin-destination patterns
- Peak hours and corridor identification
- User acquisition and retention by area

#### Program Optimization
- Optimal subsidy levels
- Eligibility criteria effectiveness
- Fraud detection patterns
- Seasonal and demographic variations

### Impact

**For Public Authorities:**
- Evidence-based policy making
- Real-time program monitoring
- Fraud prevention saving public funds
- Ability to adjust programs based on data

**For Carpooling Platforms:**
- Transparent reporting builds trust with authorities
- Data demonstrates social value
- Supports expansion of subsidy programs
- Enables better service in subsidized areas

**For Citizens:**
- More effective use of public funds
- Better-targeted subsidy programs
- Improved carpooling services
- Increased sustainable mobility options

### Technical Challenges

- **Data Privacy:** Aggregating insights while protecting individual privacy
- **Multi-Stakeholder Needs:** Different dashboards for different authority levels
- **Real-Time Requirements:** Near-real-time reporting for program management
- **Data Quality:** Ensuring accuracy in subsidy calculations
- **Scalability:** Handling growing data volumes as programs expanded

### Lessons Learned

1. **Stakeholder Alignment:** Close collaboration with authorities essential for relevant metrics
2. **Iterative Development:** Start simple, add complexity based on feedback
3. **Documentation:** Clear data definitions crucial for trust
4. **Automation:** Reduces manual work and errors
5. **Flexibility:** Authorities' needs evolve as they learn from data

### Future Directions

- Integration with other mobility data (public transit, bike-sharing)
- Predictive analytics for demand forecasting
- More sophisticated environmental impact modeling
- Standardization across different French regions

## Technologies Used

**Data Stack:** BigQuery, dbt, Airflow, Python, SQL

**Visualization:** Tableau, Looker Studio

**Geographic:** QGIS, Geopandas

## Tags

Data Engineering, Public Policy, Dashboards, Transportation, BigQuery, Data Visualization
