-- Data Cleaning

Select *
From layoffs
;

-- Remove Duplicates
-- Standardize the Data
-- Null Values or blank values
-- Remove Any Columns or Rows

Create Table layoffs_staging
Like layoffs
;

Select *
From layoffs_staging
;

Insert layoffs_staging
Select *
From layoffs
;


Select *,
Row_Number() Over(
partition by company, industry, total_laid_off, percentage_laid_off, 'date') As row_num
From layoffs_staging
;

With duplicate_cte As
(
Select *,
Row_Number() Over(
partition by company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) As row_num
From layoffs_staging
)
Select *
From duplicate_cte
Where row_num >1
;

Select *
From layoffs_staging
Where company = 'Casper'
;


With duplicate_cte As
(
Select *,
Row_Number() Over(
partition by company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) As row_num
From layoffs_staging
)
Delete
From duplicate_cte
Where row_num >1
;


CREATE TABLE `layoffs_staging2`(
`company` text,
`location` text,
`industry` text,
`total_laid_off` int DEFAULT NULL,
`percentage_laid_off` text,
`date` text,
`stage` text,
`country` text,
`funds_raised_millions` int DEFAULT NULL,
`row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Select *
From layoffs_staging2
;

Insert Into layoffs_staging2
Select *,
Row_Number() Over(
partition by company, location, 
industry, total_laid_off, percentage_laid_off, 'date', stage, 
country, funds_raised_millions) As row_num
From layoffs_staging
;

Select *
From layoffs_staging2
Where row_num > 1;

Delete 
From layoffs_staging2
Where row_num > 1;


Select *
From layoffs_staging2
;

-- Standardizing data

Select Distinct (TRIM(company))
From layoffs_staging2
;

Select company, TRIM(company)
From layoffs_staging2
;


Update layoffs_staging2
Set company = TRIM(company)
;


Select distinct industry
From layoffs_staging2
Order By 1
;

Select *
From layoffs_staging2
Where industry Like 'Crypto%'
;

Update layoffs_staging2
Set industry = 'Crypto'
Where industry Like 'Crypto%'
;

Select distinct industry
From layoffs_staging2
;

Select *
From layoffs_staging2
;

Select distinct location
From layoffs_staging2
;

Select *
From layoffs_staging2
;

Select distinct country
From layoffs_staging2
Order by 1;

Select distinct country, TRIM(Trailing '.' From country)
From layoffs_staging2
Order by 1
;

Update layoffs_staging2
Set country = TRIM(Trailing '.' From country)
Where country Like 'United States%'
;

Select *
From layoffs_staging2
;

Select `date`
From layoffs_staging2
;

Select `date`,
STR_TO_DATE (`date`, '%m/%d/%Y')
From layoffs_staging2
;

Update layoffs_staging2
Set `date` = STR_TO_DATE (`date`, '%m/%d/%Y')
;

Select *
From layoffs_staging2
;

Alter Table layoffs_staging2
Modify Column `date` date
;

Select *
From layoffs_staging2
;

Select *
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null
;

Select distinct industry
From layoffs_staging2
;

Select *
From layoffs_staging2
Where industry Is Null
or industry = ''
;

Select *
From layoffs_staging2
Where company = 'Airbnb'
;

Update layoffs_staging2
Set industry = Null
Where industry = ''
;


Select *
From layoffs_staging2 As t1
Join layoffs_staging2 As t2
	On t1.company = t2.company
Where t1.industry Is Null
And t2.industry Is Not Null
;

Update layoffs_staging2 t1
Join layoffs_staging2 t2
	On t1.company = t2.company
Set t1.industry = t2.industry
Where t1.industry Is Null
And t2.industry Is Not Null
;

Select *
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null
;

Delete
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null
;


Select *
From layoffs_staging2
;

Alter Table layoffs_staging2
Drop column row_num
;

Select *
From layoffs_staging2
;