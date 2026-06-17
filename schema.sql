CREATE TABLE trades (
  trade_id    INTEGER,
  symbol      TEXT,
  side        TEXT,
  qty         INTEGER,
  price       REAL,
  fee         REAL,
  trader      TEXT,
  ts          TEXT
);

INSERT INTO trades VALUES
(1,'BTC','buy',2,41000.0,12.5,'alice','2024-03-01 09:14:00'),
(2,'ETH','sell',10,2200.0,4.4,'bob','2024-03-01 09:31:00'),
(3,'btc','buy',1,41250.5,6.2,'alice','2024-03-01 10:02:00'),
(4,'BTC','sell',3,42000.0,18.9,'carol','2024-03-02 11:45:00'),
(5,'ETH','buy',25,2150.75,10.8,'bob','2024-03-02 12:10:00'),
(6,'SOL','buy',100,98.4,3.1,'alice','2024-03-02 14:22:00'),
(7,'BTC','buy',5,40500.0,22.0,'bob','2024-03-03 08:05:00'),
(8,'ETH','sell',8,2240.0,NULL,'carol','2024-03-03 09:50:00'),
(9,'SOL','sell',40,101.2,2.0,'alice','2024-03-03 15:30:00'),
(10,'BTC','buy',2,41800.0,11.0,'carol','2024-03-04 10:15:00');

CREATE TABLE traders (
  trader_name TEXT,
  desk        TEXT,
  joined      TEXT,
  base_ccy    TEXT
);

INSERT INTO traders VALUES
('alice','crypto-spot','2023-11-01','USD'),
('bob','crypto-spot','2024-01-15','USD'),
('dave','derivatives','2024-02-20','EUR');