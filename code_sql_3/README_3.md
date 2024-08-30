**Esta consulta SQL tiene como objetivo calcular el tiempo promedio entre pedidos para cada usuario.**

--La consulta se divide en varias partes:--
[CODIGO AQUI](https://github.com/elena210910/PortafolioSQL/blob/main/code_sql_3/code)

En la subconsulta t, 
se seleccionan todos los pedidos de la tabla user_actions que no han sido cancelados.
Para cada pedido de cada usuario, se calcula el tiempo transcurrido desde el pedido anterior utilizando la función de ventana LAG(). 
El resultado es una tabla con las columnas user_id, order_id, time, order_number y time_lag.

En la subconsulta t1, 
se seleccionan todas las filas de la tabla t y se calcula la diferencia de tiempo entre el pedido actual y el pedido anterior.
El resultado es una tabla con las columnas user_id, order_id, time, order_number, time_lag y time_diff.

En la consulta principal,
se seleccionan solo las filas de la tabla t1 donde time_diff no es nulo.
Esto se hace para excluir los primeros pedidos de cada usuario, ya que no tienen un pedido anterior. 
Luego, se agrupan las filas por user_id y se calcula el tiempo promedio entre pedidos para cada usuario. 
El resultado se redondea al número entero más cercano y se convierte a horas.
Finalmente, se ordenan los resultados por user_id y se limitan a los primeros 1000.

Por lo tanto, el resultado final de esta consulta es una lista de usuarios junto con el tiempo promedio en horas entre sus pedidos.
Esta información puede ser útil para entender el comportamiento de los usuarios y optimizar el servicio. 
Por ejemplo, si un usuario hace pedidos con mucha frecuencia, podría ser un buen candidato para un programa de lealtad. 
Por otro lado, si un usuario hace pedidos con poca frecuencia, podría ser útil investigar por qué y tratar de mejorar su experiencia.
