

Customer Revenue Analysis — Summary of Findings

Business Questions Addressed


Which customers contribute the most revenue?
What percentage of revenue comes from top customers?
How is revenue distributed among customer Buying Groups?



Key Data Quality Finding: The "Unknown" Customer (Customer Key = 0)

During the analysis, a significant data quality issue was discovered: Customer Key = 0, labeled as "Unknown" in the Dimension.Customer table, is associated with real sales transactions — not an empty placeholder row.


This single ID represents 36.88% of total company revenue.
The same pattern appears in the Buying Group dimension, where an "N/A" group accounts for the exact same revenue share — confirming that these are the same unattributed transactions, simply lacking customer and buying-group identification.
Given the scale (over a third of total revenue) and the fact that these sales are spread across what are likely many different transactions rather than one single account, it was concluded that this is real revenue without proper customer attribution (e.g., walk-in or unregistered sales), rather than a technical artifact to be discarded entirely.


Decision Framework Applied

QuestionShould "Unknown" be included?What is the company's total revenue?✅ Yes — it is real revenueWho are the top customers?❌ No — it does not represent an identifiable customerWhat % of revenue do top customers represent (against total real revenue)?✅ Included in the denominator onlyHow is revenue distributed among Buying Groups?❌ No — excluded for a meaningful 2-group comparison

This distinction was applied consistently across all subsequent queries: the "Unknown" segment is always included when calculating total revenue, but excluded whenever the analysis specifically discusses identified customers or groups.


Finding 1 — Top 10 Customers (Real, Identified Customers)

Using SUM, COUNT(DISTINCT [WWI Invoice ID]), and GROUP BY Customer, the top 10 customers by revenue were identified, excluding the "Unknown" record.

This produces a ranked list of actual customer accounts, along with their order count and average order value — useful for relationship management, account prioritization, and retention efforts.


Finding 2 — Revenue Concentration (Pareto / 80-20 Analysis)

A cumulative percentage calculation (via window functions) was applied to determine how much of total revenue the top 10 real customers represent.

Result: The top 10 customers account for approximately 35% of total company revenue.

Interpretation

This indicates a diversified customer base rather than a concentrated one. A classic 80/20 Pareto pattern (where a small number of customers drive the vast majority of revenue) was not observed.

Business implications:


Lower concentration risk — losing one or even several top customers would not critically threaten overall revenue.
More stable revenue base — income is spread across many accounts, cushioning the impact of any single customer's fluctuations.
Balanced negotiating position — no single customer holds outsized leverage over pricing or terms.
Possible missed upside — high diversification can also suggest an opportunity to deepen relationships with top accounts through upselling or account-based growth strategies.


Two versions of this analysis were built to maintain transparency:


Version A: Top 10 real customers only, with cumulative percentage calculated against true total revenue (Unknown included in the denominator, excluded from the ranking).
Version B: Top 10 revenue sources including the "Unknown" bucket, to show that the largest single contributor to revenue is in fact unattributed sales — clearly labeled to avoid being mistaken for an actual customer.



Finding 3 — Revenue by Buying Group

After excluding the "N/A" group (the same unattributed transactions seen in the customer analysis), revenue was compared across the two real Buying Groups, including total revenue, order counts, and average order value per group.

A separate "Customer Category" breakdown was considered but discarded, since that dimension contains only a single value across all customers and therefore offers no distribution to analyze.


Overall Conclusions


Data quality issue identified and isolated: Roughly 37% of revenue lacks customer attribution. This should be flagged to the data/operations team as a potential gap in point-of-sale or order-capture processes.
No strong customer concentration risk: The business is not overly dependent on a small set of large accounts — revenue is well diversified across the customer base.
Methodology applied consistently: Unattributed ("Unknown"/"N/A") records were always retained in total-revenue calculations but excluded from any analysis specifically describing identified customers or groups, ensuring percentages remain accurate without misrepresenting data quality gaps as customer behavior.


Suggested Next Steps


Investigate the root cause of the unattributed 37% of sales with the data/operations team.
Extend the Pareto analysis beyond the top 10 (e.g., top 20, top 50) to identify the exact number of customers needed to reach the 80% revenue mark.
Track customer concentration and Buying Group distribution over time (e.g., year over year) to monitor whether diversification is increasing or decreasing.
