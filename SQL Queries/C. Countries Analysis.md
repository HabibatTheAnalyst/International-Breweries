# Questions

1. country with highest consumption of beer
2. highest sales personnel of Budweiser in Senegal
3. country with the highest profit of the fourth quarter in 2019

***
### 1. country with highest consumption of beer
```sql
SELECT
	 countries
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE brands NOT IN ('beta malt', 'grand malt')
GROUP BY countries
ORDER BY [quantity consumed] DESC;
```

***
### 2. highest sales personnel of Budweiser in Senegal
```sql
SELECT
	 sales_rep
	,COUNT(sales_rep) AS 'total sales'
FROM breweries
WHERE countries = 'Senegal'
AND brands = 'Budweiser'
GROUP BY sales_rep
ORDER BY [total sales] DESC;
```

***
### 3. country with the highest profit of the fourth quarter in 2019
```sql
SELECT
	 countries
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE years = '2019'
AND months IN ('October', 'November', 'December')
GROUP BY countries 
ORDER BY [total profit] DESC;
```