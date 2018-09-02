INSERT INTO tables(id, table_nme, content) VALUES(
    (
        SELECT m.id
        FROM markets m 
        WHERE m.market_name = {}
    ),
    {},
    {}
);