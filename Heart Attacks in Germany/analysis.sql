-- Gender trends

-- What is the heart attack rate regardless of gender?
SELECT
	SUM(heart_attack_incidence) AS total_heart_attacks,
	ROUND(SUM(heart_attack_incidence) * 100.0 / (SELECT COUNT(*) FROM ht_data), 2) AS heart_attack_pct
FROM ht_data

-- What is the heart attack rate by gender?
SELECT
	gender,
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY gender

-- What is the gender percentage of those who experienced heart attacks?
SELECT
	gender,
	COUNT(*) AS total_heart_attacks,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ht_data WHERE heart_attack_incidence = 1), 2) AS age_group_pct
FROM ht_data
WHERE heart_attack_incidence = 1
GROUP BY gender

-- Age group comparisons

-- What is the heart attack rate by age group?
SELECT 
	age_group,
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY age_group
ORDER BY heart_attack_pct DESC

-- What is the age group percentage of those who experienced heart attacks?
SELECT
	age_group,
	COUNT(*) AS total_heart_attacks,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ht_data WHERE heart_attack_incidence = 1), 2) AS age_group_pct
FROM ht_data
WHERE heart_attack_incidence = 1
GROUP BY age_group

-- What is the heart attack rate by age group per gender?
SELECT
	age_group,
	gender,
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY age_group, gender
ORDER BY gender

-- State comparisons

-- What is the heart attack rate by state?
SELECT
	"state",
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY "state"
ORDER BY heart_attack_pct DESC

-- Urban rural comparison

-- What is the heart attack rate by urban or rural area?
SELECT 
	urban_rural,
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY urban_rural

-- What is the urban or rural percentage of those who experience heart attacks?
SELECT
	urban_rural,
	COUNT(*) AS total_heart_attacks,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ht_data WHERE heart_attack_incidence = 1), 2) AS age_group_pct
FROM ht_data
WHERE heart_attack_incidence = 1
GROUP BY urban_rural

-- Yearly comparisons

-- What is the heart attack rate by year?
SELECT 
	"year",
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY "year"
ORDER BY "year"

-- What is the the heart attack rate by year per state?
SELECT
	"state",
	"year",
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY "state", "year"
ORDER BY "state", "year"

-- Risk factors

-- What is the heart attack rate by diet quality?
SELECT
	diet_quality, 
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY diet_quality

-- What is the heart attack rate for diabetes?
SELECT
	diabetes, 
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data
GROUP BY diabetes

-- What is the heart attack rate for smokers?
SELECT
	smoking_status,
	SUM(heart_attack_incidence) AS total_heart_attacks,
	COUNT(*) AS total_records,
	ROUND(SUM(heart_attack_incidence) * 100.0 / COUNT(*), 2) AS heart_attack_pct
FROM ht_data	
GROUP BY smoking_status
ORDER BY heart_attack_pct DESC

-- What is the percentage of people with heart attack incidence that have a family_history, hypertension, diabetes?
SELECT
	ROUND((COUNT(*) FILTER(WHERE family_history = 1)) * 100.0 / COUNT(*) , 2) AS family_hist_pct,
	ROUND((COUNT(*) FILTER(WHERE hypertension = 1)) * 100.0 / COUNT(*), 2) AS hypertension_pct,
	ROUND((COUNT(*) FILTER(WHERE diabetes = 1)) * 100.0 / COUNT(*), 2) AS diabetes_pct,
	ROUND((COUNT(*) FILTER(WHERE smoking_status = 'Smoker')) * 100.0 / COUNT(*) , 2) AS smoker_pct,
	ROUND((COUNT(*) FILTER(WHERE smoking_status = 'Non-Smoker')) * 100.0 / COUNT(*), 2) AS non_smoker_pct,
	ROUND((COUNT(*) FILTER(WHERE smoking_status = 'Former Smoker')) * 100.0 / COUNT(*), 2) AS former_smoker_pct
FROM ht_data
WHERE heart_attack_incidence = 1 

-- How does diet quality affect heart attack incidence 
SELECT
	ROUND(COUNT(*) FILTER(WHERE diet_quality = 'Poor') * 100.0 / COUNT(*), 1) AS dq_poor,
	ROUND(COUNT(*) FILTER(WHERE diet_quality = 'Average') * 100.0 / COUNT(*), 1) AS dq_avg,
	ROUND(COUNT(*) FILTER(WHERE diet_quality = 'Good') * 100.0 / COUNT(*), 1) AS dq_good
FROM ht_data
WHERE heart_attack_incidence = 1




