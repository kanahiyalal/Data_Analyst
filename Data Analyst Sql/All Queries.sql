select * from layoffs_stagging2;

-- select min(total_laid_off) , max(total_laid_off)
-- from layoffs_stagging2

-- select company, location, max(total_laid_off) 
-- from layoffs_stagging2
-- where total_laid_off >= 500
-- group by company, location


-- select company, country , avg(total_laid_off) 
-- from layoffs_stagging2
-- group by company,country
-- having avg(total_laid_off) > 500


-- select country, location
-- from layoffs_stagging2
-- union
-- select country, location 
-- from layoffs_stagging2


-- select country, location,
-- concat(country,'  ',location) AS Full_Address 
-- from layoffs_stagging2


-- select company, country, total_laid_off,
-- case
--    when total_laid_off <= 500 then 'less'
--    when total_laid_off between 500 and 1000 then 'More'
--    when total_laid_off >= 500 then 'More High'
-- end AS Total_Off
-- from layoffs_stagging2



-- select company, percentage_laid_off,
-- (select avg(percentage_laid_off) 
-- from layoffs_stagging2) AS Avg_Total_off
-- from layoffs_stagging2



-- select company, 
-- avg(total_laid_off) as Avg_total ,
-- min(total_laid_off) as min_total,
-- max(total_laid_off) as max_total,
-- sum(total_laid_off) as sum_total
-- from layoffs_stagging2
-- where total_laid_off is not null
-- group by company



-- with Duplicate_CTE AS
-- (select *,
-- row_number() over(partition by company,industry,country, location, total_laid_off, percentage_laid_off, `date`, stage, funds_raised_millions) AS Row_Num
-- from layoffs_stagging2
-- )select * from Duplicate_CTE
-- where  Row_Num >= 1;


-- select * from layoffs_stagging2
-- where company = '2TM'

SET SQL_SAFE_UPDATES = 0;


-- with Duplicate_CTE2 AS
-- (select *,
-- row_number() over(partition by company,industry,country, location, total_laid_off, percentage_laid_off, `date`, stage, funds_raised_millions) AS Row_Num
-- from layoffs_stagging2
-- )
-- delete from Duplicate_CTE2
-- where  Row_Num > 1;


-- select company, trim(company)
-- from layoffs_stagging2;


-- update layoffs_stagging2
-- set company = trim(company)


-- select distinct industry 
-- from layoffs_stagging2;


-- update layoffs_stagging2
-- set industry = 'Crypto Currency'
-- where industry like 'Crypto%';


-- select * from layoffs_stagging2;

-- select country, count(*) AS Count
-- from layoffs_stagging2
-- group by country;



-- select trim(trailing '. ' from country) AS Country, count(*)
-- from layoffs_stagging2
-- group by trim(trailing '. ' from country);


-- select distinct country, trim(trailing '. ' from country)  
-- from layoffs_stagging2
-- order by 1 desc;


-- select `date`,
-- str_to_date(`date`,'%m/%d/%Y') 
-- from layoffs_stagging2;


-- update layoffs_stagging2 
-- set `date` = str_to_date(`date`,'%m/%d/%Y') 


-- Alter table layoffs_stagging2
-- modify column `date` DATE;

-- Select * from layoffs_stagging2;


-- select * from layoffs_stagging2
-- where total_laid_off is not null
-- and percentage_laid_off is not null;


-- select distinct industry 
-- from layoffs_stagging2
-- order by 1


-- select * 
-- from layoffs_stagging2
-- where industry is null
-- or industry = ''




-- select t1.industry , t2.industry
-- from layoffs_stagging2 t1
-- join layoffs_stagging2 t2
--    on t1.company = t2.company
-- where (t1.industry is null or t1.industry = '')
-- and t2.industry is not null;




-- update  layoffs_stagging2 t1
-- join layoffs_stagging2 t2
--     on t1.company = t2.company
-- set t1.industry = t2.industry
-- where t1.industry is null
-- and t2.industry is not null;




-- With Rolling_Total AS
-- (select substring(`date`,1,7) AS `Month`, sum(total_laid_off) AS Total_off  
-- from layoffs_stagging2
-- where substring(`date`,1,7) is not null
-- group by `Month`
-- order by 1 asc
-- )
-- select `Month`, Total_off,
-- sum(Total_off)  over(order by `Month`) AS Rolling_Total 
-- from Rolling_Total




-- with Company_Year(company, years,total_laid_off) AS
-- (select company, year(`date`), sum(total_laid_off) 
-- from layoffs_stagging2
-- group by company,year(`date`)
-- ),
-- Company_Rank_Year AS
-- (select *,
-- dense_rank() over(partition by years  order by total_laid_off desc ) AS Ranking 
-- from Company_Year
-- where years is not null 
-- )
-- select * from Company_Rank_Year
-- where Ranking <= 5;




-- select substring(`date`,1,7) AS Month, sum(total_laid_off) AS Total_off, sum(percentage_laid_off) AS Percentage_off 
-- from layoffs_stagging2
-- where substring(`date`,1,7) is not null
-- group by Month
-- having Total_off >= 500 and Percentage_off > 25