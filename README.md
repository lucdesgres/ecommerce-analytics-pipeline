# E-Commerce Analytics Pipeline

An end-to-end data pipeline analyzing the Olist Brazilian e-commerce dataset — from raw CSVs through cleaning, SQL analysis, and an interactive Power BI dashboard.

## Business Questions

1. Which product categories drive the most revenue, and how has that shifted month to month?
2. How does delivery delay affect review scores?
3. What does customer repeat-purchase behavior look like?
4. Which states generate the most revenue, and how does delivery speed vary by region?

## Key Findings

- **Revenue grew steadily** from late 2016 through 2018, with consistent contribution across the top 10 product categories.
- **Delivery delay strongly predicts satisfaction**: average review score drops from 4.3 stars (early deliveries) to 1.7 stars (very late deliveries).
- **Repeat purchases are rare**: only 3% of customers placed more than one order — a known characteristic of this marketplace, not a data quality issue.
- **São Paulo dominates revenue** and also has the fastest delivery (8.7 days on average). The slowest states (RR, AP, AM) take up to 28 days — roughly 3x longer.

## Dashboard

![Dashboard](dashboard/screenshot_ecommerce_dashboard.png)

## Tools & Methods

- **Data cleaning:** Python (pandas) — handled missing values, converted timestamps, deduplicated records
- **Database:** SQLite
- **Analysis:** SQL — multi-table joins, aggregate functions, date arithmetic (see the `sql` folder)
- **Visualization:** Power BI

## Project Structure

- `data/processed/query_results/` — aggregated CSV outputs used in Power BI
- `notebooks/01_load_data.ipynb` — loads raw CSVs into SQLite
- `notebooks/02_clean_data.ipynb` — handles missing values, fixes data types
- `notebooks/03_analysis.ipynb` — runs analysis queries, exports results
- `sql/` — standalone SQL queries for each business question
- `dashboard/screenshot_ecommerce_dashboard.png` — dashboard screenshot

## Data Source

[Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle). Raw CSVs are excluded from this repo — download them into `data/raw/` to reproduce.

## Reproducing This Project

1. Download the dataset into `data/raw/`
2. Run the notebooks in order: `01_load_data.ipynb` then `02_clean_data.ipynb` then `03_analysis.ipynb`
3. Import the CSVs from `data/processed/query_results/` into Power BI to rebuild the dashboard