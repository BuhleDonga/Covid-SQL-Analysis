# Covid SQL Analysis

**SQL Data Exploration and Analysis of the COVID-19 Dataset**
*Inspired by AlexTheAnalyst’s tutorial, with personalized analysis and formatting enhancements.*

---

## Description

This project utilizes SQL to analyze global COVID-19 data, uncovering insights into infection trends, mortality rates, and vaccination progress.
It focuses on transforming raw data into actionable insights using real-world data analysis techniques.

---

### Tools Used

- **SQLite** (via DB Browser)

- **SQL** for data cleaning, aggregation, and exploration

- **Excel** for initial data loading and structure review

---

## Key Queries and Insights

1. Total cases vs. total deaths per country

2. Infection rate compared to population

3. Global death percentage trends

4. Vaccination rollout analysis using window functions

---

## Example Query

SELECT location, date, total_cases, total_deaths, 
       (total_deaths * 1.0 / total_cases) * 100 AS DeathPercentage
FROM CovidDeaths
ORDER BY 1, 2;

---

## Dataset Source

Data from Our World in Data (OWID) — the COVID-19 global dataset.
(https://ourworldindata.org/covid-deaths)
