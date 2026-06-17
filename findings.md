# Findings — Crypto-Spot Desk, March Review

**Brief:** "Something feels off with our March numbers. Look into desk
performance and flag anything I should worry about before the monthly review."

## Headline
**35% of trading volume (227,520) was invisible to desk-level reporting** —
trader *carol* is missing from the `traders` reference table, so any desk
breakdown silently undercounts. A naive INNER JOIN reports 415,407; the true
figure is 642,927. **Fix: add carol to `traders` before the review.**

## What I checked
1. **Volume per desk** — crypto-spot 415,407 attributed; 227,520 unattributed (carol).
2. **Buy vs sell** — crypto-spot heavily buy-skewed (389,359 buy vs 26,048 sell). Confirm the long bias is intentional.
3. **Fee take rate** — consistent across attributed and unattributed volume (~0.00013–0.00015). No under-charging.
4. **Largest trade** — 202,500 (bob), ~1.6× the next largest. Within normal range, not an anomaly.

## Couldn't answer
- **No February data** — month-over-month comparison not possible this cycle. Flag as a data gap.

## Recommendations
1. Add carol to `traders` to restore complete desk reporting (highest priority).
2. Confirm crypto-spot's buy skew is a deliberate position, not a reporting artifact.
3. Default desk reporting to LEFT JOIN from `trades` so unattributed volume surfaces instead of vanishing.