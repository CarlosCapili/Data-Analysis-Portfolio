-- -- How many EV's are registered in Washington State?
-- SELECT 
-- 	COUNT(DISTINCT dol_vehicle_id) AS registered_evs
-- FROM ev_pop;

-- -- What are the most common EV makes?
-- SELECT 
-- 	make,
-- 	COUNT(*) AS ev_count,
-- 	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 2) AS make_pct
-- FROM ev_pop
-- GROUP BY make
-- ORDER BY ev_count DESC;

-- -- How many EV's are registered in each county?
-- SELECT
-- 	county,
-- 	COUNT(*) AS ev_count,
-- 	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 2) AS ev_county_pct
-- FROM ev_pop
-- GROUP BY county
-- ORDER BY ev_count DESC;

-- -- How many EV's are registered in each city?
-- SELECT
-- 	city,
-- 	COUNT(*) AS ev_count,
-- 	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 2) AS ev_county_pct
-- FROM ev_pop
-- GROUP BY city
-- ORDER BY ev_count DESC;

-- -- What are the most popular makes in the top 5 cities with registered EV's?
-- -- Total EV count per city
-- WITH total_city_count AS (
-- 	SELECT
-- 		city,
-- 		COUNT(*) AS city_ev_count
-- 	FROM ev_pop
-- 	GROUP BY city
-- ),
-- -- Total EV count per city by make
-- sub_city_count AS (
-- 	SELECT
-- 		city,
-- 		make,
-- 		COUNT(*) AS make_ev_count
-- 	FROM ev_pop
-- 	GROUP BY city, make
-- )

-- SELECT
-- 	scc.city,
-- 	scc.make,
-- 	scc.make_ev_count,
-- 	ROUND(scc.make_ev_count * 100.0 / tcc.city_ev_count, 2) AS make_by_city_pct
-- FROM sub_city_count AS scc
-- JOIN total_city_count AS tcc
-- 	ON scc.city = tcc.city
-- WHERE scc.city IN ('Seattle', 'Bellevue', 'Redmond', 'Vancouver', 'Bothell')
-- ORDER BY tcc.city_ev_count DESC, make_by_city_pct DESC;

-- -- Count the amount of cities for each make where it is registered as the number 1 EV
-- SELECT
-- 	make,
-- 	COUNT(*) AS cities_registered
-- FROM (
-- 	SELECT
-- 		city,
-- 		make,
-- 		COUNT(*) AS ev_count,
-- 		DENSE_RANK() OVER(PARTITION BY city ORDER BY COUNT(*) DESC) AS dr
-- 	FROM ev_pop
-- 	GROUP BY city, make
-- ) AS makes_per_city
-- WHERE dr = 1
-- GROUP BY make
-- ORDER BY cities_registered DESC

-- -- What is the EV type for registered EV's?
-- SELECT
-- 	ev_type,
-- 	COUNT(*) ev_type_count,
-- 	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 0) AS ev_type_pct
-- FROM ev_pop
-- GROUP BY ev_type;

-- -- What are some common EV's in the state?
-- SELECT
-- 	make,
-- 	model,
-- 	COUNT(*) as ev_count,
-- 	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ev_pop), 2) AS ev_type_pct
-- FROM ev_pop
-- GROUP BY make, model
-- ORDER BY ev_count DESC;


