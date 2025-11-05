# Covid SQL Analysis

**SQL Data Exploration and Analysis of the COVID-19 Dataset**
Inspired by AlexTheAnalyst’s tutorial, with personalized analysis and formatting enhancements.

# Description

This project explores global COVID-19 data using SQL to uncover insights about infection trends, death rates, and vaccination progress.
It focuses on transforming raw data into actionable insights using real-world data analysis techniques.

# Tools Used

SQLite (via DB Browser)

SQL for data cleaning, aggregation, and exploration

Excel for initial data loading and structure review

Key Queries and Insights

Total cases vs. total deaths per country

Infection rate compared to population

Global death percentage trends

Vaccination rollout analysis using window functions

Example Query
SELECT location, date, total_cases, total_deaths, 
       (total_deaths * 1.0 / total_cases) * 100 AS DeathPercentage
FROM CovidDeaths
ORDER BY 1, 2;

Dataset Source

Data from Our World in Data (OWID) — the COVID-19 global dataset.
https://ourworldindata.org/covid-data
