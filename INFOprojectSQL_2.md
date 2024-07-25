Análisis de la actividad del usuario en una tienda de productos utilizando funciones de ventana SQL
____________________________________________________________________________________________________
Descripción de la tarea

Esta tarea implica el análisis de la actividad del usuario en una tienda de productos utilizando PostgreSQL. El objetivo es entender el comportamiento del usuario en términos de sus pedidos diarios.
________________________________________
La tarea resuelve varias preguntas, como:

**¿Cuántos pedidos hace un usuario en un día específico?
**¿Cuál es el número de día activo para un usuario en particular?
**¿Cuántos pedidos hizo un usuario el día anterior?

Metodología
_________________________
Para resolver esta tarea, utilizamos varias funciones y métodos en SQL, incluyendo:

Funciones de agregación: Utilizamos la función COUNT() para contar el número de pedidos que hace un usuario en un día específico.
Funciones de ventana: Utilizamos la función RANK() para determinar el número de día activo para un usuario. También utilizamos la función LAG() para obtener el número de pedidos que un usuario hizo el día anterior.
Cláusula PARTITION BY: Esta cláusula se utiliza para dividir el conjunto de resultados en particiones (grupos) que se pueden procesar individualmente. En este caso, particionamos los datos por user_id.
Cláusula ORDER BY: Esta cláusula se utiliza para ordenar los datos dentro de cada partición, en este caso, por fecha.




