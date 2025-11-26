-- Geographic Distribution 

-- How many EV's are registered in the state?
SELECT COUNT(*) FROM ev_pop;

-- Which counties have the highest EV registrations?
SELECT
	county,
	COUNT(*) AS ev_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 1) AS ev_pct
FROM ev_pop
GROUP BY county
ORDER BY ev_count DESC;

-- Which cities have the highest EV registration?
 SELECT
 	county,
	city,
	COUNT(*) AS ev_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 1) AS ev_pct
FROM ev_pop
GROUP BY county, city
ORDER BY ev_count DESC;

-- Vehicle Makes & Model Trends

-- What are the most common EV makes in the state?
SELECT
	make,
	COUNT(*) AS make_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 1) AS make_pct
FROM ev_pop
GROUP BY make
ORDER BY make_count DESC;

-- What are the most common EV makes in each county?
WITH total_ev_county AS (
	SELECT
		county,
		COUNT(*) AS ev_count
	FROM ev_pop
	GROUP BY county
),
make_per_county AS (
	SELECT
		county,
		make,
		COUNT(*) AS ev_count
	FROM ev_pop
	GROUP BY county, make
	ORDER BY ev_count DESC
)

SELECT
	mec.county,
	mec.make,
	mec.ev_count,
	tec.ev_count,
	ROUND(mec.ev_count * 100.0 / tec.ev_count, 2) AS make_county_pct
FROM make_per_county AS mec
JOIN total_ev_county AS tec
	ON mec.county = tec.county
ORDER BY tec.ev_count DESC, make_county_pct DESC;

-- For each make, how many cities does it rank as the most registered EV
WITH city_makes_ranked AS (
	SELECT
		city,
		make,
		COUNT(*) AS ev_count,
		DENSE_RANK() OVER(PARTITION BY city ORDER BY COUNT(*) DESC) AS dr
	FROM ev_pop
	GROUP BY city, make
)

SELECT
	make,
	COUNT(*) AS city_count
FROM city_makes_ranked
WHERE dr = 1
GROUP BY make
ORDER BY city_count DESC;

-- EV Type Breakdown
SELECT
	ev_type,
	COUNT(*) AS ev_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 1) AS ev_pct
FROM ev_pop
GROUP BY ev_type

-- Time Based Adoption Trends 

-- When did EV's become popular (Show EV's by model year)
SELECT
	model_year,
	COUNT(*) AS ev_count
FROM ev_pop
GROUP BY model_year
ORDER BY model_year DESC;

-- When did each make begin to appear?
SELECT
	model_year,
	make,
	model,
	COUNT(*) AS ev_count
FROM ev_pop
GROUP BY model_year, make, model
ORDER BY make, model_year



