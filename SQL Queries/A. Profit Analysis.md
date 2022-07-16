# Questions

1. Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?
2. compare the total profit between these territories in order for the territory manager to make a strategic decision that will aid profit maximization in 2020
3. what country generated the highest profit in 2019?
4. help him find the year with the highest profit
5. which month in the three years was the least profit generated?
6. what was the minimum profit in the month of december?
7. compare the profit for each of the months in 2019
8. which particular brand generated the highest profit in Senegal?

***
### 1. Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?
```sql
SELECT 
	SUM(profit) AS 'total profit'
FROM breweries;
```

***
### 2. compare the total profit between these territories in order for the territory manager to make a strategic decision that will aid profit maximization in 2020
```sql
SELECT
	DISTINCT countries AS 'territories'
	,SUM(profit) AS 'total profit'
FROM breweries
GROUP BY countries
ORDER BY [total profit] DESC;
```

***
### 3. what country generated the highest profit in 2019?
```sql
SELECT
	DISTINCT countries
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE years = '2019'
GROUP BY countries
ORDER BY [total profit] DESC;
```

***
### 4. help him find the year with the highest profit
```sql
SELECT
	DISTINCT years
	,SUM(profit) AS 'total profit'
FROM breweries
GROUP BY years
ORDER BY [total profit] DESC;
```

***
### 5. which month in the three years was the least profit generated?
```sql
SELECT
	DISTINCT months 
	,SUM(profit) AS 'total profit'
FROM breweries
GROUP BY months
ORDER BY [total profit];
```

***
### 6. what was the minimum profit in the month of december?
```sql
SELECT 
	months
	,MIN(profit) AS 'min profit'
FROM breweries
WHERE months = 'december'
GROUP BY months;
```

***
### 7. compare the profit for each of the months in 2019
```sql
SELECT
	 DISTINCT months
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE years = '2019'
GROUP BY months
ORDER BY [total profit] DESC;
```

***
### 8. which particular brand generated the highest profit in Senegal?
```sql
SELECT
	 DISTINCT brands
	,SUM(profit) AS 'total profit'
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY [total profit] DESC;
```