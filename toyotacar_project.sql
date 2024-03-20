SELECT * FROM project.toyota;
-- 1.What are the unique models of Toyota cars in the dataset?
select distinct (model) from toyota;
-- 2. How many Toyota cars were manufactured in each year?
select `year`, count(*) Total_car from toyota
group by `year`;
-- 3.  What is the average price of Toyota cars?
select avg(price) avg_price from toyota;
-- 4. What is the average mileage of Toyota cars?
select avg(mileage) avg_mileage from toyota;
-- 5. What are the different transmission types used in Toyota cars?
select distinct(transmission) from toyota;
-- 6. How does the tax amount vary for Toyota model?
 select model,avg(tax) avg_tax from toyota
 group by model
 order by avg_tax desc;
 -- 7. What is the average miles per gallon (mpg) of Toyota cars?
 select  avg(mpg) avg_mpg from toyota;
 -- 8 .What is the distribution of fuel types among Toyota cars?
select fuelType, COUNT(*) AS count from toyota
group by fuelType;
 -- 9.How does the engine size vary among model?
select model, engineSize, count(*) from toyota
group by model, engineSize
ORDER BY count(*) desc;
-- 10.How does the price vary with the year of manufacture for Toyota cars?
select `year`, avg(price) from toyota
group by `year`;
-- 11. what is the average price, average tax and  average mileage of petrol fuelType?
select fuelType, AVG(price) average_price,AVG(tax) average_tax,AVG(mileage) average_mileage
from toyota
where fuelType = "Petrol";

-- 12. Which model has the highest average price?
select model, avg(price) avg_price from toyota
group by model
order by avg_price desc limit 1;

-- 13. How many Toyota cars have a mileage between 50000 and 100000?
select count(*) as count from toyota
where mileage between 50000 and 100000;

-- 14. What are the engine sizes with an average price higher than $30,000
select engineSize, avg(price) avg_price from toyota
group by engineSize
having avg_price > 30000;

-- 15.find the top three model with the highest avg price that have petrol fueltype and mileage higher than 20000 and don't consider models which have less than 20 car.
select model, avg(price) avg_price  from toyota
where fuelType = "Petrol" and mileage >20000
group by model
having count(*) > 20
order by avg_price desc limit 3;
-- 16. What is the average tax for Toyota cars with a mileage greater than 80000, grouped by transmission type, where the average tax is less than 150?
select transmission,avg(tax) avg_tax from toyota
where mileage >80000
group by transmission
having avg_tax < 150;
-- 17. What is the average price of Toyota cars that have a mileage greater than the average mileage of all Toyota cars?
select  avg(price) avg_price from toyota
where mileage >( select avg(mileage) from toyota);

-- 18. What is the average tax of Toyota cars that have a transmission type of 'Manual' and an engine size greater than the average engine size of all Toyota cars?
select avg(tax) from toyota
where transmission = 'Manual' and engineSize > (select avg(engineSize) from toyota);

--  19. How many Toyota cars have a mileage less than the average mileage of Toyota cars with a price greater than 20000?
select count(*) total from toyota
where mileage < (select avg(mileage) from toyota where price >20000);

-- 20. Create a new column 'tax_category' that categorizes cars into 'Low Tax' for cars with tax less than 100, 'Medium Tax' for cars with tax between 100 and 200, and 'High Tax' for cars with tax greater than or equal to 200?
select tax , (case
when tax < 100 then 'Low Tax'
when tax between 100 and 200 then 'Medium Tax'
else 'High Tax'
end) as tax_category from toyota;

-- 21 . Create a new column 'engine_size_category' that categorizes cars into 'Small' for 
-- cars with engine size less than 2.0, and 'Large' for cars with engine size greater than or equal to 2.0.
alter table toyota add	column engine_size_category varchar(255);
update toyota
set engine_size_category = (case when engineSize < 2.0 then 'Small'
else 'Large'
end);


