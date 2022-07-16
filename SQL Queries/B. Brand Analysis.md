<<<<<<< HEAD
# Questions

1. within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries
2. find out the top two choice of consumer brands in Ghana
3. find out the details of beers consumed in the past three years in the most oil reached country in West Africa
4. favorite malt brands in Anglophone region between 2018 and 2019
5. which brands sold the highest in 2019 in Nigeria?
6. favorite brand in south_south region in Nigeria
7. beer consumption in Nigeria
8. level of consumption of Budweiser in the regions in Nigeria
9. level of consumption of Budweiser in the regions in Nigeria in 2019

***
### 1. within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries
```sql
SELECT
	 DISTINCT brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE years IN ('2019', '2018')
AND countries IN ('Senegal', 'Togo', 'Benin')
GROUP BY brands
ORDER BY [quantity consumed] DESC;
```

***
### 2. find out the top two choice of consumer brands in Ghana
```sql
SELECT
	 DISTINCT brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY [quantity consumed] DESC
```

***
### 3. find out the details of beers consumed in the past three years in the most oil reached country in West Africa
```sql
SELECT
	 brands
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT IN ('beta malt', 'grand malt')
GROUP BY brands;
```

***
### 4. favorite malt brands in Anglophone region between 2018 and 2019
```sql
SELECT
	 DISTINCT brands AS brands
FROM breweries
WHERE countries IN('Nigeria', 'Ghana')
AND brands LIKE '%malt'
AND years BETWEEN 2018 AND 2019
GROUP BY brands;
```

***
### 5. which brands sold the highest in 2019 in Nigeria?
```sql
SELECT
	 brands
	,SUM(quantity) AS quantity
FROM breweries
WHERE years = '2019'
AND countries = 'Nigeria'
GROUP BY brands
ORDER BY quantity DESC;
```

***
### 6. favorite brand in south_south region in Nigeria
```sql
SELECT
	 brands
	,SUM(quantity) AS quantity
FROM breweries
WHERE countries = 'Nigeria'
AND region = 'southsouth'
GROUP BY brands
ORDER BY quantity DESC;
```

***
### 7. beer consumption in Nigeria
```sql
SELECT
	SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT IN ('beta malt', 'grand malt');
```

***
### 8. level of consumption of Budweiser in the regions in Nigeria
```sql
SELECT
	 region
	,brands
	,SUM(quantity) AS 'quantity consumed'
FROM breweries
WHERE countries = 'Nigeria'
AND brands = 'Budweiser'
GROUP BY region, brands
ORDER BY [quantity consumed] DESC;
```

***
### 9. level of consumption of Budweiser in the regions in Nigeria in 2019
```sql
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
```
=======

>>>>>>> 56d00684fcaf7b4dc9e657a67cd741054ad5de37
