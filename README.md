# Safari Connect Business Performance Analytics

## 📊 Project Overview

**Safari Connect Business Performance Analytics** is an end-to-end data analytics and business intelligence project developed to analyse the performance of a passenger transport business.

The project transforms raw booking and operational data into actionable business insights using **SQL, data transformation, Microsoft Power BI and DAX**. The final solution provides an interactive dashboard covering revenue, passenger behaviour, operations, cancellations and business performance.

The project demonstrates the ability to move from **raw data → data preparation → analysis → visualization → actionable business recommendations**.

---

## 🎯 Business Objective

The objective of the analysis was to provide management with a clear view of business performance and answer key questions around:

* Revenue and booking performance
* Route profitability and revenue contribution
* Passenger demand and demographics
* Fare and seat-class preferences
* Passenger and driver satisfaction
* Trip and operational performance
* Cancellation and no-show patterns
* Lost revenue
* Peak travel and departure periods
* Opportunities for improving operational efficiency and revenue

---

## 🛠️ Tools & Technologies

* **Microsoft Power BI** — Interactive dashboard development and business intelligence
* **DAX** — Measures and KPI calculations
* **Power Query** — Data cleaning and transformation
* **SQL** — Data querying and analysis
* **PostgreSQL / DBeaver** — Database and SQL analysis
* **Microsoft Excel** — Raw data preparation and analysis

---

## 🔄 Analytics Workflow

The project followed an end-to-end analytics workflow:

**Raw Data → Data Cleaning & Transformation → SQL Analysis → Data Modelling → DAX Measures → Power BI Dashboard → Business Insights**

### 1. Data Preparation

The raw transport booking data was prepared for analysis by:

* Reviewing the structure and quality of the source data
* Cleaning and transforming fields
* Preparing data for analysis in Power BI
* Ensuring dates, numerical fields and categorical variables could be analysed effectively

### 2. SQL Analysis

SQL was used to query and analyse the underlying business data.

The analysis included:

* Filtering and aggregating transactional data
* Grouping data by relevant business dimensions
* Analysing routes, bookings and passengers
* Calculating business metrics
* Identifying trends and performance patterns
* Supporting business questions with structured SQL queries

### 3. Power BI & Data Modelling

The transformed data was brought into Power BI to create an interactive business intelligence solution.

The dashboard incorporates:

* Data modelling
* DAX calculations
* KPI development
* Interactive slicers
* Business-focused visualizations
* Comparative and trend analysis
* Multiple analytical views

---

## 📈 Dashboard

The Power BI dashboard provides several analytical views.

### Revenue Analysis

Examines:

* Total revenue
* Monthly revenue trends
* Revenue by route
* Revenue per seat
* Lost revenue
* Route-level revenue performance

### Passenger Insights

Examines:

* Passenger distribution by city
* Seat-class preferences
* Passenger satisfaction
* Booking and passenger behaviour

### Operations

Examines:

* Trips and bookings
* Seats booked by departure hour
* Driver ratings
* Trip ratings
* Operational performance

### Cancellations

Examines:

* Cancellation and no-show rates
* Route-level cancellation performance
* Lost revenue associated with cancellations and no-shows

### Business Insights

The final analysis translates the data into practical findings and recommendations that can support business decision-making.

---

## 🔑 Key Business Insights

The analysis identified several important performance patterns, including:

* **RT001 (Nairobi → Mombasa)** was the highest-revenue route, generating approximately **KSh 51,600**.
* **RT005 (Nairobi → Thika)** recorded the highest passenger demand, with **71 seats sold across 35 bookings**.
* **Wednesday** was identified as the busiest travel day, indicating potential opportunities for additional capacity during peak periods.
* Passenger satisfaction was generally positive, with **114 satisfied passengers compared with 48 unsatisfied passengers**.
* The analysis identified differences in revenue contribution and cancellation/no-show performance across routes.
* Lost revenue analysis highlighted opportunities to reduce the financial impact of cancellations and no-shows.

These insights can support decisions around **capacity planning, route management, customer experience and revenue optimization**.

---

## 📁 Repository Structure

```text
Safari-Connect-Business-Performance-Analytics/
│
├── Data/
│   └── SafariConnect_Raw_Data.xlsx
│
├── Images/
│   ├── SafariConnect_Dashboard.png
│   ├── SafariConnect_Revenue.jpg
│   ├── SafariConnect_Passengers.jpg
│   ├── SafariConnect_Cancellations.jpg
│   └── SafariConnect_Insights.jpg
│
├── Powerbi/
│   └── SafariConnect_Business_Performance_Dashboard.pbix
│
└── Sql/
    └── SafariConnect_Analysis.sql
```

---

## 💡 Skills Demonstrated

### Data Analytics

* Data cleaning and preparation
* Exploratory data analysis
* Business performance analysis
* KPI development
* Trend analysis
* Revenue and operational analysis
* Translating data into actionable insights

### Business Intelligence

* Microsoft Power BI
* Interactive dashboard development
* DAX
* Power Query
* Data modelling
* KPI reporting
* Data visualization

### SQL & Databases

* SQL querying
* Data aggregation
* Filtering and grouping
* Business-focused analytical queries
* Relational data analysis
* PostgreSQL
* DBeaver

### Business & Communication

* Identifying business questions
* Interpreting analytical results
* Communicating insights clearly
* Developing data-driven recommendations
* Problem-solving and analytical thinking

---

## 📸 Dashboard Preview

The `Images` folder contains screenshots of the major analytical views, allowing users to review the dashboard insights without opening the Power BI file.

The complete interactive dashboard is available in:

`Powerbi/SafariConnect_Business_Performance_Dashboard.pbix`

---

## 🚀 Project Outcome

This project demonstrates an end-to-end approach to business intelligence, from working with raw operational data through **SQL analysis, data transformation and modelling to Power BI dashboard development and business insight generation**.

It demonstrates practical experience applying data analytics tools to a real-world business scenario and using data to support **performance monitoring and data-driven decision-making**.
