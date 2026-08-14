-- select first_name, last_name , age,
-- case
--     when age < 30 then 'YOUNG'
--     when age between 30 and 50 then 'OLD'
--     when age >= 50 then 'OLD AGE'
-- end AS Age_Bracket
-- from employee_demographics



-- select first_name,last_name,dept_id,salary,
-- case
--     when salary <= 50000 then salary + (salary * 0.05)
--     when salary > 50000 then salary + (salary * 0.07)
-- end AS New_Salary,
-- case
--     when dept_id = 6 then salary + (salary * .10)
-- end AS Bonus_Salary
-- from employee_salary





-- select first_name, last_name, dept_id ,salary, 
-- case
--     when salary < 50000 then salary + (salary * 0.05)
--     when salary > 50000 then salary + (salary * 0.07)
-- end AS New_Salary,
-- case
--     when dept_id = 6 then salary + (salary * .10)
-- end AS Bonus_Salary
-- from employee_salary



-- Select * from employee_demographics
-- where employee_id in
-- (select employee_id from employee_salary
-- where dept_id = 1 ) 



-- select first_name, salary,
-- (select Avg(salary)
--  from employee_salary) AS Avg_salary
-- from employee_salary



-- select gender, avg(age), max(age), min(age), count(age)
--  from employee_demographics
--  group by gender



-- select gender, avg(`max(age)`) AS Max_Age
-- from(select gender, avg(age), max(age), min(age), count(age)
-- from employee_demographics
-- group by gender) AS Age_Table
-- group by gender


-- select gender , avg(`max(age)`) Max_Age
-- from (select gender, avg(age), max(age), min(age), count(age)
-- from employee_demographics group by gender) AS Age_Table
-- group by gender


-- select gender, avg(salary) AS Avg_Salary
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender


-- select dem.first_name, dem.last_name, gender, 
-- avg(salary) over(partition by gender)
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id  = sal.employee_id




-- select dem.first_name, dem.last_name, gender,salary,
-- sum(salary) over(partition by gender order by dem.employee_id) AS Rolling_Total
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id



-- select dem.first_name, dem.last_name,gender,salary,
-- sum(salary) over(partition by gender order by dem.employee_id) AS Rolling_Total
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id






-- select dem.employee_id, dem.first_name, dem.last_name, gender,salary,
-- row_number() over(partition by gender order by salary desc) AS Row_Num,
-- rank() over(partition by gender order by salary desc) AS Rank_Num
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id




-- with CTE_Example AS 
-- (select gender, avg(salary) AS Avg_salary, min(salary) AS Min_salary, max(salary) AS Max_salary, count(salary) AS Count_salary
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender
-- )select Avg(Avg_salary) from CTE_Example




-- select avg(Avg_Sal) from 
-- (select gender, avg(salary) AS Avg_Sal, min(salary) AS Min_Sal, max(salary) AS Max_Sal, count(salary) AS Count_Sal
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender)example_subquery





-- with CTE_Example AS 
-- (select first_name, employee_id,gender,birth_date 
--  from employee_demographics
--  where birth_date >= '1980-01-01'
--  ), 
-- CTE_Example2 AS
-- (select employee_id,salary 
-- from employee_salary
-- where salary >= 60000)
-- select * 
-- from CTE_Example
-- JOIN CTE_Example2
-- on CTE_Example.employee_id = CTE_Example2.employee_id




-- with CTE_Example(Gender,Avg_sal,Min_sal,Max_sal,Count_sal) AS
-- (select gender ,avg(salary) AS Avg_sal, min(salary) AS Min_sal, max(salary) AS Max_sal, count(salary) AS Count_sal
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender)
-- select * from CTE_Example




-- with CTE_Example AS
-- (select first_name,gender,employee_id,birth_date
-- from employee_demographics dem
-- where birth_date >= '1980-01-01'),
-- CTE_Example2 AS
-- (select  employee_id,salary
-- from employee_salary
-- where salary >= 50000
-- )select  * from CTE_Example
-- join CTE_Example2
-- on CTE_Example.employee_id = CTE_Example2.employee_id




-- With CTE_Example(Gender,Avg_sal,Min_sal,Max_sal,Count_sal) AS
-- (select gender ,avg(salary) AS Avg_sal, Min(salary) AS Min_sal, Max(salary) AS Max_sal, count(salary) AS Count_sal 
-- from employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender)
-- select * from CTE_Example




-- select avg(Avg_sal) from 
-- (select gender,avg(salary) AS Avg_sal, Min(salary) AS Min_sal, Max(salary) AS Max_sal, count(salary) AS Count_sal
-- from  employee_demographics dem
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id
-- group by gender) example_subquery




-- select avg(salary) AS Employe_sal
-- from employee_salary


-- select first_name,last_name,employee_id,gender,age
-- from employee_demographics
-- where age >= 40 or gender = 'male' or 'female'



-- select first_name,dept_id,salary
-- from employee_salary
-- where salary between 40000 and 70000




-- select first_name,occupation,salary
-- from employee_salary
-- where occupation like '%man%'



-- select sum(salary) AS Total_Sal
--  from employee_salary


-- select occupation,avg(salary) 
-- from employee_salary  
-- group by occupation
-- having  avg(salary) >= 60000;


-- select occupation, max(salary)
--  from employee_salary
--  group by occupation
--  having max(salary) >= 50000;



-- select concat(first_name,' ',last_name) AS Full_Name, salary,
-- case
--     when salary <= 50000 then 'Low'
--     when salary >= 50000 then 'High'
--     else 'Low'
-- end AS Salary_Level
-- from employee_salary



-- select first_name,last_name , gender
-- from employee_demographics dem 
-- inner join employee_salary sal
-- on dem.employee_id = sal.employee_id 


-- select *
-- from employee_demographics dem 
-- join employee_salary sal
-- on dem.employee_id = sal.employee_id


-- select * 
-- from employee_demographics dem
-- left join employee_salary sal
-- on dem.employee_id = sal.employee_id


-- select * 
-- from employee_demographics dem 
-- right join employee_salary sal
-- on dem.employee_id = sal.employee_id



-- select first_name from employee_demographics 
-- union
-- select * from employee_salary



-- select * from employee_salary
-- where  salary >
-- (select avg(salary) AS Avg_sal from employee_salary) 




-- select distinct salary,first_name
-- from employee_salary
-- order by salary desc
-- limit 1 offset 1


-- select employee_id,first_name,count(*)
-- from employee_demographics
-- group by employee_id,first_name
-- having count(*) = 1



-- select first_name,salary
-- from employee_salary
-- where salary > 50000



-- select first_name,avg(salary) AS Avg_salary 
-- from employee_salary
-- group by first_name
-- having avg(salary) > 50000




-- select first_name,salary,
-- row_number() over(partition by first_name order by salary ) AS Row_Num 
-- from employee_salary



-- select employee_id,first_name,salary,
-- row_number() over(partition by employee_id  order by salary desc ) AS Row_Num
-- from employee_salary 




-- select employee_id,first_name,salary,
-- rank() over(order by salary desc ) AS Rank_Num
-- from employee_salary 


-- with CTE_Salary AS 
-- (select first_name, avg(salary) AS Avg_Salary 
-- from employee_salary)
-- select * from  employee_salary,CTE_Salary
-- where salary > Avg_Salary

