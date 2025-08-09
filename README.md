# World Layoffs Data Cleaning & Exploration (MySQL Project)

## Welcome to MySQL data cleaning and data exploration project on the world layoffs

## 📌 Project Overview

This project involves cleaning and analyzing a World Layoffs dataset covering the period 2020–2023. The dataset contains details on company layoffs, industry, location, and funding information.

## Objective
The main objective was to clean the dataset to ensure accuracy and consistency, then explore trends and patterns in global layoffs.

### 🛠 Tools & Technologies
MySQL (Data cleaning, transformation, and analysis)

🧹 Data Cleaning Steps
Removed Duplicates using window functions and ROW_NUMBER().

Removed Extra Spaces using string functions (TRIM, LTRIM, RTRIM).

Standardized Data formats for industry, location, and country names.

Handled Missing or Blank Values by replacing or removing them.

Dropped Unnecessary Columns for a cleaner dataset.

### 📈 Skills & SQL Features Used
GROUP BY & ORDER BY

HAVING & WHERE clauses

LIMIT & Aliasing

CASE statements

Joins (INNER, LEFT)

String functions (TRIM, UPPER, LOWER, REPLACE)

Subqueries & Unions

Window functions (ROW_NUMBER, RANK)

Stored Procedures

Temporary Tables

Triggers & Events

### 📊 Dataset Columns
company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions

[Check out my work](MySQL_Data_Cleaning_Project.sql)
<img width="1055" height="616" alt="MySQL" src="https://github.com/user-attachments/assets/6e6fa63e-26cd-4d02-9891-b6090e61a642" />



### 🔍 Data Exploration Highlights
After cleaning, I explored the dataset to identify trends and patterns, including:

Top companies with the most layoffs

Top industries affected by layoffs

Percentage of workforce laid off by company

Year with the highest number of layoffs

Layoffs by country and funding stage

### ✅ Outcome
The final dataset is clean, standardized, and ready for further visualization in Tableau or Power BI. Insights from this project can help understand the global impact of layoffs during 2020–2023.

[Check out my work](MySQL_Exploratory_Data_Analysis_Project.sql)
<img width="1055" height="600" alt="Explore" src="https://github.com/user-attachments/assets/174774fb-f2b0-400b-97c3-f8a58d3cc731" />

