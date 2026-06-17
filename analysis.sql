/* The head of the crypto-spot desk drops by:
Something feels off with our March numbers.
Can you look into desk performance and flag anything I should worry about before the monthly review?
I trust your read." */


-- "What is total notional per desk?"

select sum(qty * price), desk from trades
left join traders on trades.trader = traders.trader_name
group by desk

/* 
sum(qty * price)	desk
227520.0	
415407.25	crypto-spot
*/

-- Volume with no desk found. Anomaly.
-- "Who is this?"

select desk, trader, sum(qty * price) from trades
left join traders on traders.trader_name = trades.trader
group by desk, trader

/*
desk	trader	sum(qty * price)
	carol	227520.0
crypto-spot	alice	137138.5
crypto-spot	bob	278268.75
*/

-- Carol is missing from traders with desks.

-- COMPARE -- The INNER JOIN hides carol. Keeps only matching records. 227520.0 in volume hidden.

select sum(qty * price), desk from trades
inner join traders on trades.trader = traders.trader_name
group by desk

/* 
415407.25	crypto-spot
*/
-- Inner join joins only matching rows. Drops non-matching rows.


-- "What is the BUY to SELL ratio per desk?"

select sum(qty * price), side, desk from trades
left join traders on trades.trader = traders.trader_name
group by side, desk

/* 
sum(qty * price)	side	desk
83600.0	buy	
389359.25	buy	crypto-spot
143920.0	sell	
26048.0	sell	crypto-spot
*/

-- Buy side heavily favoured. Fairly normal. Consider market sentiment.


-- "What is the fee take rate per desk?"

select desk, sum(fee) / sum(qty * price) from trades
left join traders on trades.trader = traders.trader_name
group by desk

/* 
desk	sum(fee) / sum(qty * price)
	0.000131417018284107
crypto-spot	0.00014684385022168
*/

-- Fee rate within policy.


-- "What does the largest trade look like?"

select qty * price, trader from trades
order by qty * price desc limit 3

/*
qty * price	trader
202500.0	bob
126000.0	carol
83600.0	carol

*/

-- Largest trade is not an outlier.


-- No February data. Month by month comparison not possible.

