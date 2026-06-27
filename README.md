# Retail-sales-analysis
End-to-end retail sales analysis using SQL Server, WideWorldImportersDW and Power BI.

# Retail Sales Analysis - WideWorldImportersDW

## Project Overview

This project analyzes retail sales data set from Microsoft's WideWorldImportersDW database.

A retail company wants to better understand its sales performance, customer behavior, product performance, and geographic distribution of revenue.
The goal is to identify opportunities for growth and support data-driven decision-making.
The objective is to transform raw transactional data into actionable business insights through SQL analysis and interactive Power BI dashboards.

The project follows a complete analytics workflow:

1. Business Understanding
2. Data Exploration
3. Document data model
4. Data Analysis with SQL
5. Dashboard Creation in Power BI
6. Insights and Recommendations

---

## Business Questions

The analysis aims to answer the following questions:

- Which customers contribute the most revenue?
- What percentage of revenue comes from top customers?
- Which products generate the highest revenue?
- Which product categories perform best?
- Which cities generate the highest sales?
- How have sales evolved over time?
- Are there seasonal sales patterns?

---

## Tools Used

- SQL Server
- SQL Server Management Studio (SSMS)
- Power BI
- GitHub

---

## Project Structure

```text
retail-sales-analysis/
│
├── SQL/
├── Data_Model/
├── PowerBI/
├── Documentation/
└── Images/
```

---

## Project Roadmap

### Phase 1 - Business Understanding 
- Define business objectives
- Define key business questions

##Phase 2 - Data Exploration <a href="./SQL/Data Exploration"><img src="https://img.icons8.com/fluent/48/000000/folder-invoices.png" width="28" valign="middle"></a>
- Identify fact tables
- Identify dimension tables
- Understand relationships
- Document data model

###Phase 3 - Document data model <a href="./DataModel"><img src="https://img.icons8.com/fluent/48/000000/folder-invoices.png" width="28" valign="middle"></a>
```text
Fact.Sale
    │
    ├── Dimension.Customer
    ├── Dimension.Stock Item
    ├── Dimension.City
    └── Dimension.Date
```

<img src="Images/AnalyticalModel.png" alt="Analytical Data Model" width="40%">
        
The analytical model was designed after exploring the WideWorldImportersDW data warehouse. Fact.Sale was selected as the central fact table due to its historical sales information and its relationships with customer, product, geography and date dimensions

###Phase 4 - SQL Analysis <a href="./SQL"><img src="https://img.icons8.com/fluent/48/000000/folder-invoices.png" width="28" valign="middle"></a>
- Sales analysis
- Customer analysis <a href="./SQL/Customer Analysis"><img src="https://img.icons8.com/fluent/48/000000/folder-invoices.png" width="28" valign="middle"></a>
- Product analysis
- Geographic analysis
- KPI calculation

###Phase 5 - Dashboard Development <a href="./Power BI"><img src="https://img.icons8.com/fluent/48/000000/folder-invoices.png" width="28" valign="middle"></a>
- Executive dashboard
- Sales dashboard
- Customer dashboard

### Phase 6 - Insights & Recommendations
- Identify trends
- Generate business recommendations
- Present findings

---

## Current Status

🚧 Project In Progress

Completed:
- Initial data exploration
- Data model documentation
- Identification of analytical tables


In Progress:

- KPIs definition and analisys

---

## Future Deliverables

- SQL analysis scripts (can be found in the `SQL` folder.)
- The SQL phase began with an exploration of the WideWorldImportersDW data warehouse structure, including:
        
  - Schema identification
  - Table inventory
  - Column inspection
  - Row count analysis
  - Identification of key fields



- Power BI dashboard
- Business insights report
- Recommendations for decision-making

