-- ============================================================
-- Road Accident Hotspot Intelligence
-- India Road Accident Analysis - 2023
-- SQL Analysis
-- ============================================================

CREATE DATABASE IF NOT EXISTS road_accident_intelligence;

USE road_accident_intelligence;


-- ============================================================
-- TABLE 1: ROAD CLASSIFICATION
-- ============================================================

CREATE TABLE IF NOT EXISTS road_classification (
    sl_no INT,
    state_ut VARCHAR(100),
    national_highways_cases INT,
    national_highways_injured INT,
    national_highways_died INT,
    state_highways_cases INT,
    state_highways_injured INT,
    state_highways_died INT,
    expressways_cases INT,
    expressways_injured INT,
    expressways_died INT,
    other_roads_cases INT,
    other_roads_injured INT,
    other_roads_died INT,
    total_cases INT,
    total_injured INT,
    total_died INT,
    accident_share_pct DOUBLE,
    injury_rate_pct DOUBLE,
    fatality_rate_pct DOUBLE
);


-- ============================================================
-- TABLE 2: TIME OF OCCURRENCE
-- ============================================================

CREATE TABLE IF NOT EXISTS time_occurrence (
    geography_type VARCHAR(20),
    geography VARCHAR(100),
    time_0000_0300 INT,
    time_0300_0600 INT,
    time_0600_0900 INT,
    time_0900_1200 INT,
    time_1200_1500 INT,
    time_1500_1800 INT,
    time_1800_2100 INT,
    time_2100_2400 INT,
    total INT,
    day_accidents INT,
    night_accidents INT,
    day_accident_share_pct DOUBLE,
    night_accident_share_pct DOUBLE,
    peak_time_period VARCHAR(30),
    peak_time_accidents INT
);


-- ============================================================
-- DATA QUALITY CHECKS
-- ============================================================

-- Check road classification records
SELECT COUNT(*) AS road_classification_records
FROM road_classification;


-- Check time occurrence records
SELECT COUNT(*) AS time_occurrence_records
FROM time_occurrence;


-- Check missing values in important road fields
SELECT
    COUNT(*) AS total_records,
    SUM(state_ut IS NULL) AS missing_geography,
    SUM(total_cases IS NULL) AS missing_cases,
    SUM(total_injured IS NULL) AS missing_injured,
    SUM(total_died IS NULL) AS missing_deaths
FROM road_classification;


-- Check missing values in time dataset
SELECT
    COUNT(*) AS total_records,
    SUM(geography IS NULL) AS missing_geography,
    SUM(total IS NULL) AS missing_total
FROM time_occurrence;


-- ============================================================
-- 1. TOP 10 GEOGRAPHIES BY ACCIDENT CASES
-- ============================================================

SELECT
    state_ut AS geography,
    total_cases
FROM road_classification
ORDER BY total_cases DESC
LIMIT 10;


-- ============================================================
-- 2. TOP 10 STATE/UTs BY ACCIDENT CASES
-- State/UT records are represented by Sl. No. 1-36
-- ============================================================

SELECT
    state_ut,
    total_cases
FROM road_classification
WHERE sl_no <= 36
ORDER BY total_cases DESC
LIMIT 10;


-- ============================================================
-- 3. TOP 10 STATE/UTs BY DEATHS
-- ============================================================

SELECT
    state_ut,
    total_died
FROM road_classification
WHERE sl_no <= 36
ORDER BY total_died DESC
LIMIT 10;


-- ============================================================
-- 4. TOP 10 STATE/UTs BY INJURED PERSONS
-- ============================================================

SELECT
    state_ut,
    total_injured
FROM road_classification
WHERE sl_no <= 36
ORDER BY total_injured DESC
LIMIT 10;


-- ============================================================
-- 5. TOP 10 CITIES BY ACCIDENT CASES
-- City records start after the first 36 State/UT records
-- ============================================================

SELECT
    state_ut AS city,
    total_cases
FROM road_classification
WHERE sl_no > 36
ORDER BY total_cases DESC
LIMIT 10;


-- ============================================================
-- 6. TOP 10 CITIES BY DEATHS
-- ============================================================

SELECT
    state_ut AS city,
    total_died
FROM road_classification
WHERE sl_no > 36
ORDER BY total_died DESC
LIMIT 10;


-- ============================================================
-- 7. ROAD CLASSIFICATION - ACCIDENT CASES
-- ============================================================

SELECT
    SUM(national_highways_cases) AS national_highways,
    SUM(state_highways_cases) AS state_highways,
    SUM(expressways_cases) AS expressways,
    SUM(other_roads_cases) AS other_roads
FROM road_classification;


-- ============================================================
-- 8. ROAD CLASSIFICATION - CASE SHARE
-- ============================================================

SELECT
    SUM(national_highways_cases) AS national_highways_cases,
    ROUND(
        SUM(national_highways_cases) /
        (
            SUM(national_highways_cases) +
            SUM(state_highways_cases) +
            SUM(expressways_cases) +
            SUM(other_roads_cases)
        ) * 100, 2
    ) AS national_highways_share_pct,

    SUM(state_highways_cases) AS state_highways_cases,
    ROUND(
        SUM(state_highways_cases) /
        (
            SUM(national_highways_cases) +
            SUM(state_highways_cases) +
            SUM(expressways_cases) +
            SUM(other_roads_cases)
        ) * 100, 2
    ) AS state_highways_share_pct,

    SUM(expressways_cases) AS expressways_cases,
    ROUND(
        SUM(expressways_cases) /
        (
            SUM(national_highways_cases) +
            SUM(state_highways_cases) +
            SUM(expressways_cases) +
            SUM(other_roads_cases)
        ) * 100, 2
    ) AS expressways_share_pct,

    SUM(other_roads_cases) AS other_roads_cases,
    ROUND(
        SUM(other_roads_cases) /
        (
            SUM(national_highways_cases) +
            SUM(state_highways_cases) +
            SUM(expressways_cases) +
            SUM(other_roads_cases)
        ) * 100, 2
    ) AS other_roads_share_pct

FROM road_classification;


-- ============================================================
-- 9. ROAD CLASSIFICATION - DEATHS
-- ============================================================

SELECT
    SUM(national_highways_died) AS national_highways_deaths,
    SUM(state_highways_died) AS state_highways_deaths,
    SUM(expressways_died) AS expressways_deaths,
    SUM(other_roads_died) AS other_roads_deaths
FROM road_classification;


-- ============================================================
-- 10. ROAD CLASSIFICATION - DEATH TO ACCIDENT RATIO
-- ============================================================

SELECT
    'National Highways' AS road_classification,
    SUM(national_highways_cases) AS accident_cases,
    SUM(national_highways_died) AS deaths,
    ROUND(
        SUM(national_highways_died) /
        NULLIF(SUM(national_highways_cases), 0) * 100, 2
    ) AS death_to_accident_ratio_pct

FROM road_classification

UNION ALL

SELECT
    'State Highways',
    SUM(state_highways_cases),
    SUM(state_highways_died),
    ROUND(
        SUM(state_highways_died) /
        NULLIF(SUM(state_highways_cases), 0) * 100, 2
    )
FROM road_classification

UNION ALL

SELECT
    'Expressways',
    SUM(expressways_cases),
    SUM(expressways_died),
    ROUND(
        SUM(expressways_died) /
        NULLIF(SUM(expressways_cases), 0) * 100, 2
    )
FROM road_classification

UNION ALL

SELECT
    'Other Roads',
    SUM(other_roads_cases),
    SUM(other_roads_died),
    ROUND(
        SUM(other_roads_died) /
        NULLIF(SUM(other_roads_cases), 0) * 100, 2
    )
FROM road_classification;


-- ============================================================
-- 11. DAY VS NIGHT ACCIDENTS
-- ============================================================

SELECT
    SUM(day_accidents) AS day_accidents,
    SUM(night_accidents) AS night_accidents,
    SUM(total) AS total_accidents
FROM time_occurrence;


-- ============================================================
-- 12. DAY VS NIGHT ACCIDENT SHARE
-- ============================================================

SELECT
    ROUND(SUM(day_accidents) / SUM(total) * 100, 2)
        AS day_accident_share_pct,

    ROUND(SUM(night_accidents) / SUM(total) * 100, 2)
        AS night_accident_share_pct

FROM time_occurrence;


-- ============================================================
-- 13. ACCIDENT CASES BY TIME PERIOD
-- ============================================================

SELECT
    '00:00-03:00' AS time_period,
    SUM(time_0000_0300) AS accident_cases
FROM time_occurrence

UNION ALL

SELECT
    '03:00-06:00',
    SUM(time_0300_0600)
FROM time_occurrence

UNION ALL

SELECT
    '06:00-09:00',
    SUM(time_0600_0900)
FROM time_occurrence

UNION ALL

SELECT
    '09:00-12:00',
    SUM(time_0900_1200)
FROM time_occurrence

UNION ALL

SELECT
    '12:00-15:00',
    SUM(time_1200_1500)
FROM time_occurrence

UNION ALL

SELECT
    '15:00-18:00',
    SUM(time_1500_1800)
FROM time_occurrence

UNION ALL

SELECT
    '18:00-21:00',
    SUM(time_1800_2100)
FROM time_occurrence

UNION ALL

SELECT
    '21:00-24:00',
    SUM(time_2100_2400)
FROM time_occurrence

ORDER BY accident_cases DESC;


-- ============================================================
-- 14. PEAK ACCIDENT TIME PERIOD
-- ============================================================

SELECT
    peak_time_period,
    COUNT(*) AS geography_count
FROM time_occurrence
GROUP BY peak_time_period
ORDER BY geography_count DESC;


-- ============================================================
-- 15. TOP CITIES BY FATALITY RATE
-- Minimum 1,000 accident cases
-- ============================================================

SELECT
    state_ut AS city,
    total_cases,
    total_died,
    ROUND(
        total_died / NULLIF(total_cases, 0) * 100,
        2
    ) AS fatality_rate_pct
FROM road_classification
WHERE sl_no > 36
  AND total_cases >= 1000
ORDER BY fatality_rate_pct DESC
LIMIT 10;


-- ============================================================
-- 16. STATE/UT FATALITY INDICATORS
-- ============================================================

SELECT
    state_ut,
    total_cases,
    total_died,
    ROUND(
        total_died / NULLIF(total_cases, 0) * 100,
        2
    ) AS fatality_rate_pct
FROM road_classification
WHERE sl_no <= 36
ORDER BY fatality_rate_pct DESC;


-- ============================================================
-- 17. TOP GEOGRAPHIES BY PEAK-TIME ACCIDENTS
-- ============================================================

SELECT
    geography_type,
    geography,
    peak_time_period,
    peak_time_accidents
FROM time_occurrence
ORDER BY peak_time_accidents DESC
LIMIT 10;


-- ============================================================
-- 18. TIME PERIOD WITH HIGHEST ACCIDENT COUNT
-- ============================================================

SELECT
    peak_time_period,
    SUM(peak_time_accidents) AS peak_time_accident_count
FROM time_occurrence
GROUP BY peak_time_period
ORDER BY peak_time_accident_count DESC;


-- ============================================================
-- IMPORTANT DATA INTERPRETATION NOTE
-- ============================================================

-- Road classification and time occurrence datasets have
-- different analytical grains.
--
-- State/UT and city records are also present at different
-- geographical levels.
--
-- Therefore, these datasets should not be blindly merged
-- or added together to produce national totals.
--
-- They are analyzed as separate analytical views of the
-- same road accident problem.
