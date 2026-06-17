# Sneaky Carol

**SQL methodology demonstration: how one missing trader hid 35% of volume from
desk reporting — and the LEFT JOIN that caught her.**

## The problem
A desk head asks a vague question: *"Something feels off with our March numbers
— flag anything I should worry about."* No metric specified, no format. The
real skill is translating that into answerable questions, then noticing what
the data hides.

## Approach
1. Scoped the brief into 4 answerable questions (volume per desk, buy/sell flow,
   fee take rate, outlier check).
2. Cut one question I *couldn't* answer — no February data, so no
   month-over-month comparison.
3. Ran and synthesized into a recommendation a desk head can act on.

## The catch
A standard `INNER JOIN` of trades to the trader reference table reports
**415,407** in desk volume. The true figure is **642,927**. The gap — 227,520,
or 35% — belongs to a trader missing from the reference table. INNER JOIN drops
unmatched rows silently, so naive reporting undercounts and never warns you.
A `LEFT JOIN` from the fact table preserves every trade and flags the gap as a
NULL desk.

## Files
- `findings.md` — the conclusion and recommendations (read this first)
- `analysis.sql` — questions, queries, results, and interpretation
- `schema.sql` — table definitions and seed data

## Stack
SQLite · SQL (LEFT/INNER JOIN, aggregation, GROUP BY, ranking)

## Note
Small synthetic dataset — a methodology demonstration, not real company data.