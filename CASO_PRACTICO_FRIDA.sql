--menu_items
--analisis exploratorio
SELECT * FROM MENU_ITEMS;
--Encontrar el número de artículos en el menú.
SELECT COUNT(MENU_ITEM_ID) AS RECUENTO_PLATILLOS
FROM MENU_ITEMS;
--¿Cuál es el artículo menos caro y el más caro en el menú?
--Mas caro SHRIMP SCAMPI
SELECT ITEM_NAME, PRICE FROM MENU_ITEMS
ORDER BY PRICE DESC
LIMIT 1;
--Menos caro EDAMAME
SELECT ITEM_NAME, PRICE FROM MENU_ITEMS
ORDER BY PRICE
LIMIT 1;

--¿Cuántos platos americanos hay en el menú?
-- 6
SELECT CATEGORY, COUNT (MENU_ITEM_ID) FROM MENU_ITEMS
GROUP BY 1;

--¿Cuál es el precio promedio de los platos?
--13.285
SELECT AVG (PRICE) FROM MENU_ITEMS;

--order details
SELECT * FROM ORDER_DETAILS
LIMIT 100;

--¿Cuántos pedidos únicos se realizaron en total?
--5,370
SELECT COUNT (DISTINCT ORDER_ID) FROM ORDER_DETAILS;

--¿Cuáles son los 7 pedidos que tuvieron el mayor número de artículos?
--4305, 1957, 2675, 3473, 440, 443 Y 330
SELECT ORDER_ID, COUNT(ITEM_ID) AS RECUENTO_PLATILLOS FROM ORDER_DETAILS
GROUP BY 1
ORDER BY 2 DESC
LIMIT 7

--¿Cuándo se realizó el primer pedido y el último pedido?
--1er pedido 2023-01-01
--Ultimo pedido 2023-03-31
SELECT MIN(ORDER_DATE) AS PRIMER_PEDIDO, MAX(ORDER_DATE) AS ULTIMO_PEDIDO
FROM ORDER_DETAILS;

--¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
--308
SELECT COUNT(DISTINCT ORDER_ID)
FROM ORDER_DETAILS
WHERE ORDER_DATE BETWEEN '2023-01-01' AND '2023-01-05';

--ANALISIS
SELECT *
FROM ORDER_DETAILS AS A
LEFT JOIN MENU_ITEMS AS B
ON A.ITEM_ID=B.MENU_ITEM_ID;

--PUNTOS CLAVE
/* 
1. Valores nulos en registros de ventas
Hay filas sin item_id, menu_item_id, item_name, category y price.
Esto indica que el sistema permite guardar órdenes 
sin especificar la venta, lo que puede generar inconsistencias
en los reportes de ventas.

2. Registros múltiples por orden
Cada order_id puede tener varios order_details_id,
quiere decir que hay pedidos con más de un platillo, lo que esta bien
pero esto implicaria que para calcular ventas totales por orden
se deben agrupar cuidadosamente los datos.

3. Duplicidad de información en identificadores
Tanto item_id como menu_item_id contienen los mismos valores
Quizá no sea necesario almacenar ambos campos, asi no duplicamos info

4. Ausencia de descuentos o promociones aplicadas
La base solo almacena el precio del platillo,
quizá seria bueno contemplar información de promociones o descuentos
Esto limita los análisis financieros reales de las ventas.

5.Ingresos incompletos
Al faltar precios en ciertos registros, 
los totales de ventas pueden calcularse erróneamente. 

*/