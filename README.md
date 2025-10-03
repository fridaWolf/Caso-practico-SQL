# Restaurante
## Contexto del analisis
En este proyecto se analizará una base de datos de un restaurante mediante el uso de pgAdmin. En el siguiente conjunto de datos se contiene informacion detallada acerca de las ventas del restaurante. Este análisis nos permitirá obtener una visión más clara del negocio.

# Explorar la tabla “menu_items” para conocer los productos del menú.
1. Encontramos el número de artículos en el menú
   
<img width="262" height="97" alt="image" src="https://github.com/user-attachments/assets/0abe7c67-cd78-4f9a-93b3-a5b68a2aa150" />

2. El articulo menos caro y el más caro en el menú
<img width="453" height="98" alt="image" src="https://github.com/user-attachments/assets/46fc5a26-5be6-49d8-9177-f64e7c570726" />
<img width="448" height="100" alt="image" src="https://github.com/user-attachments/assets/fdd9374d-2621-4a7f-baa5-6c18c75f4731" />

4. La cantidad de platos americanos que hay en el menú
<img width="388" height="207" alt="image" src="https://github.com/user-attachments/assets/4783cc60-d310-4c90-b74b-a779e60988fd" />

5. El precio promedio de los platos
<img width="287" height="94" alt="image" src="https://github.com/user-attachments/assets/e12c2d6c-abb2-4cc6-b8b2-98923ec1ec1c" />

##Explorar la tabla “order_details” para conocer los datos que han sido recolectados.

1. Encontrar Cuántos pedidos únicos se realizaron en total
   <img width="161" height="94" alt="image" src="https://github.com/user-attachments/assets/ea8eecba-a7c1-426e-be11-10cfcae03ccb" />

2. Los 7 pedidos que tuvieron el mayor número de artículos
   <img width="372" height="320" alt="image" src="https://github.com/user-attachments/assets/52cb7160-3303-4a6f-8434-9862446d455e" />

3. Fecha del primer pedido y el último pedido
   <img width="398" height="98" alt="image" src="https://github.com/user-attachments/assets/6ebb9456-1000-4701-8751-c38213a3d12a" />

4. Los pedidos que se hicieron entre el '2023-01-01' y el '2023-01-05'
   <img width="168" height="100" alt="image" src="https://github.com/user-attachments/assets/5b1d4267-086b-4d0d-819d-507cf8bd064e" />

#Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).

<img width="1536" height="674" alt="image" src="https://github.com/user-attachments/assets/c4fc0fa6-35a9-465a-8721-94da87658498" />

###Puntos clave
1. Valores nulos en registros de ventas
Hay filas sin item_id, menu_item_id, item_name, category y price.
Esto indica que el sistema permite guardar órdenes sin especificar la venta, lo que puede generar inconsistencias en los reportes de ventas.

2. Registros múltiples por orden
Cada order_id puede tener varios order_details_id, quiere decir que hay pedidos con más de un platillo, lo que esta bien
pero esto implicaria que para calcular ventas totales por orden se deben agrupar cuidadosamente los datos.

4. Duplicidad de información en identificadores
Tanto item_id como menu_item_id contienen los mismos valores. Quizá no sea necesario almacenar ambos campos, asi no duplicamos info

5. Ausencia de descuentos o promociones aplicadas
La base solo almacena el precio del platillo,quizá seria bueno contemplar información de promociones o descuentos. Esto limita los análisis financieros reales de las ventas.

5.Ingresos incompletos
Al faltar precios en ciertos registros, los totales de ventas pueden calcularse erróneamente.


