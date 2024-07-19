SELECT t2.user_id, count(t1.order_id) AS orders_count, ROUND(AVG(array_length(t1.product_ids,1)),2) AS avg_order_size, 
SUM(t1.order_price) as sum_order_value, ROUND(AVG(t1.order_price),2) AS avg_order_value,
MIN(t1.order_price) AS min_order_value, MAX (t1.order_price)AS max_order_value
FROM (
    SELECT order_id, SUM(price) AS order_price, product_ids
    FROM (
        SELECT order_id, product_id, price, product_ids
        FROM (
            SELECT order_id, product_ids, unnest(product_ids) AS product_id
            FROM orders
        ) t
        LEFT JOIN products USING(product_id)
        ORDER BY order_id, product_id
    ) zak
    GROUP BY order_id, product_ids
    ORDER BY order_id
) t1
RIGHT JOIN (
    SELECT t.user_id, t.order_id, round(avg(array_length(t.product_ids, 1)), 2) as avg_order_size
    FROM (
        SELECT DISTINCT u.user_id, u.order_id, o.product_ids
        FROM user_actions u
        LEFT JOIN orders o using (order_id)
        WHERE u.order_id not in(
            SELECT order_id
            FROM user_actions
            WHERE action = 'cancel_order'
        )
        ORDER BY u.user_id, u.order_id
    ) t
    GROUP BY t.user_id, t.order_id
) t2 
USING (order_id)
GROUP BY t2.user_id
ORDER BY t2.user_id
LIMIT 1000
