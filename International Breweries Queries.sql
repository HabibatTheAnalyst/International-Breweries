USE SQL_Training
GO 
   
--- creating table
CREATE TABLE breweries 
			(SALES_ID INT, SALES_REP VARCHAR(50), EMAILS VARCHAR(50), BRANDS VARCHAR(50), PLANT_COST INT, UNIT_PRICE INT,
			 QUANTITY INT, COST INT, PROFIT INT, COUNTRIES VARCHAR(50),  REGION VARCHAR(50), MONTHS VARCHAR(50), YEARS INT);

--- loading table
BULK INSERT breweries
FROM 'C:\Users\HP\Downloads\International Breweriess.csv'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);

								--- PROFIT ANALYSIS

--- Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?
SELECT 
	SUM(profit) AS 'total profit'
FROM breweries;

--- compare the total profit between these territories in order for the territory manager to make a strategic decision that will aid profit maximization in 2020
SELECT
	DISTINCT countries AS 'territories'
	,SUM(profit) AS 'total profit'
FROM breweries
GROUP BY countries
ORDER BY [total profit] DESC;
	
--- what country generated the highest profit in 2019?
SELECT
	DISTINCT countries
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE years = '2019'
GROUP BY countries
ORDER BY [total profit] DESC;

--- help him find the year with the highest profit
SELECT
	DISTINCT years
	,SUM(profit) AS 'total profit'
FROM breweries
GROUP BY years
ORDER BY [total profit] DESC;

--- which month in the three years was the least profit generated?
SELECT
	DISTINCT months 
	,SUM(profit) AS 'total profit'
FROM breweries
GROUP BY months
ORDER BY [total profit];

--- what was the minimum profit in the month of december?
SELECT 
	months
	,MIN(profit) AS 'min profit'
FROM breweries
WHERE months = 'december'
GROUP BY months;

--- compare the profit for each of the months in 2019
SELECT
	 DISTINCT months
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE years = '2019'
GROUP BY months
ORDER BY [total profit] DESC;

--- which particular brand generated the highest profit in Senegal?
SELECT
	 DISTINCT brands
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY [total profit] DESC;




								--- BRAND ANALYSIS

--- within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries
SELECT
	 DISTINCT brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE years IN ('2019', '2018')
AND countries IN ('Senegal', 'Togo', 'Benin')
GROUP BY brands
ORDER BY [quantity consumed] DESC;

--- find out the top two choice of consumer brands in Ghana
SELECT
	 DISTINCT brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY [quantity consumed] DESC

--- find out the details of beers consumed in the past three years in the most oil reached country in West Africa
SELECT
	 brands
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT IN ('beta malt', 'grand malt')
GROUP BY brands;

--- favorite malt brands in Anglophone region between 2018 and 2019
SELECT
	 DISTINCT brands AS brands
FROM breweries
WHERE countries IN('Nigeria', 'Ghana')
AND brands LIKE '%malt'
AND years BETWEEN 2018 AND 2019
GROUP BY brands;

--- which brands sold the highest in 2019 in Nigeria?
SELECT
	 brands
	,SUM(quantity) AS quantity
FROM breweries
WHERE years = '2019'
AND countries = 'Nigeria'
GROUP BY brands
ORDER BY quantity DESC;

--- favorite brand in south_south region in Nigeria
SELECT
	 brands
	,SUM(quantity) AS quantity
FROM breweries
WHERE countries = 'Nigeria'
AND region = 'southsouth'
GROUP BY brands
ORDER BY quantity DESC;

--- beer consumption in Nigeria
SELECT
	SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT IN ('beta malt', 'grand malt');

--- level of consumption of Budweiser in the regions in Nigeria
SELECT
	 region
	,brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Nigeria'
AND brands = 'Budweiser'
GROUP BY region, brands
ORDER BY [quantity consumed] DESC;

--- level of consumption of Budweiser in the regions in Nigeria in 2019
SELECT
	 region
	,brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Nigeria'
AND brands = 'Budweiser'
AND years = '2019'
GROUP BY region, brands
ORDER BY [quantity consumed] DESC;




								--- COUNTRIES ANALYSIS

--- country with highest consumption of beer
SELECT
	 countries
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE brands NOT IN ('beta malt', 'grand malt')
GROUP BY countries
ORDER BY [quantity consumed] DESC;

--- highest sales personnel of Budweiser in Senegal
SELECT
	 sales_rep
	,COUNT(sales_rep) AS 'total sales'
FROM breweries
WHERE countries = 'Senegal'
AND brands = 'Budweiser'
GROUP BY sales_rep
ORDER BY [total sales] DESC;

--- country with the highest profit of the fourth quarter in 2019
SELECT
	 countries
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE years = '2019'
AND months IN ('October', 'November', 'December')
GROUP BY countries 
ORDER BY [total profit] DESC;
