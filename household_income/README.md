# Household Income Analysis (Self-Employment Focus)

## Business Context
Understanding the distribution of self-employed households across neighborhoods can help policymakers and local planners identify areas that may benefit from targeted economic programs.

This project focuses on preparing and analyzing household income data to examine the presence of self-employed income at the neighborhood level.

---

## Dataset Overview
- Dataset contains household-level income information by neighborhood
- Includes indicators for self-employed income
- Raw data contained:
  - inconsistent categorical values
  - unnecessary columns
  - blank and noisy fields
  - formatting issues not suitable for direct analysis

---

## Tools Used
- **OpenRefine** — primary data cleaning and standardization
- **Power BI** — data modeling and visualization

---

## Data Cleaning & Preparation
Instead of cleaning directly in Excel, **OpenRefine** was chosen to handle the messy, real-world nature of the dataset.

Cleaning steps included:
- Removing irrelevant columns
- Renaming columns for clarity and consistency
- Clustering and standardizing categorical values
- Handling blank and malformed entries
- Ensuring fields were analysis-ready before visualization

This step ensured that downstream analysis in Power BI was based on **reliable and structured data**.

---

## Analysis Approach
After cleaning:
- Data was imported into Power BI
- Aggregations were created at the neighborhood level
- Graphs and cards were made to show the information

---

## Key Insights
- Households with self-employed income represent a **small proportion** of total households across most neighborhoods
- Self-employed income is **not evenly distributed**, with some neighborhoods showing higher concentration than others

---

## Business Implications
- Policymakers may need targeted support for self-employed households rather than broad programs
- Every neighbourhood needs a different set of policy to increase economic productivity 

---

## Limitations
- Analysis is limited to available indicators in the dataset
- Does not capture income magnitude, only presence of self-employment
- Results should be interpreted as indicative, not definitive

---

## Dashboard Preview
![Dashboard Preview](self_employed_dashboard.png)
