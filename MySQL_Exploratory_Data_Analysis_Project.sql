-- Exploratory Data Analysis

Select *
From layoffs_staging2
;

Select MAX(total_laid_off), MAX(percentage_laid_off)
From layoffs_staging2
;

Select *
From layoffs_staging2
Where percentage_laid_off = 1
;

Select *
From layoffs_staging2
Where percentage_laid_off = 1
Order By total_laid_off DESC
;

Select *
From layoffs_staging2
Where percentage_laid_off = 1
Order By funds_raised_millions DESC
;

Select company, SUM(total_laid_off)
From layoffs_staging2
Group by company
Order By 2 DESC
;

Select MIN(`date`), MAX(`date`)
From layoffs_staging2
;

Select industry, SUM(total_laid_off)
From layoffs_staging2
Group by industry
Order By 2 DESC
;


Select country, SUM(total_laid_off)
From layoffs_staging2
Group by country
Order By 2 DESC
;

Select YEAR(`date`), SUM(total_laid_off)
From layoffs_staging2
Group by YEAR(`date`)
Order By 1 DESC
;

Select stage, SUM(total_laid_off)
From layoffs_staging2
Group by stage
Order By 1 DESC
;

Select SUBSTRING(`date`,1,7) As `MONTH`, SUM(total_laid_off)
From layoffs_staging2
Where SUBSTRING(`date`,1,7) Is Not Null
Group by `MONTH`
Order By 1 ASC
;

With Rolling_Total As
(
Select SUBSTRING(`date`,1,7) As `MONTH`, SUM(total_laid_off) As total_off
From layoffs_staging2
Where SUBSTRING(`date`,1,7) Is Not Null
Group by `MONTH`
Order By 1 ASC
)
Select `MONTH`, total_off
,SUM(total_off) Over(Order by `MONTH`) As rolling_total
From Rolling_Total
;

Select company, SUM(total_laid_off)
From layoffs_staging2
Group by company
Order By 2 DESC
;

Select company, YEAR(`date`), SUM(total_laid_off)
From layoffs_staging2
Group by company, YEAR(`date`)
Order by company ASC
;

Select company, YEAR(`date`), SUM(total_laid_off)
From layoffs_staging2
Group by company, YEAR(`date`)
Order by 3 DESC
;

With Company_Year (company, years, total_laid_off)AS
(
Select company, YEAR(`date`), SUM(total_laid_off)
From layoffs_staging2
Group by company, YEAR(`date`)
), Company_Year_Rank AS
(
Select *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
From Company_Year
Where years IS NOT NULL
)
Select *
From Company_Year_Rank
Where Ranking <= 5
;








