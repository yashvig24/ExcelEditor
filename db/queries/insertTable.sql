INSERT INTO tables(market_id, table_nme, content) VALUES(
    (
        SELECT m.id
        FROM markets m 
        WHERE m.market_nme = {}
    ),
    {},
    {}
);
