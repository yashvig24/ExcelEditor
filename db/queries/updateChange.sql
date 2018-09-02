INSERT INTO changed(table_id, selNum) VALUES (
    (
        SELECT t.id
        FROM tables t 
        WHERE t.market_id = (
            SELECT m.id 
            FROM markets m
            WHERE m.market_nme = {}
        ) AND
        t.table_nme = {}
    ),
    {}
);
