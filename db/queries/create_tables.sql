DROP TABLE IF EXISTS dbo.functions;
DROP TABLE IF EXISTS dbo.tables;
DROP TABLE IF EXISTS dbo.markets;
DROP TABLE IF EXISTS dbo.changed;

CREATE TABLE functions (
    table_nme VARCHAR(100),
    process VARCHAR(100),
    recordset VARCHAR(100)
);

CREATE TABLE markets (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    market_nme VARCHAR(100) NOT NULL
);

CREATE TABLE tables (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    market_id INT NOT NULL FOREIGN KEY REFERENCES markets(id),
    table_nme VARCHAR(100),
    content VARCHAR(MAX),
);

CREATE TABLE changed (
    table_id INT,
    selNum VARCHAR(100)
);