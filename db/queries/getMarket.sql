SELECT distinct t.table_nme 
FROM tables as t, markets as m
WHERE t.market_id = m.id and
m.market_nme = {};