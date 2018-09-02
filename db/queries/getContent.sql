SELECT t.content
FROM tables t, markets m
WHERE t.market_id = m.id AND
m.market_nme = {} AND
t.table_nme = {};