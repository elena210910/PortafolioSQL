# PortafolioSQL
Este repositorio contiene mis proyectos de análisis de datos utilizando SQL. Los proyectos presentados aquí se basan en problemas y desafíos que he resuelto para una cadena de tiendas de productos.

# Análisis de las acciones de los usuarios y los pedidos

Este proyecto implica el análisis de las acciones de los usuarios y los pedidos en una cadena de tiendas de productos. Utilizo SQL para explorar los datos, calcular métricas clave y extraer información valiosa.

El objetivo principal de este análisis es proporcionar información sobre la cantidad de productos en los pedidos de nuestros usuarios con información sobre el costo de cada pedido. Luego, calculo varios indicadores útiles, como:

- **Número total de pedidos:** Este indicador muestra el número total de pedidos realizados por los usuarios.
- **Promedio de productos por pedido:** Este indicador muestra la cantidad promedio de productos en cada pedido.
- **Costo total de todas las compras:** Este indicador muestra la suma total de todos los pedidos realizados por los usuarios.
- **Costo promedio del pedido:** Este indicador muestra el costo promedio de cada pedido.
- **Costo mínimo del pedido:** Este indicador muestra el costo del pedido más barato.
- **Costo máximo del pedido:** Este indicador muestra el costo del pedido más caro.

Estos indicadores son útiles para los analistas de datos, ya que proporcionan una visión general de las acciones de los usuarios y los pedidos en la tienda de productos.




# Solución de la consulta a la base de datos

Para resolver esta tarea, utilicé SQL para analizar las acciones de los usuarios y los pedidos en una cadena de tiendas de productos. Mi objetivo principal era proporcionar información sobre la cantidad de productos en los pedidos de nuestros usuarios con información sobre el costo de cada pedido.

Aquí está mi enfoque paso a paso para resolver esta tarea:

1. **Creación de la tabla t2:** Esta tabla contiene información sobre la cantidad de productos que los usuarios han pedido. Solo se tienen en cuenta los pedidos que no han sido cancelados. Esta tabla es crucial para todo el análisis, ya que proporciona una visión general de las acciones de los usuarios en términos de pedidos.

2. **Creación de la tabla t1:** Esta tabla contiene información sobre el costo de cada pedido. Utilizo esta tabla para calcular el costo total de todos los pedidos realizados por los usuarios.

3. **Unión de las tablas t1 y t2:** Utilizo RIGHT JOIN para unir estas dos tablas. Elegí RIGHT JOIN porque la cantidad de productos en los pedidos de nuestros usuarios (t2) es el principal punto de interés para todo el análisis.

4. **Cálculo de indicadores clave:** Con las tablas unidas, calculo varios indicadores útiles, como el número total de pedidos, la cantidad promedio de productos en cada pedido, el costo total de todas las compras, el costo promedio del pedido, el costo mínimo del pedido y el costo máximo del pedido.

Por lo tanto, la tabla t2 es fundamental para toda la consulta, y todas las demás operaciones (incluyendo la unión con la tabla t1 y el cálculo de los indicadores clave) se construyen alrededor de los datos de esta tabla. Por lo tanto, se puede decir que la tabla t2 es decisiva para esta tarea. 😊


