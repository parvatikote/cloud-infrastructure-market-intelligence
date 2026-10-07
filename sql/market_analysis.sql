-- ==========================================
-- Cloud Infrastructure Market Intelligence
-- SQL Analysis using DuckDB
-- ==========================================


-- 1. Global Market Size — 2024

SELECT
    Year,
    Market_Size_USD_mn
FROM global_market
WHERE Year = 2024;


-- 2. Regional Market Ranking — 2024

SELECT
    Region,
    Market_Size_USD_mn
FROM regional_market
WHERE Year = 2024
ORDER BY Market_Size_USD_mn DESC;


-- 3. Regional Market Growth — 2019 to 2035

SELECT
    Region,
    MAX(CASE WHEN Year = 2019
        THEN Market_Size_USD_mn END) AS Market_2019,
    MAX(CASE WHEN Year = 2035
        THEN Market_Size_USD_mn END) AS Market_2035,
    MAX(CASE WHEN Year = 2035
        THEN Market_Size_USD_mn END)
    -
    MAX(CASE WHEN Year = 2019
        THEN Market_Size_USD_mn END) AS Absolute_Growth
FROM regional_market
GROUP BY Region
ORDER BY Absolute_Growth DESC;


-- 4. Regional CAGR — 2019 to 2035

SELECT
    Region,
    (
        POWER(
            MAX(CASE WHEN Year = 2035
                THEN Market_Size_USD_mn END)
            /
            MAX(CASE WHEN Year = 2019
                THEN Market_Size_USD_mn END),
            1.0 / 16
        ) - 1
    ) * 100 AS CAGR_Percent
FROM regional_market
GROUP BY Region
ORDER BY CAGR_Percent DESC;


-- 5. Largest Region — 2024

SELECT
    Region,
    Market_Size_USD_mn
FROM regional_market
WHERE Year = 2024
ORDER BY Market_Size_USD_mn DESC
LIMIT 1;


-- 6. Country Market Size — 2024

SELECT
    Country___Market,
    Market_Size_USD_mn
FROM country_market
WHERE Year = 2024
ORDER BY Market_Size_USD_mn DESC;


-- 7. Country Market Share — 2024

SELECT
    Country___Market,
    Market_Size_USD_mn,
    Market_Size_USD_mn
        / SUM(Market_Size_USD_mn) OVER () * 100
        AS Market_Share_Percent
FROM country_market
WHERE Year = 2024
ORDER BY Market_Share_Percent DESC;


-- 8. Global Year-over-Year Growth

SELECT
    Year,
    Market_Size_USD_mn,
    LAG(Market_Size_USD_mn)
        OVER (ORDER BY Year) AS Previous_Year_Market
FROM global_market
ORDER BY Year;


-- 9. Global 2024 to 2035 Growth

SELECT
    MAX(CASE WHEN Year = 2024
        THEN Market_Size_USD_mn END) AS Market_2024,
    MAX(CASE WHEN Year = 2035
        THEN Market_Size_USD_mn END) AS Market_2035
FROM global_market;


-- 10. Regional Market Share — 2024

SELECT
    r.Region,
    r.Market_Size_USD_mn,
    r.Market_Size_USD_mn
        / g.Market_Size_USD_mn * 100
        AS Global_Market_Share_Percent
FROM regional_market r
JOIN global_market g
    ON r.Year = g.Year
WHERE r.Year = 2024
ORDER BY Global_Market_Share_Percent DESC;


-- 11. Regional Ranking using RANK()

SELECT
    Region,
    Market_Size_USD_mn,
    RANK() OVER (
        ORDER BY Market_Size_USD_mn DESC
    ) AS Regional_Rank
FROM regional_market
WHERE Year = 2024;


-- 12. Regional Year-over-Year Growth

SELECT
    Region,
    Year,
    Market_Size_USD_mn,
    LAG(Market_Size_USD_mn)
        OVER (
            PARTITION BY Region
            ORDER BY Year
        ) AS Previous_Year_Market
FROM regional_market
ORDER BY Region, Year;


-- 13. Largest Segment in Each Category

SELECT
    Category,
    Segment,
    Value AS Market_Size_USD_mn
FROM (
    SELECT
        Category,
        Segment,
        Value,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY Value DESC
        ) AS Segment_Rank
    FROM segment_market
)
WHERE Segment_Rank = 1
ORDER BY Category;


-- 14. Segments with More Than 10% Market Share

SELECT
    Category,
    Segment,
    Value,
    Market_Share_%
FROM segment_market
WHERE Market_Share_% > 10
ORDER BY Market_Share_% DESC;


-- 15. Top 5 Market Segments

SELECT
    Category,
    Segment,
    Value AS Market_Size_USD_mn
FROM segment_market
ORDER BY Value DESC
LIMIT 5;


-- 16. Category-Level Market Size

SELECT
    Category,
    SUM(Value) AS Category_Market_Size_USD_mn
FROM segment_market
GROUP BY Category
ORDER BY Category_Market_Size_USD_mn DESC;
