In SQL, a common but easily overlooked error is improper handling of NULL values.  Consider this scenario:  you're trying to find all customers whose total order value is greater than $1000.  A naive approach might use a WHERE clause like this:

```sql
SELECT customer_id, SUM(order_total) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(order_total) > 1000;
```

This query will fail to include customers with NULL order totals.  The `SUM()` function ignores NULL values; if a customer has no orders, `SUM(order_total)` will return 0, and this customer will be incorrectly excluded from the result.

Another error is caused by implicit type conversion. For example comparing a string column with a number directly may lead to unexpected results or errors based on database system.