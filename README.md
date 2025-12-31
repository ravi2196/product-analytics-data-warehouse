# Product Analytics Data Warehouse & KPI Engine

## Overview

This project demonstrates an end-to-end **Product Analytics Data Warehouse** built using real-world e-commerce data. It integrates **CRM and ERP source systems**, applies a **Bronze–Silver–Gold architecture**, and delivers business-critical **KPIs for growth, retention, engagement, and revenue** using SQL and Python.

The project is designed to mirror how analytics platforms are built in large-scale technology companies (Meta, Amazon, SaaS products).

---

## Business Problem

Product and growth teams require reliable, scalable analytics to answer questions such as:

* How many users are active daily and monthly?
* How well are users retained over time?
* Which customers generate the most revenue?
* How does geography, product, or payment method impact revenue?

Raw operational data from multiple systems (CRM and ERP) must be unified and transformed into analytics-ready datasets.

---

## Data Sources

### Source CRM (Customer-Centric)

* Customers
* Sellers
* Geolocation

### Source ERP (Transactional & Operational)

* Orders
* Order Items
* Payments
* Products
* Reviews

Dataset used: **Olist Brazilian E-Commerce Dataset** (public, real-world data).

---

## Architecture

The warehouse follows a **Modern Analytics Architecture**:

### Bronze Layer (Raw)

* Source-aligned tables
* No transformations
* Append-only ingestion

### Silver Layer (Cleaned & Integrated)

* Data cleansing and standardization
* CRM–ERP joins
* Business-ready entities

### Gold Layer (Analytics)

* Star schema (Facts & Dimensions)
* KPI-optimized tables

---

## Data Modeling

### Dimensions

* `dim_customers`
* `dim_products`
* `dim_sellers`
* `dim_date`

### Fact Tables

* `fact_orders`
* `fact_revenue`
* `fact_reviews`

This structure supports efficient analytical queries and KPI computation.

---

## KPIs Implemented

* Daily / Monthly Active Users (DAU, MAU)
* Customer Retention & Cohort Analysis
* Revenue & Average Revenue Per User (ARPU)
* Customer Lifetime Value (LTV)
* Order & Payment Performance

All KPIs are derived directly from Gold-layer tables using optimized SQL.

---

## Tools & Technologies

* **SQL (SQL Server / ANSI SQL)**
* **Python** (Pandas, Faker – optional for data generation)
* **Data Modeling (Star Schema)**
* **Analytics Engineering (Bronze–Silver–Gold)**
* **Data Visualization** (Tableau / Power BI – optional)

---

## Project Structure

```
product-analytics-data-warehouse/
│
├── data/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── sql/
│   ├── bronze/
│   ├── silver/
│   ├── gold/
│   └── kpi/
│
├── pipeline/
│   └── load_data.py
│
├── dashboards/
│   └── screenshots/
│
└── README.md
```

---

## Key Learnings

* Designing analytics systems using CRM and ERP separation
* Building scalable SQL-based transformation layers
* Applying dimensional modeling for product analytics
* Translating raw data into business KPIs

---

## Future Improvements

* Add real-time event data (clickstream)
* Implement data quality checks
* Automate pipeline orchestration
* Deploy dashboards to cloud BI tools

---

## License

This project is licensed under the **MIT License**.  
See the `LICENSE` file in the repository for full license details.

---

## Author

Ravi Shankar Kumar

Aspiring Data Engineer / Product Analytics Professional
