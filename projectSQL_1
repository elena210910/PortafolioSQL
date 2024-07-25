-- Consulta principal: unimos las tablas t1 y t2, luego agrupamos por user_id y calculamos varias métricas
SELECT t2.user_id, 
       count(t1.order_id) AS orders_count, -- Cuento el número total de pedidos
       ROUND(AVG(array_length(t1.product_ids,1)),2) AS avg_order_size, -- Calculo el tamaño promedio del pedido
       SUM(t1.order_price) as sum_order_value, -- Calculo precio total de los pedidos
       ROUND(AVG(t1.order_price),2) AS avg_order_value, -- Calculo precio promedio del pedido
       MIN(t1.order_price) AS min_order_value, -- Encuentro el precio mínimo del pedido
       MAX (t1.order_price)AS max_order_value -- Encuentro el precio máximo del pedido
FROM (
    -- Subconsulta t1: calculo el precio total de cada pedido
    SELECT order_id, SUM(price) AS order_price, product_ids
    FROM (
        SELECT order_id, product_id, price, product_ids
        FROM (
            -- Descompongo los product_ids en filas separadas para cada pedido
            SELECT order_id, product_ids, unnest(product_ids) AS product_id
            FROM orders
        ) t
        -- Uno la tabla de pedidos con la tabla de productos para obtener el precio de cada producto
        LEFT JOIN products
        USING(product_id)
        ORDER BY order_id, product_id
    ) zak
    GROUP BY order_id, product_ids
    ORDER BY order_id
) t1
-- Uno las tablas t1 y t2 usando RIGHT JOIN porque t2 es la tabla principal para este tipo de analisis
RIGHT JOIN (
    -- Subconsulta t2: calculo el tamaño promedio del pedido para cada usuario
    SELECT t.user_id, t.order_id, round(avg(array_length(t.product_ids, 1)), 2) as avg_order_size
    FROM (
        SELECT DISTINCT u.user_id, u.order_id, o.product_ids
        FROM user_actions u
        LEFT JOIN orders o using (order_id)
        -- Solo considero los pedidos que no han sido cancelados
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
LIMIT 1000 -- Limito los resultados a 1000 filas para evitar sobrecargar la base de datos
