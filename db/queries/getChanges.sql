SELECT *
FROM tables t 
WHERE t.id IN (
    SELECT distinct c.table_id
    FROM changed c
    WHERE c.selNum = {}
);