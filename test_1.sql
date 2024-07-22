-- Query 1: Query companies of type Ltd, PLC, Inc, and LLC, and count the number of each type.
SELECT  
    CASE 
        WHEN manufacturer LIKE '%Ltd%' THEN 'Ltd'
        WHEN manufacturer LIKE '%PLC%' THEN 'PLC'
        WHEN manufacturer LIKE '%Inc%' THEN 'Inc'
        WHEN manufacturer LIKE '%LLC%' THEN 'LLC'
        ELSE 'none'
    END AS Company_Type,
    COUNT(*) AS Company_Type_Count
FROM product_master 
GROUP BY Company_Type
HAVING Company_Type != 'none'
ORDER BY Company_Type DESC;
