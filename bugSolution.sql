The solution involves explicitly handling NULL values. One approach is to use the `COALESCE()` function to replace NULLs with a suitable value (e.g., 0):

```sql
SELECT customer_id, SUM(COALESCE(order_total, 0)) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(COALESCE(order_total, 0)) > 1000;
```

This revised query handles NULL order totals by treating them as 0, ensuring that customers with no orders are correctly included (or excluded if their total, considering NULLs as 0, is not above 1000).  For implicit type conversion issues, the solution is to cast the columns into compatible data types before comparison. 
For example, if comparing string and numeric values, convert the string to a numeric type using CAST or CONVERT functions. The specific function depends on the database system used.