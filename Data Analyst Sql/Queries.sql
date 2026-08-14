
-- select * from employee_demographics
-- inner join employee_salary
-- on employee_demographics.employee_id = employee_salary.employee_id


-- select * from employee_demographics AS dem
-- left join employee_salary AS sal
-- on dem.employee_id = sal.employee_id


-- select * from employee_demographics AS dem
-- right join employee_salary AS sal
-- on dem.employee_id = sal.employee_id


-- select gender, avg(age) 
-- from employee_demographics
-- group by gender 
-- having avg(age) > 40


-- select first_name, last_name
-- from employee_demographics
-- union
-- select first_name, last_name
-- from employee_demographics


-- select first_name , last_name,
-- concat(first_name ,'   ',last_name) AS Full_name
-- from employee_demographics

                                                -- CASE STATEMENT
-- select first_name,last_name,age,
-- case 
--     when age <= 30 then 'YOUNG' 
--     when age between 30 and 50 then 'OLD'
--     when age >= 50 then 'High Age'
-- end AS Age_Bracket   
-- from employee_demographics



-- select first_name, last_name, salary,
-- case
--     when salary < 50000 then salary + (salary * 0.05) 
--     when salary > 50000 then salary + (salary * 0.07)
-- end AS New_salary,
-- case
--      when dept_id = 6 then salary + (salary * .10)
-- end AS Bonus_salary
-- from employee_salary


                                                         -- SUBQUERY
														
-- select * from employee_demographics
-- where employee_id in
-- (select employee_id 
-- from employee_salary
-- where dept_id = 1
-- )



-- select first_name, salary, 
-- (select avg(salary)
-- from employee_salary
-- ) AS Avg_Salary
-- from employee_salary


-- select gender, 
-- avg(age), 
-- min(age), 
-- max(age), 
-- count(age) 
-- from employee_demographics 
-- group by gender


-- select gender, avg(`max(age)`)
-- from (select gender, avg(age), min(age), max(age), count(age)
-- from  employee_demographics 
-- group by gender) AS Age_Table
-- group by gender


                                                        -- WINDOW FUNCTION
                                        --                 
-- select gender, avg(salary) AS Avg_salary
--  from employee_demographics dem 
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender


-- select dem.first_name, dem.last_name ,gender, avg(salary) over(partition by gender) 
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id 




-- select dem.first_name, dem.last_name ,gender, salary,
-- Sum(salary) over(partition by gender order by dem.employee_id) AS Rolling_Total 
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id 



-- select dem.employee_id, dem.first_name, dem.last_name ,gender, salary,
-- row_number() over(partition by gender order by salary desc) AS Row_Num,
-- rank() over(partition by gender order by salary desc) AS RANK_Num
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id 



                                               -- CTE Common Table Expression
               
-- with CTE_Example AS(               
-- select gender, avg(salary) AS Avg_sal, max(salary) AS Max_sal, min(salary) AS Min_sal, count(salary) AS Count_sal 
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender
-- )select avg(Avg_sal)
-- from CTE_Example





-- select Avg(Avg_sal)from 
-- (               
-- select gender, avg(salary) AS Avg_sal, max(salary) AS Max_sal, min(salary) AS Min_sal, count(salary) AS Count_sal 
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender
-- ) example_subquery



-- with CTE_Example AS 
-- (select first_name, employee_id,gender,birth_date
-- from employee_demographics
-- where birth_date > '1985-01-01'
-- ),
-- CTE_Example2 AS
-- (
-- select employee_id,salary  
-- from employee_salary
-- where salary > 50000 
-- )
-- select * 
-- from CTE_Example
-- join CTE_Example2
-- on CTE_Example.employee_id = CTE_Example2.employee_id






-- with CTE_Example(Gender, Avg_sal, Max_sal, Min_sal, Count_sal) AS 
-- (select gender, avg(salary) AS Avg_sal, max(salary) AS Max_sal, min(salary) AS Min_sal, count(salary) AS Count_sal 
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender
-- )
-- select * from CTE_Example




                                         -- Temporary Table
                                         
-- create temporary table Temp_table(
-- first_name varchar(50),
-- last_name varchar(50),
-- Favourite_Movie varchar(50)
-- );

-- Insert into Temp_table
-- values('Kanu','soni','Dhurendar'),
-- ('Kanahiya','Lal','hum sath sath han'),
-- ('Kanu','narseeghani','hum ap ka han kon'),
-- ('Kani','soni','Dhoom');

-- select * from Temp_table


-- create temporary table salary_over_50k
-- select * from employee_salary
-- where salary >= 50000;
-- select * from salary_over_50k



-- create temporary table Age
-- select * from employee_demographics 
-- where age >= 40;
-- select * from Age



                                                 -- Procedure
-- create procedure Large_salaries()
-- select * from employee_salary
-- where salary >= 50000;
-- CALL Large_salaries()


-- DELIMITER $$ 
-- create procedure Large_salaries2()
-- BEGIN
-- 	select * from employee_salary
-- 	where salary >= 50000;
-- 	select * from employee_salary
-- 	where salary >= 10000;
-- END $$
-- DELIMITER ;
-- CALL Large_salaries2()




-- DELIMITER $$ 
-- create procedure Large_salaries3(p_employee_id int)
-- BEGIN
-- 	select salary from employee_salary
--     where employee_id = p_employee_id;
-- END $$
-- DELIMITER ;
-- CALL Large_salaries3(1)




-- DELIMITER $$ 
-- create procedure Large_salaries4(p_employee_id int)
-- Begin
--     select salary
--     from employee_salary
-- 	where employee_id = p_employee_id;
-- end $$
-- DELIMITER ;
-- call Large_salaries4(1)




                                       -- Triggers and Events

-- DELIMITER $$ 
-- create trigger employee_insert
--     After insert on employee_salary
--     for each row
-- Begin
--     insert into employee_demographics(employee_id,first_name,last_name)
--     values(New.employee_id, New.first_name, New.last_name);
-- end $$
-- DELIMITER ;

-- insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
-- values(13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO', 1000000, NULL);


                                                    -- EVENTS
                                                    
           --                                          
-- select * from employee_demographics;                                               

-- DELIMITER $$    
-- create event delete_retires
-- on schedule every 30 second
-- do
-- begin
-- delete  
-- from employee_demographics
-- where age >= 60;
-- end $$
-- DELIMITER ;
-- show variables like 'event%';




