                                          -- Exploratory Data Analysis
                                           
-- select * from layoffs_stagging2

-- select max(total_laid_off), max(percentage_laid_off) 
-- from layoffs_stagging2


-- select * from layoffs_stagging2
-- where percentage_laid_off = 1
-- order by funds_raised_millions desc;


-- select company, sum(total_laid_off), sum(percentage_laid_off)
-- from layoffs_stagging2
-- group by company
-- order by 2 desc


-- select min(`date`), max(`date`)
-- from layoffs_stagging2


-- select industry, sum(total_laid_off) 
-- from layoffs_stagging2
-- group by industry
-- order by 2 desc;



-- select country, sum(total_laid_off) 
-- from layoffs_stagging2
-- group by country
-- order by 2 desc;

-- select * from layoffs_stagging2;


-- select year(`date`), sum(total_laid_off) 
-- from layoffs_stagging2
-- group by  year(`date`)
-- order by 1 desc


-- select stage, sum(total_laid_off) 
-- from layoffs_stagging2
-- group by stage
-- order by 2 desc


-- select company, sum(percentage_laid_off) 
-- from layoffs_stagging2
-- group by company
-- order by 2 desc



-- select substring(`date`,1,7) AS `Month`, sum(total_laid_off) 
-- from layoffs_stagging2
-- where substring(`date`,1,7) is not null
-- group by `Month`
-- order by 1 asc;



                                                        -- CTE

-- with Rolling_Total AS 
-- (
-- select substring(`date`,1,7) AS `Month`, sum(total_laid_off) AS Total_off
-- from layoffs_stagging2
-- where substring(`date`,1,7) is not null
-- group by `Month` 
-- order by 1 asc
-- )
-- select `Month`, Total_off,
-- sum(Total_off) over(order by `Month`) AS Rolling_Total
-- from Rolling_Total



-- select company , sum(total_laid_off) 
-- from layoffs_stagging2
-- group by company
-- order by 2 desc



-- select company, year(`date`), sum(total_laid_off) 
-- from layoffs_stagging2
-- group by company, year(`date`)
-- order by company 



-- with Company_Year (company, years, total_laid_off) AS
-- (
-- select company, year(`date`), sum(total_laid_off) 
-- from layoffs_stagging2
-- group by company, year(`date`)
-- ), 
-- Company_Year_Rank AS 
-- (
-- select *, 
-- dense_rank()  over(partition by years order by total_laid_off desc) AS Ranking
-- from Company_Year
-- where years is not null
-- )
-- select * from Company_Year_Rank 
-- where Ranking <= 5
