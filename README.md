# cloud-infrastructure-market-intelligence
End-to-end cloud infrastructure market intelligence project using Python/Pandas, SQL (DuckDB), and Tableau for market sizing, forecasting, regional analysis, segmentation, and business insights.
# Cloud Infrastructure Market Intelligence

## Project Overview

An end-to-end cloud infrastructure market intelligence project combining **Python/Pandas, SQL (DuckDB), and Tableau** to analyze market size, growth, regional performance, and market segmentation from 2019–2035.

The project demonstrates how market research data can be transformed into structured datasets, validated through Python, analyzed using SQL, and presented through an interactive Tableau dashboard.

## Business Questions

- What is the global cloud infrastructure market size in 2024?
- How is the market expected to grow through 2035?
- Which regions represent the largest market opportunities?
- Which regions are growing the fastest?
- Which cloud infrastructure segments have the largest market size?
- How is the market distributed across deployment types, enterprise sizes, and industries?

## Key Findings

| Metric | Finding |
|---|---:|
| 2024 Global Market Size | **$445.15B** |
| 2035 Global Market Size | **$1.42T** |
| 2024–2035 CAGR | **12.31%** |
| 2024–2035 Market Growth | **219.28%** |
| Largest Region in 2024 | **North America** |
| Largest Service Segment | **Compute Infrastructure** |
| Largest Deployment Segment | **Public Cloud** |
| Largest Enterprise Segment | **SMEs** |

## Regional Market Share — 2024

| Region | Market Share |
|---|---:|
| North America | 38.08% |
| Asia Pacific | 27.04% |
| Europe | 25.04% |
| MEA | 5.64% |
| South America | 4.20% |

## Market Segmentation

The analysis covers:

### Service Type

- Compute Infrastructure
- Storage Infrastructure
- Networking Infrastructure

### Deployment Type

- Public Cloud
- Private Cloud
- Hybrid Cloud

### Enterprise Size

- SMEs
- Large Enterprises

### End-User Industries

- BFSI
- IT & Telecom
- Healthcare
- Retail & E-commerce
- Manufacturing
- Government & Public Sector
- Media & Entertainment
- Transportation & Logistics
- Education
- Others

## Python Analysis

Python/Pandas was used for:

- Data loading and validation
- Missing-value checks
- Dataset structure validation
- Market growth calculations
- CAGR calculations
- Regional market ranking
- Country market analysis
- Segment analysis
- Exporting analysis-ready datasets

## SQL Analysis

SQL analysis was performed using **DuckDB** to answer business questions such as:

- Global market size by year
- Regional market ranking
- Regional CAGR
- Regional year-over-year growth
- Market share calculations
- Largest segment by category
- Top market segments
- Global market growth
- Regional contribution to global market

SQL techniques used include:

- `GROUP BY`
- `ORDER BY`
- `CASE WHEN`
- `JOIN`
- `CTE`
- `LAG()`
- `RANK()`
- `ROW_NUMBER()`
- Window functions

## Tableau Dashboard

Explore the interactive Cloud Infrastructure Services Market dashboard:

**[View Interactive Dashboard on Tableau Public](https://public.tableau.com/app/profile/parvati.kote/viz/Cloud_Infrastructure_Market_Intelligence_twbx/CloudInfrastructureServicesMarketIntelligence20192035AndasmallsubtitleGlobalmarketoutlookregionalperformancesegmentanalysis)**

The dashboard covers:

- Global market size and growth trends (2019–2035)
- Regional market analysis
- Cloud infrastructure market segmentation

## Dashboard Preview

![Cloud Infrastructure Services Market Intelligence](Cloud%20Infrastructure%20Services%20Market%20Intelligence%20%7C%202019%E2%80%932035And%20a%20small%20subtitle_Global%20market%20outlook%2C%20regional%20performance%20%26%20segment%20analysis.png)

## Project Workflow

```text
Market Research Data
        ↓
Python / Pandas
Data Cleaning & Validation
        ↓
SQL / DuckDB
Business Analysis
        ↓
Tableau
Interactive Visualization
        ↓
Market Intelligence Insights
