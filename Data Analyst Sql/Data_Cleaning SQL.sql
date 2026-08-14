                                                -- Data Cleaning

-- select * from layoffs;


                                             -- 1. Remove Duplicates
						                     -- 2. Standardize the data
						                     -- 3. Null Values and Blank values
											 -- 4. Remove Any Columns  




-- create table layoffs_stagging
-- like layoffs;


-- select *  from layoffs_stagging;


-- insert layoffs_stagging 
-- select * from layoffs


-- select *, 
-- row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, `date`,stage, country, funds_raised_millions)  AS Row_Num
-- from layoffs_stagging;
-- -- 





-- with duplicates_CTE AS
-- (select *, 
-- row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)  AS Row_Num
-- from layoffs_stagging
-- )
-- select * from duplicates_CTE
-- where Row_Num > 1;

-- select * from layoffs_stagging
-- where company = 'Oda'





-- with duplicates_CTE2 AS
-- (select *, 
-- row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)  AS Row_Num
-- from layoffs_stagging
-- )
-- delete from 
-- duplicates_CTE2
-- where Row_Num > 1;




-- CREATE TABLE `layoffs_stagging2` (
--   `company` text,
--   `location` text,
--   `industry` text,
--   `total_laid_off` int DEFAULT NULL,
--   `percentage_laid_off` text,
--   `date` text,
--   `stage` text,
--   `country` text,
--   `funds_raised_millions` int DEFAULT NULL,
--   `Row_Num` int
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- insert into layoffs_stagging2
-- select *, 
-- row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions)  AS Row_Num
-- from layoffs_stagging
-- ;
-- select * from layoffs_stagging2;

-- select * from layoffs_stagging2
-- where row_num > 1;


-- delete 
-- from layoffs_stagging2
-- where row_num > 1;

-- select * from layoffs_stagging2




                                       -- Standardizing data (finding issue of your data)

-- select company, trim(company) 
-- from layoffs_stagging2;

-- update layoffs_stagging2
-- set company = trim(company);



-- select distinct industry
-- from layoffs_stagging2;

-- update layoffs_stagging2
-- set industry = 'Crypto'
-- where industry  like 'Crypto%';

-- select * from layoffs_stagging2




-- select distinct country, trim(trailing '. ' from  country)
-- from layoffs_stagging2
-- order by 1;

-- update layoffs_stagging2
-- set country = trim(trailing '. ' from  country)
-- where country like 'United States%';



-- select `date`,
-- str_to_date(`date`, '%m/%d/%Y')
-- from layoffs_stagging2;

-- update layoffs_stagging2
-- set `date` = str_to_date(`date`, '%m/%d/%Y');


-- ALTER TABLE layoffs_stagging2
-- modify column `date` DATE ;

-- select * from layoffs_stagging2;


-- select *
-- from layoffs_stagging2
-- where total_laid_off is null
-- and percentage_laid_off is null;



-- select distinct industry
-- from layoffs_stagging2
-- order by 1;


-- select * from layoffs_stagging2
-- where industry is null
-- or industry = '';



-- select t1.industry, t2.industry 
-- from layoffs_stagging2 t1
-- join layoffs_stagging2 t2
--       on t1.company = t2.company 
-- where (t1.industry is null or t1.industry = '')
-- and t2.industry is not null;





-- update layoffs_stagging2 t1
-- join layoffs_stagging2 t2
--       on t1.company = t2.company 
-- set t1.industry = t2.industry
-- where t1.industry is null 
-- and t2.industry is not null;      







-- select * from layoffs_stagging2
-- where total_laid_off is null
-- and percentage_laid_off is null;



-- delete from layoffs_stagging2
-- where total_laid_off is null
-- and percentage_laid_off is null;


-- Alter table layoffs_stagging2
-- drop column Row_Num;

-- select * from layoffs_stagging2
