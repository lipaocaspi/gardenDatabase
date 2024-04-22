# gardenDatabase

#### Normalización



#### Consultas SQL

##### **Creación de tablas**

```sql
CREATE DATABASE garden;
USE garden;
```

##### **Inserción de datos**

```sql

```

```sql

```

##### **Consultas sobre una tabla**

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   SELECT o.codigo_oficina, c.nombre_ciudad
   FROM oficina AS o, direccion AS d, ciudad AS c
   WHERE o.codigo_direccion = d.codigo_direccion AND c.codigo_ciudad = d.codigo_ciudad;
   
   +----------------+----------------------+
   | codigo_oficina | nombre_ciudad        |
   +----------------+----------------------+
   | BCN-ES         | Barcelona            |
   | BOS-USA        | Boston               |
   | LON-UK         | Londres              |
   | MAD-ES         | Madrid               |
   | PAR-FR         | Paris                |
   | SFC-USA        | San Francisco        |
   | SYD-AU         | Sydney               |
   | TAL-ES         | Talavera de la Reina |
   | TOK-JP         | Tokyo                |
   +----------------+----------------------+
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   SELECT c.nombre_ciudad, t.numero_telefono
   FROM pais AS p, region AS r, ciudad AS c, telefono AS t, oficina AS o, direccion AS d
   WHERE p.codigo_pais = r.codigo_pais
       AND r.codigo_region = c.codigo_region
       AND c.codigo_ciudad = d.codigo_ciudad
       AND d.codigo_direccion = o.codigo_direccion
       AND o.codigo_oficina = t.codigo_oficina 
       AND p.nombre_pais = 'España';
       
   +----------------------+-----------------+
   | nombre_ciudad        | numero_telefono |
   +----------------------+-----------------+
   | Madrid               | +34 91 7514487  |
   | Barcelona            | +34 93 3561182  |
   | Talavera de la Reina | +34 925 867231  |
   +----------------------+-----------------+
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

   ```sql
   SELECT e.nombre, e.apellido1, e.apellido2, e.email
   FROM empleado AS e
   WHERE e.codigo_jefe = 7;
   
   +---------+-----------+-----------+--------------------------+
   | nombre  | apellido1 | apellido2 | email                    |
   +---------+-----------+-----------+--------------------------+
   | Mariano | López     | Murcia    | mlopez@jardineria.es     |
   | Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
   | Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |
   +---------+-----------+-----------+--------------------------+
   ```

   

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

   ```sql
   SELECT p.nombre_puesto, e.nombre, e.apellido1, e.apellido2, e.email
   FROM puesto AS p, empleado AS e
   WHERE p.codigo_puesto = e.codigo_puesto AND e.codigo_jefe IS NULL;
   
   +------------------+--------+-----------+-----------+----------------------+
   | nombre_puesto    | nombre | apellido1 | apellido2 | email                |
   +------------------+--------+-----------+-----------+----------------------+
   | Director General | Marcos | Magaña    | Perez     | marcos@jardineria.es |
   +------------------+--------+-----------+-----------+----------------------+
   ```

   

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

   ```sql
   
   ```

   

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```sql
   SELECT cl.nombre_cliente
   FROM cliente AS cl, pais AS p, region AS r, ciudad AS c, direccion AS d
   WHERE cl.codigo_cliente = d.codigo_cliente
   	AND d.codigo_ciudad = c.codigo_ciudad
       AND c.codigo_region = r.codigo_region
       AND r.codigo_pais = p.codigo_pais
       AND p.nombre_pais = 'España';
       
   +--------------------------------+
   | nombre_cliente                 |
   +--------------------------------+
   | Lasas S.A.                     |
   | Lasas S.A.                     |
   | Flores Marivi                  |
   | Fuenla City                    |
   | Jardineria Sara                |
   | Campohermoso                   |
   | Beragua                        |
   | Club Golf Puerta del hierro    |
   | Naturagua                      |
   | DaraDistribuciones             |
   | Madrileña de riegos            |
   | Dardena S.A.                   |
   | Jardin de Flores               |
   | Naturajardin                   |
   | Jardines y Mansiones Cactus SL |
   | Jardinerías Matías SL          |
   | Flores S.L.                    |
   | Camunas Jardines S.L.          |
   | Vivero Humanes                 |
   | Top Campo                      |
   | Agrojardin                     |
   | Flowers, S.A                   |
   | Golf S.A.                      |
   | Americh Golf Management SL     |
   | El Prat                        |
   | Aloha                          |
   | Sotogrande                     |
   +--------------------------------+
   ```

   

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

   ```sql
   SELECT nombre_estado
   FROM estado;
   
   +---------------+
   | nombre_estado |
   +---------------+
   | Entregado     |
   | Pendiente     |
   | Rechazado     |
   +---------------+
   ```

   

8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
   • Utilizando la función YEAR de MySQL.
   • Utilizando la función DATE_FORMAT de MySQL.
   • Sin utilizar ninguna de las funciones anteriores.

   ```sql
   SELECT DISTINCT(c.codigo_cliente)
   FROM cliente AS c, pago AS p
   WHERE p.codigo_cliente = c.codigo_cliente AND YEAR(p.fecha_pago) = '2008';
   
   +----------------+
   | codigo_cliente |
   +----------------+
   |              1 |
   |             13 |
   |             14 |
   |             26 |
   +----------------+
   ```
   
   ```sql
   SELECT DISTINCT(c.codigo_cliente)
   FROM cliente AS c, pago AS p
   WHERE p.codigo_cliente = c.codigo_cliente AND DATE_FORMAT(p.fecha_pago, '%Y') = '2008';
   
   +----------------+
   | codigo_cliente |
   +----------------+
   |              1 |
   |             13 |
   |             14 |
   |             26 |
   +----------------+
   ```
   
   ```sql
   SELECT DISTINCT(c.codigo_cliente)
   FROM cliente AS c, pago AS p
   WHERE p.codigo_cliente = c.codigo_cliente AND p.fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';
   
   +----------------+
   | codigo_cliente |
   +----------------+
   |              1 |
   |             13 |
   |             14 |
   |             26 |
   +----------------+
   ```
   
   
   
9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```sql
   SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
   FROM pedido
   WHERE fecha_entrega > fecha_esperada;
   
   +---------------+----------------+----------------+---------------+
   | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
   +---------------+----------------+----------------+---------------+
   |             9 |              1 | 2008-12-27     | 2008-12-28    |
   |            13 |              7 | 2009-01-14     | 2009-01-15    |
   |            16 |              7 | 2009-01-07     | 2009-01-15    |
   |            17 |              7 | 2009-01-09     | 2009-01-11    |
   |            18 |              9 | 2009-01-06     | 2009-01-07    |
   |            22 |              9 | 2009-01-11     | 2009-01-13    |
   |            28 |              3 | 2009-02-17     | 2009-02-20    |
   |            31 |             13 | 2008-09-30     | 2008-10-04    |
   |            32 |              4 | 2007-01-19     | 2007-01-27    |
   |            38 |             19 | 2009-03-06     | 2009-03-07    |
   |            39 |             19 | 2009-03-07     | 2009-03-09    |
   |            40 |             19 | 2009-03-10     | 2009-03-13    |
   |            42 |             19 | 2009-03-23     | 2009-03-27    |
   |            43 |             23 | 2009-03-26     | 2009-03-28    |
   |            44 |             23 | 2009-03-27     | 2009-03-30    |
   |            45 |             23 | 2009-03-04     | 2009-03-07    |
   |            46 |             23 | 2009-03-04     | 2009-03-05    |
   |            49 |             26 | 2008-07-22     | 2008-07-30    |
   |            55 |             14 | 2009-01-10     | 2009-01-11    |
   |            60 |              1 | 2008-12-27     | 2008-12-28    |
   |            68 |              3 | 2009-02-17     | 2009-02-20    |
   |            92 |             27 | 2009-04-30     | 2009-05-03    |
   |            96 |             35 | 2008-04-12     | 2008-04-13    |
   |           103 |             30 | 2009-01-20     | 2009-01-24    |
   |           106 |             30 | 2009-05-15     | 2009-05-20    |
   |           112 |             36 | 2009-04-06     | 2009-05-07    |
   |           113 |             36 | 2008-11-09     | 2009-01-09    |
   |           114 |             36 | 2009-01-29     | 2009-01-31    |
   |           115 |             36 | 2009-01-26     | 2009-02-27    |
   |           123 |             30 | 2009-01-20     | 2009-01-24    |
   |           126 |             30 | 2009-05-15     | 2009-05-20    |
   |           128 |             38 | 2008-12-10     | 2008-12-29    |
   +---------------+----------------+----------------+---------------+
   ```

   

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
    • Utilizando la función ADDDATE de MySQL.
    • Utilizando la función DATEDIFF de MySQL.
    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

    ```sql
    SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE ADDDATE(fecha_entrega, INTERVAL 2 DAY) <= fecha_esperada;
    
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             2 |              5 | 2007-10-28     | 2007-10-26    |
    |            24 |             14 | 2008-07-31     | 2008-07-25    |
    |            30 |             13 | 2008-09-03     | 2008-08-31    |
    |            36 |             14 | 2008-12-15     | 2008-12-10    |
    |            53 |             13 | 2008-11-15     | 2008-11-09    |
    |            89 |             35 | 2007-12-13     | 2007-12-10    |
    |            91 |             27 | 2009-03-29     | 2009-03-27    |
    |            93 |             27 | 2009-05-30     | 2009-05-17    |
    +---------------+----------------+----------------+---------------+
    ```
    
    ```sql
    SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
    
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             2 |              5 | 2007-10-28     | 2007-10-26    |
    |            24 |             14 | 2008-07-31     | 2008-07-25    |
    |            30 |             13 | 2008-09-03     | 2008-08-31    |
    |            36 |             14 | 2008-12-15     | 2008-12-10    |
    |            53 |             13 | 2008-11-15     | 2008-11-09    |
    |            89 |             35 | 2007-12-13     | 2007-12-10    |
    |            91 |             27 | 2009-03-29     | 2009-03-27    |
    |            93 |             27 | 2009-05-30     | 2009-05-17    |
    +---------------+----------------+----------------+---------------+
    ```
    
    ```sql
    SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE (fecha_esperada - fecha_entrega) >= 2;
    
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             2 |              5 | 2007-10-28     | 2007-10-26    |
    |            24 |             14 | 2008-07-31     | 2008-07-25    |
    |            30 |             13 | 2008-09-03     | 2008-08-31    |
    |            36 |             14 | 2008-12-15     | 2008-12-10    |
    |            53 |             13 | 2008-11-15     | 2008-11-09    |
    |            89 |             35 | 2007-12-13     | 2007-12-10    |
    |            91 |             27 | 2009-03-29     | 2009-03-27    |
    |            93 |             27 | 2009-05-30     | 2009-05-17    |
    +---------------+----------------+----------------+---------------+
    ```
    
    
    
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    SELECT p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.comentarios, p.codigo_cliente, e.nombre_estado
    FROM pedido AS p, estado AS e
    WHERE p.codigo_estado = e.codigo_estado 
    	AND p.codigo_estado = 3 
        AND (YEAR(p.fecha_esperada) = '2009' OR YEAR(p.fecha_entrega) = '2009');
        
    +---------------+--------------+----------------+---------------+--------------------------------------------------------------------------+----------------+---------------+
    | codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega | comentarios                                                              | codigo_cliente | nombre_estado |
    +---------------+--------------+----------------+---------------+--------------------------------------------------------------------------+----------------+---------------+
    |            14 | 2009-01-02   | 2009-01-02     | NULL          | mal pago                                                                 |              7 | Rechazado     |
    |            21 | 2009-01-09   | 2009-01-09     | 2009-01-09    | mal pago                                                                 |              9 | Rechazado     |
    |            23 | 2008-12-30   | 2009-01-10     | NULL          | El pedido fue anulado por el cliente                                     |              5 | Rechazado     |
    |            25 | 2009-02-02   | 2009-02-08     | NULL          | El cliente carece de saldo en la cuenta asociada                         |              1 | Rechazado     |
    |            26 | 2009-02-06   | 2009-02-12     | NULL          | El cliente anula la operacion para adquirir mas producto                 |              3 | Rechazado     |
    |            35 | 2008-03-10   | 2009-03-20     | NULL          | Limite de credito superado                                               |              4 | Rechazado     |
    |            40 | 2009-03-09   | 2009-03-10     | 2009-03-13    | NULL                                                                     |             19 | Rechazado     |
    |            46 | 2009-04-03   | 2009-03-04     | 2009-03-05    | NULL                                                                     |             23 | Rechazado     |
    |            56 | 2008-12-19   | 2009-01-20     | NULL          | El cliente a anulado el pedido el dia 2009-01-10                         |             13 | Rechazado     |
    |            65 | 2009-02-02   | 2009-02-08     | NULL          | El cliente carece de saldo en la cuenta asociada                         |              1 | Rechazado     |
    |            66 | 2009-02-06   | 2009-02-12     | NULL          | El cliente anula la operacion para adquirir mas producto                 |              3 | Rechazado     |
    |            74 | 2009-01-14   | 2009-01-22     | NULL          | El pedido no llego el dia que queria el cliente por fallo del transporte |             15 | Rechazado     |
    |            81 | 2009-01-18   | 2009-01-24     | NULL          | Los producto estaban en mal estado                                       |             28 | Rechazado     |
    |           101 | 2009-03-07   | 2009-03-27     | NULL          | El pedido fue rechazado por el cliente                                   |             16 | Rechazado     |
    |           105 | 2009-02-14   | 2009-02-20     | NULL          | el producto ha sido rechazado por la pesima calidad                      |             30 | Rechazado     |
    |           113 | 2008-10-28   | 2008-11-09     | 2009-01-09    | El producto ha sido rechazado por la tardanza de el envio                |             36 | Rechazado     |
    |           120 | 2009-03-07   | 2009-03-27     | NULL          | El pedido fue rechazado por el cliente                                   |             16 | Rechazado     |
    |           125 | 2009-02-14   | 2009-02-20     | NULL          | el producto ha sido rechazado por la pesima calidad                      |             30 | Rechazado     |
    +---------------+--------------+----------------+---------------+--------------------------------------------------------------------------+----------------+---------------+
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

    ```sql
    SELECT p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.comentarios, p.codigo_cliente, e.nombre_estado
    FROM pedido AS p, estado AS e
    WHERE p.codigo_estado = e.codigo_estado
    	AND p.codigo_estado = 1 
        AND MONTH(p.fecha_entrega) = '1';
        
    +---------------+--------------+----------------+---------------+--------------------------------------------------------+----------------+---------------+
    | codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega | comentarios                                            | codigo_cliente | nombre_estado |
    +---------------+--------------+----------------+---------------+--------------------------------------------------------+----------------+---------------+
    |             1 | 2006-01-17   | 2006-01-19     | 2006-01-19    | Pagado a plazos                                        |              5 | Entregado     |
    |            13 | 2009-01-12   | 2009-01-14     | 2009-01-15    | NULL                                                   |              7 | Entregado     |
    |            15 | 2009-01-09   | 2009-01-12     | 2009-01-11    | NULL                                                   |              7 | Entregado     |
    |            16 | 2009-01-06   | 2009-01-07     | 2009-01-15    | NULL                                                   |              7 | Entregado     |
    |            17 | 2009-01-08   | 2009-01-09     | 2009-01-11    | mal estado                                             |              7 | Entregado     |
    |            18 | 2009-01-05   | 2009-01-06     | 2009-01-07    | NULL                                                   |              9 | Entregado     |
    |            22 | 2009-01-11   | 2009-01-11     | 2009-01-13    | NULL                                                   |              9 | Entregado     |
    |            32 | 2007-01-07   | 2007-01-19     | 2007-01-27    | Entrega tardia, el cliente puso reclamacion            |              4 | Entregado     |
    |            55 | 2008-12-10   | 2009-01-10     | 2009-01-11    | Retrasado 1 dia por problemas de transporte            |             14 | Entregado     |
    |            58 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Todo correcto                                          |              3 | Entregado     |
    |            64 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Todo correcto                                          |              1 | Entregado     |
    |            75 | 2009-01-11   | 2009-01-13     | 2009-01-13    | El pedido llego perfectamente                          |             15 | Entregado     |
    |            79 | 2009-01-12   | 2009-01-13     | 2009-01-13    | NULL                                                   |             28 | Entregado     |
    |            82 | 2009-01-20   | 2009-01-29     | 2009-01-29    | El pedido llego un poco mas tarde de la hora fijada    |             28 | Entregado     |
    |            95 | 2008-01-04   | 2008-01-19     | 2008-01-19    | NULL                                                   |             35 | Entregado     |
    |           100 | 2009-01-10   | 2009-01-15     | 2009-01-15    | El pedido llego perfectamente                          |             16 | Entregado     |
    |           102 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Pago pendiente                                         |             16 | Entregado     |
    |           114 | 2009-01-15   | 2009-01-29     | 2009-01-31    | El envio llego dos dias más tarde debido al mal tiempo |             36 | Entregado     |
    |           119 | 2009-01-10   | 2009-01-15     | 2009-01-15    | El pedido llego perfectamente                          |             16 | Entregado     |
    |           121 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Pago pendiente                                         |             16 | Entregado     |
    +---------------+--------------+----------------+---------------+--------------------------------------------------------+----------------+---------------+
    ```

    

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```sql
    SELECT p.id_transaccion, p.fecha_pago, p.total, f.nombre_forma
    FROM pago AS p, forma_pago AS f
    WHERE p.codigo_forma = f.codigo_forma
    	AND f.nombre_forma = 'PayPal'
    	AND YEAR(p.fecha_pago) = '2008'
    ORDER BY p.fecha_pago DESC;
    
    +----------------+------------+----------+--------------+
    | id_transaccion | fecha_pago | total    | nombre_forma |
    +----------------+------------+----------+--------------+
    | ak-std-000002  | 2008-12-10 |  2000.00 | PayPal       |
    | ak-std-000001  | 2008-11-10 |  2000.00 | PayPal       |
    | ak-std-000014  | 2008-08-04 |  2246.00 | PayPal       |
    | ak-std-000015  | 2008-07-15 |  4160.00 | PayPal       |
    | ak-std-000020  | 2008-03-18 | 18846.00 | PayPal       |
    +----------------+------------+----------+--------------+
    ```

    

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

    ```sql
    SELECT nombre_forma
    FROM forma_pago;
    
    +---------------+
    | nombre_forma  |
    +---------------+
    | PayPal        |
    | Transferencia |
    | Cheque        |
    +---------------+
    ```

    

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

    ```sql
    SELECT nombre, gama, cantidad_en_stock, precio_venta
    FROM producto
    WHERE gama = 'Ornamentales' 
    	AND cantidad_en_stock > 100
    ORDER BY precio_venta DESC;
    
    +--------------------------------------------+--------------+-------------------+--------------+
    | nombre                                     | gama         | cantidad_en_stock | precio_venta |
    +--------------------------------------------+--------------+-------------------+--------------+
    | Forsytia Intermedia "Lynwood"              | Ornamentales |               120 |         7.00 |
    | Hibiscus Syriacus  "Diana" -Blanco Puro    | Ornamentales |               120 |         7.00 |
    | Hibiscus Syriacus  "Helene" -Blanco-C.rojo | Ornamentales |               120 |         7.00 |
    | Hibiscus Syriacus "Pink Giant" Rosa        | Ornamentales |               120 |         7.00 |
    | Escallonia (Mix)                           | Ornamentales |               120 |         5.00 |
    | Evonimus Emerald Gayeti                    | Ornamentales |               120 |         5.00 |
    | Evonimus Pulchellus                        | Ornamentales |               120 |         5.00 |
    | Laurus Nobilis Arbusto - Ramificado Bajo   | Ornamentales |               120 |         5.00 |
    | Lonicera Nitida                            | Ornamentales |               120 |         5.00 |
    | Lonicera Nitida "Maigrum"                  | Ornamentales |               120 |         5.00 |
    | Lonicera Pileata                           | Ornamentales |               120 |         5.00 |
    | Philadelphus "Virginal"                    | Ornamentales |               120 |         5.00 |
    | Prunus pisardii                            | Ornamentales |               120 |         5.00 |
    | Viburnum Tinus "Eve Price"                 | Ornamentales |               120 |         5.00 |
    | Weigelia "Bristol Ruby"                    | Ornamentales |               120 |         5.00 |
    +--------------------------------------------+--------------+-------------------+--------------+
    ```

    

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```sql
    
    ```

    

##### **Consultas multitabla** (Composición interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

   ```sql
   
   ```

   

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

   ```sql
   
   ```

   

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

   ```sql
   
   ```

   

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

   ```sql
   
   ```

   

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

   ```sql
   
   ```

   

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```sql
   
   ```

   

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

   ```sql
   
   ```

   

8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

   ```sql
   SELECT e1.nombre AS nombre_empleado, e1.apellido1 AS apellido1_empleado, e2.nombre AS nombre_jefe, e2.apellido1 AS apellido1_jefe
   FROM empleado AS e1
   INNER JOIN empleado AS e2
   ON e1.codigo_jefe = e2.codigo_empleado;
   
   +-----------------+--------------------+-------------+----------------+
   | nombre_empleado | apellido1_empleado | nombre_jefe | apellido1_jefe |
   +-----------------+--------------------+-------------+----------------+
   | Ruben           | López              | Marcos      | Magaña         |
   | Alberto         | Soria              | Ruben       | López          |
   | Maria           | Solís              | Ruben       | López          |
   | Felipe          | Rosas              | Alberto     | Soria          |
   | Juan Carlos     | Ortiz              | Alberto     | Soria          |
   | Carlos          | Soria              | Alberto     | Soria          |
   | Mariano         | López              | Carlos      | Soria          |
   | Lucio           | Campoamor          | Carlos      | Soria          |
   | Hilario         | Rodriguez          | Carlos      | Soria          |
   | Emmanuel        | Magaña             | Alberto     | Soria          |
   | José Manuel     | Martinez           | Emmanuel    | Magaña         |
   | David           | Palma              | Emmanuel    | Magaña         |
   | Oscar           | Palma              | Emmanuel    | Magaña         |
   | Francois        | Fignon             | Alberto     | Soria          |
   | Lionel          | Narvaez            | Francois    | Fignon         |
   | Laurent         | Serra              | Francois    | Fignon         |
   | Michael         | Bolton             | Alberto     | Soria          |
   | Walter Santiago | Sanchez            | Michael     | Bolton         |
   | Hilary          | Washington         | Alberto     | Soria          |
   | Marcus          | Paxton             | Hilary      | Washington     |
   | Lorena          | Paxton             | Hilary      | Washington     |
   | Nei             | Nishikori          | Alberto     | Soria          |
   | Narumi          | Riko               | Nei         | Nishikori      |
   | Takuma          | Nomura             | Nei         | Nishikori      |
   | Amy             | Johnson            | Alberto     | Soria          |
   | Larry           | Westfalls          | Amy         | Johnson        |
   | John            | Walton             | Amy         | Johnson        |
   | Kevin           | Fallmer            | Alberto     | Soria          |
   | Julian          | Bellinelli         | Kevin       | Fallmer        |
   | Mariko          | Kishi              | Kevin       | Fallmer        |
   +-----------------+--------------------+-------------+----------------+
   ```

   

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de su jefe.

   ```sql
   SELECT e1.nombre AS nombre_empleado, e1.apellido1 AS apellido1_empleado, e2.nombre AS nombre_jefe, e2.apellido1 AS apellido1_jefe, e3.nombre AS nombre_jefe_jefe, e3.apellido1 AS apellido1_jefe_jefe
   FROM empleado AS e1
   INNER JOIN empleado AS e2
   ON e1.codigo_jefe = e2.codigo_empleado
   INNER JOIN empleado AS e3
   ON e2.codigo_jefe = e3.codigo_empleado;
   
   +-----------------+--------------------+-------------+----------------+------------------+---------------------+
   | nombre_empleado | apellido1_empleado | nombre_jefe | apellido1_jefe | nombre_jefe_jefe | apellido1_jefe_jefe |
   +-----------------+--------------------+-------------+----------------+------------------+---------------------+
   | Alberto         | Soria              | Ruben       | López          | Marcos           | Magaña              |
   | Maria           | Solís              | Ruben       | López          | Marcos           | Magaña              |
   | Felipe          | Rosas              | Alberto     | Soria          | Ruben            | López               |
   | Juan Carlos     | Ortiz              | Alberto     | Soria          | Ruben            | López               |
   | Carlos          | Soria              | Alberto     | Soria          | Ruben            | López               |
   | Mariano         | López              | Carlos      | Soria          | Alberto          | Soria               |
   | Lucio           | Campoamor          | Carlos      | Soria          | Alberto          | Soria               |
   | Hilario         | Rodriguez          | Carlos      | Soria          | Alberto          | Soria               |
   | Emmanuel        | Magaña             | Alberto     | Soria          | Ruben            | López               |
   | José Manuel     | Martinez           | Emmanuel    | Magaña         | Alberto          | Soria               |
   | David           | Palma              | Emmanuel    | Magaña         | Alberto          | Soria               |
   | Oscar           | Palma              | Emmanuel    | Magaña         | Alberto          | Soria               |
   | Francois        | Fignon             | Alberto     | Soria          | Ruben            | López               |
   | Lionel          | Narvaez            | Francois    | Fignon         | Alberto          | Soria               |
   | Laurent         | Serra              | Francois    | Fignon         | Alberto          | Soria               |
   | Michael         | Bolton             | Alberto     | Soria          | Ruben            | López               |
   | Walter Santiago | Sanchez            | Michael     | Bolton         | Alberto          | Soria               |
   | Hilary          | Washington         | Alberto     | Soria          | Ruben            | López               |
   | Marcus          | Paxton             | Hilary      | Washington     | Alberto          | Soria               |
   | Lorena          | Paxton             | Hilary      | Washington     | Alberto          | Soria               |
   | Nei             | Nishikori          | Alberto     | Soria          | Ruben            | López               |
   | Narumi          | Riko               | Nei         | Nishikori      | Alberto          | Soria               |
   | Takuma          | Nomura             | Nei         | Nishikori      | Alberto          | Soria               |
   | Amy             | Johnson            | Alberto     | Soria          | Ruben            | López               |
   | Larry           | Westfalls          | Amy         | Johnson        | Alberto          | Soria               |
   | John            | Walton             | Amy         | Johnson        | Alberto          | Soria               |
   | Kevin           | Fallmer            | Alberto     | Soria          | Ruben            | López               |
   | Julian          | Bellinelli         | Kevin       | Fallmer        | Alberto          | Soria               |
   | Mariko          | Kishi              | Kevin       | Fallmer        | Alberto          | Soria               |
   +-----------------+--------------------+-------------+----------------+------------------+---------------------+
   ```

   

10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

    ```sql
    SELECT DISTINCT(c.nombre_cliente)
    FROM cliente AS c
    INNER JOIN pedido AS p
    ON c.codigo_cliente = p.codigo_cliente AND p.fecha_entrega > p.fecha_esperada;
    
    +--------------------------------+
    | nombre_cliente                 |
    +--------------------------------+
    | GoldFish Garden                |
    | Beragua                        |
    | Naturagua                      |
    | Gardening Associates           |
    | Camunas Jardines S.L.          |
    | Gerudo Valley                  |
    | Golf S.A.                      |
    | Sotogrande                     |
    | Jardines y Mansiones Cactus SL |
    | Dardena S.A.                   |
    | Jardinerías Matías SL          |
    | Tutifruti S.A                  |
    | Jardineria Sara                |
    | Flores S.L.                    |
    | El Jardin Viviente S.L         |
    +--------------------------------+
    ```

    

11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

    ```sql
    SELECT DISTINCT(g.gama), c.nombre_cliente
    FROM gama_producto AS g
    INNER JOIN producto AS p
    ON g.gama = p.gama
    INNER JOIN detalle_pedido AS dp
    ON p.codigo_producto = dp.producto_codigo_producto
    INNER JOIN pedido AS pe
    ON dp.pedido_codigo_pedido = pe.codigo_pedido
    INNER JOIN cliente AS c
    ON pe.codigo_cliente = c.codigo_cliente;
    
    +--------------+--------------------------------+
    | gama         | nombre_cliente                 |
    +--------------+--------------------------------+
    | Frutales     | GoldFish Garden                |
    | Aromáticas   | GoldFish Garden                |
    | Ornamentales | GoldFish Garden                |
    | Frutales     | Gardening Associates           |
    | Ornamentales | Gardening Associates           |
    | Herramientas | Gerudo Valley                  |
    | Ornamentales | Gerudo Valley                  |
    | Frutales     | Gerudo Valley                  |
    | Frutales     | Tendo Garden                   |
    | Ornamentales | Tendo Garden                   |
    | Aromáticas   | Tendo Garden                   |
    | Herramientas | Beragua                        |
    | Frutales     | Beragua                        |
    | Ornamentales | Beragua                        |
    | Herramientas | Naturagua                      |
    | Frutales     | Naturagua                      |
    | Ornamentales | Naturagua                      |
    | Aromáticas   | Camunas Jardines S.L.          |
    | Frutales     | Camunas Jardines S.L.          |
    | Ornamentales | Camunas Jardines S.L.          |
    | Herramientas | Dardena S.A.                   |
    | Frutales     | Dardena S.A.                   |
    | Ornamentales | Dardena S.A.                   |
    | Frutales     | Jardin de Flores               |
    | Ornamentales | Jardin de Flores               |
    | Aromáticas   | Jardin de Flores               |
    | Herramientas | Jardin de Flores               |
    | Ornamentales | Flores Marivi                  |
    | Frutales     | Flores Marivi                  |
    | Aromáticas   | Flores Marivi                  |
    | Herramientas | Flores Marivi                  |
    | Herramientas | Golf S.A.                      |
    | Aromáticas   | Golf S.A.                      |
    | Aromáticas   | Sotogrande                     |
    | Frutales     | Sotogrande                     |
    | Frutales     | Jardines y Mansiones Cactus SL |
    | Ornamentales | Jardines y Mansiones Cactus SL |
    | Aromáticas   | Jardinerías Matías SL          |
    | Frutales     | Jardinerías Matías SL          |
    | Herramientas | Jardinerías Matías SL          |
    | Ornamentales | Agrojardin                     |
    | Frutales     | Agrojardin                     |
    | Frutales     | Jardineria Sara                |
    | Ornamentales | Jardineria Sara                |
    | Aromáticas   | Jardineria Sara                |
    | Herramientas | Jardineria Sara                |
    | Frutales     | Tutifruti S.A                  |
    | Ornamentales | Tutifruti S.A                  |
    | Frutales     | Flores S.L.                    |
    | Frutales     | El Jardin Viviente S.L         |
    | Ornamentales | El Jardin Viviente S.L         |
    | Aromáticas   | El Jardin Viviente S.L         |
    | Herramientas | El Jardin Viviente S.L         |
    +--------------+--------------------------------+
    ```
    
    

##### **Consultas multitabla** (Composición externa)

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pago AS p
   ON c.codigo_cliente = p.codigo_cliente
   WHERE p.codigo_cliente IS NULL;
   
   +-----------------------------+
   | nombre_cliente              |
   +-----------------------------+
   | Lasas S.A.                  |
   | Club Golf Puerta del hierro |
   | DaraDistribuciones          |
   | Madrileña de riegos         |
   | Lasas S.A.                  |
   | Flowers, S.A                |
   | Naturajardin                |
   | Americh Golf Management SL  |
   | Aloha                       |
   | El Prat                     |
   | Vivero Humanes              |
   | Fuenla City                 |
   | Top Campo                   |
   | Campohermoso                |
   | france telecom              |
   | Musée du Louvre             |
   | Flores S.L.                 |
   | The Magic Garden            |
   +-----------------------------+
   ```

   

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pedido AS p
   ON c.codigo_cliente = p.codigo_cliente
   WHERE p.codigo_cliente IS NULL;
   
   +-----------------------------+
   | nombre_cliente              |
   +-----------------------------+
   | Lasas S.A.                  |
   | Club Golf Puerta del hierro |
   | DaraDistribuciones          |
   | Madrileña de riegos         |
   | Lasas S.A.                  |
   | Flowers, S.A                |
   | Naturajardin                |
   | Americh Golf Management SL  |
   | Aloha                       |
   | El Prat                     |
   | Vivero Humanes              |
   | Fuenla City                 |
   | Top Campo                   |
   | Campohermoso                |
   | france telecom              |
   | Musée du Louvre             |
   | The Magic Garden            |
   +-----------------------------+
   ```

   

3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

   ```sql
   SELECT c.nombre_cliente
   FROM cliente AS c
   LEFT JOIN pago AS p
   ON c.codigo_cliente = p.codigo_cliente
   LEFT JOIN pedido AS pe
   ON c.codigo_cliente = pe.codigo_cliente
   WHERE p.codigo_cliente IS NULL AND pe.codigo_cliente IS NULL;
   
   +-----------------------------+
   | nombre_cliente              |
   +-----------------------------+
   | Lasas S.A.                  |
   | Club Golf Puerta del hierro |
   | DaraDistribuciones          |
   | Madrileña de riegos         |
   | Lasas S.A.                  |
   | Flowers, S.A                |
   | Naturajardin                |
   | Americh Golf Management SL  |
   | Aloha                       |
   | El Prat                     |
   | Vivero Humanes              |
   | Fuenla City                 |
   | Top Campo                   |
   | Campohermoso                |
   | france telecom              |
   | Musée du Louvre             |
   | The Magic Garden            |
   +-----------------------------+
   ```

   

4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

   ```sql
   
   ```

   

5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

   ```sql
   
   ```

   

6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

   ```sql
   
   ```




7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

   ```sql
   
   ```

   

8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

   ```sql
   SELECT DISTINCT(p.nombre)
   FROM producto AS p
   LEFT JOIN detalle_pedido AS dp
   ON p.codigo_producto = dp.producto_codigo_producto
   WHERE dp.producto_codigo_producto IS NULL;
   
   +-------------------------------------------------------------+
   | nombre                                                      |
   +-------------------------------------------------------------+
   | Olea-Olivos                                                 |
   | Calamondin Mini                                             |
   | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
   | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
   | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
   | Albaricoquero Corbato                                       |
   | Albaricoquero Moniqui                                       |
   | Albaricoquero Kurrot                                        |
   | Cerezo Burlat                                               |
   | Cerezo Picota                                               |
   | Ciruelo R. Claudia Verde                                    |
   | Ciruelo Golden Japan                                        |
   | Ciruelo Claudia Negra                                       |
   | Higuera Verdal                                              |
   | Higuera Breva                                               |
   | Melocotonero Spring Crest                                   |
   | Melocotonero Federica                                       |
   | Parra Uva de Mesa                                           |
   | Mandarino -Plantón joven                                    |
   | Peral Castell                                               |
   | Peral Williams                                              |
   | Peral Conference                                            |
   | Olivo Cipresino                                             |
   | Albaricoquero                                               |
   | Cerezo                                                      |
   | Ciruelo                                                     |
   | Granado                                                     |
   | Higuera                                                     |
   | Manzano                                                     |
   | Melocotonero                                                |
   | Membrillero                                                 |
   | Arbustos Mix Maceta                                         |
   | Mimosa Injerto CLASICA Dealbata                             |
   | Mimosa Semilla Bayleyana                                    |
   | Mimosa Semilla Espectabilis                                 |
   | Mimosa Semilla Longifolia                                   |
   | Mimosa Semilla Floribunda 4 estaciones                      |
   | Abelia Floribunda                                           |
   | Callistemom (Mix)                                           |
   | Corylus Avellana "Contorta"                                 |
   | Escallonia (Mix)                                            |
   | Evonimus Emerald Gayeti                                     |
   | Evonimus Pulchellus                                         |
   | Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  |
   | Hibiscus Syriacus "Pink Giant" Rosa                         |
   | Lonicera Nitida "Maigrum"                                   |
   | Prunus pisardii                                             |
   | Weigelia "Bristol Ruby"                                     |
   | Leptospermum formado PIRAMIDE                               |
   | Leptospermum COPA                                           |
   | Nerium oleander-CALIDAD "GARDEN"                            |
   | Nerium Oleander Arbusto GRANDE                              |
   | Nerium oleander COPA  Calibre 6/8                           |
   | ROSAL TREPADOR                                              |
   | Solanum Jazminoide                                          |
   | Wisteria Sinensis  azul, rosa, blanca                       |
   | Wisteria Sinensis INJERTADAS DECÃ?                          |
   | Bougamvillea Sanderiana Tutor                               |
   | Bougamvillea Sanderiana Espaldera                           |
   | Bougamvillea Sanderiana, 3 tut. piramide                    |
   | Expositor Árboles clima mediterráneo                        |
   | Expositor Árboles borde del mar                             |
   | Brachychiton Acerifolius                                    |
   | Cassia Corimbosa                                            |
   | Chitalpa Summer Bells                                       |
   | Erytrina Kafra                                              |
   | Eucalyptus Citriodora                                       |
   | Eucalyptus Ficifolia                                        |
   | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
   | Lagunaria Patersonii                                        |
   | Morus Alba                                                  |
   | Platanus Acerifolia                                         |
   | Salix Babylonica  Pendula                                   |
   | Tamarix  Ramosissima Pink Cascade                           |
   | Tecoma Stands                                               |
   | Tipuana Tipu                                                |
   | Pleioblastus distichus-Bambú enano                          |
   | Sasa palmata                                                |
   | Phylostachys aurea                                          |
   | Phylostachys Bambusa Spectabilis                            |
   | Phylostachys biseti                                         |
   | Pseudosasa japonica (Metake)                                |
   | Cedrus Deodara "Feeling Blue" Novedad                       |
   | Juniperus chinensis "Blue Alps"                             |
   | Juniperus Chinensis Stricta                                 |
   | Juniperus squamata "Blue Star"                              |
   | Juniperus x media Phitzeriana verde                         |
   | Bismarckia Nobilis                                          |
   | Brahea Armata                                               |
   | Brahea Edulis                                               |
   | Butia Capitata                                              |
   | Chamaerops Humilis                                          |
   | Chamaerops Humilis "Cerifera"                               |
   | Chrysalidocarpus Lutescens -ARECA                           |
   | Cordyline Australis -DRACAENA                               |
   | Cycas Revoluta                                              |
   | Dracaena Drago                                              |
   | Livistonia Decipiens                                        |
   | Rhaphis Excelsa                                             |
   | Sabal Minor                                                 |
   | Trachycarpus Fortunei                                       |
   | Washingtonia Robusta                                        |
   | Zamia Furfuracaea                                           |
   +-------------------------------------------------------------+
   ```

   

9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

   ```sql
   SELECT DISTINCT(p.nombre), p.descripcion, gp.imagen
   FROM detalle_pedido AS dp
   RIGHT JOIN producto AS p
   ON dp.producto_codigo_producto = p.codigo_producto
   RIGHT JOIN gama_producto AS gp
   ON p.gama = gp.gama
   WHERE dp.producto_codigo_producto IS NULL;
   
   +-------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+
   | nombre                                                      | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | imagen |
   +-------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+
   | Olea-Olivos                                                 | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     | NULL   |
   | Calamondin Mini                                             | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                                                                                                      | NULL   |
   | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Albaricoquero Corbato                                       | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | NULL   |
   | Albaricoquero Moniqui                                       | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | NULL   |
   | Albaricoquero Kurrot                                        | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | NULL   |
   | Cerezo Burlat                                               | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo "Duke", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                   | NULL   |
   | Cerezo Picota                                               | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo "Duke", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                   | NULL   |
   | Ciruelo R. Claudia Verde                                    | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NULL   |
   | Ciruelo Golden Japan                                        | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NULL   |
   | Ciruelo Claudia Negra                                       | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NULL   |
   | Higuera Verdal                                              | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | NULL   |
   | Higuera Breva                                               | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | NULL   |
   | Melocotonero Spring Crest                                   | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.
   En Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.
   En China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                                 | NULL   |
   | Melocotonero Federica                                       | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.
   En Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.
   En China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                                 | NULL   |
   | Parra Uva de Mesa                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Mandarino -Plantón joven                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Peral Castell                                               | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | NULL   |
   | Peral Williams                                              | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | NULL   |
   | Peral Conference                                            | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | NULL   |
   | Olivo Cipresino                                             | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     | NULL   |
   | Albaricoquero                                               | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | NULL   |
   | Cerezo                                                      | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo "Duke", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                   | NULL   |
   | Ciruelo                                                     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NULL   |
   | Granado                                                     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | NULL   |
   | Higuera                                                     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | NULL   |
   | Manzano                                                     | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                 | NULL   |
   | Melocotonero                                                | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.
   En Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.
   En China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                                 | NULL   |
   | Membrillero                                                 | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NULL   |
   | NULL                                                        | NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NULL   |
   | Arbustos Mix Maceta                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Mimosa Injerto CLASICA Dealbata                             | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | NULL   |
   | Mimosa Semilla Bayleyana                                    | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | NULL   |
   | Mimosa Semilla Espectabilis                                 | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | NULL   |
   | Mimosa Semilla Longifolia                                   | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | NULL   |
   | Mimosa Semilla Floribunda 4 estaciones                      | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | NULL   |
   | Abelia Floribunda                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Callistemom (Mix)                                           | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de "llorón")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | NULL   |
   | Corylus Avellana "Contorta"                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Escallonia (Mix)                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Evonimus Emerald Gayeti                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Evonimus Pulchellus                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Hibiscus Syriacus  "Helene" -Blanco-C.rojo                  | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    | NULL   |
   | Hibiscus Syriacus "Pink Giant" Rosa                         | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    | NULL   |
   | Lonicera Nitida "Maigrum"                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Prunus pisardii                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Weigelia "Bristol Ruby"                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Leptospermum formado PIRAMIDE                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Leptospermum COPA                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Nerium oleander-CALIDAD "GARDEN"                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Nerium Oleander Arbusto GRANDE                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Nerium oleander COPA  Calibre 6/8                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | ROSAL TREPADOR                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Solanum Jazminoide                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Wisteria Sinensis  azul, rosa, blanca                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Wisteria Sinensis INJERTADAS DECÃ?                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Bougamvillea Sanderiana Tutor                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Bougamvillea Sanderiana Espaldera                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Bougamvillea Sanderiana, 3 tut. piramide                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Expositor Árboles clima mediterráneo                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Expositor Árboles borde del mar                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Brachychiton Acerifolius                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Cassia Corimbosa                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Chitalpa Summer Bells                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Erytrina Kafra                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Eucalyptus Citriodora                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Eucalyptus Ficifolia                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Lagunaria Patersonii                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Morus Alba                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Platanus Acerifolia                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Salix Babylonica  Pendula                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Tamarix  Ramosissima Pink Cascade                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Tecoma Stands                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Tipuana Tipu                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Pleioblastus distichus-Bambú enano                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Sasa palmata                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Phylostachys aurea                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Phylostachys Bambusa Spectabilis                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Phylostachys biseti                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Pseudosasa japonica (Metake)                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Cedrus Deodara "Feeling Blue" Novedad                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Juniperus chinensis "Blue Alps"                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Juniperus Chinensis Stricta                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Juniperus squamata "Blue Star"                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Juniperus x media Phitzeriana verde                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Bismarckia Nobilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Brahea Armata                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Brahea Edulis                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Butia Capitata                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Chamaerops Humilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Chamaerops Humilis "Cerifera"                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Chrysalidocarpus Lutescens -ARECA                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Cordyline Australis -DRACAENA                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Cycas Revoluta                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Dracaena Drago                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Livistonia Decipiens                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Rhaphis Excelsa                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Sabal Minor                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Trachycarpus Fortunei                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Washingtonia Robusta                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   | Zamia Furfuracaea                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | NULL   |
   +-------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+
   ```

   

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```sql
    
    ```

    

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```sql
    SELECT DISTINCT(c.nombre_cliente)
    FROM cliente AS c
    LEFT JOIN pedido AS p
    ON c.codigo_cliente = p.codigo_cliente
    LEFT JOIN pago AS pa
    ON c.codigo_cliente = pa.codigo_cliente
    WHERE p.codigo_cliente IS NOT NULL AND pa.codigo_cliente IS NULL;
    
    +----------------+
    | nombre_cliente |
    +----------------+
    | Flores S.L.    |
    +----------------+
    ```

    

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

    ```sql
    
    ```

    

**Consultas resumen**

1. ¿Cuántos empleados hay en la compañía?

   ```sql
   SELECT COUNT(codigo_empleado) AS numero_de_empleados
   FROM empleado;
   
   +---------------------+
   | numero_de_empleados |
   +---------------------+
   |                  31 |
   +---------------------+
   ```

   

2. ¿Cuántos clientes tiene cada país?

   ```sql
   
   ```

   

3. ¿Cuál fue el pago medio en 2009?

   ```sql
   SELECT AVG(total) AS pago_medio
   FROM pago
   WHERE YEAR(fecha_pago) = '2009';
   
   +-------------+
   | pago_medio  |
   +-------------+
   | 4504.076923 |
   +-------------+
   ```

   

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

   ```sql
   SELECT COUNT(p.codigo_estado) AS cantidad, e.nombre_estado
   FROM pedido AS p, estado AS e
   WHERE p.codigo_estado = e.codigo_estado
   GROUP BY e.nombre_estado
   ORDER BY cantidad DESC;
   
   +----------+---------------+
   | cantidad | nombre_estado |
   +----------+---------------+
   |       61 | Entregado     |
   |       30 | Pendiente     |
   |       24 | Rechazado     |
   +----------+---------------+
   ```

   

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

   ```sql
   SELECT MAX(precio_venta) AS precio_max, MIN(precio_venta) AS precio_min
   FROM producto;
   
   +------------+------------+
   | precio_max | precio_min |
   +------------+------------+
   |     462.00 |       1.00 |
   +------------+------------+
   ```

   

6. Calcula el número de clientes que tiene la empresa.

   ```sql
   
   ```

   

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

   ```sql
   SELECT COUNT(c.codigo_cliente) AS clientes_Madrid
   FROM cliente AS c, direccion AS d, ciudad AS ci
   WHERE c.codigo_cliente = d.codigo_cliente 
   	AND d.codigo_ciudad = ci.codigo_ciudad 
   	AND ci.nombre_ciudad = 'Madrid';
   	
   +-----------------+
   | clientes_Madrid |
   +-----------------+
   |              11 |
   +-----------------+
   ```

   

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

   ```sql
   SELECT ci.nombre_ciudad, COUNT(c.codigo_cliente) AS clientes_M
   FROM cliente AS c, direccion AS d, ciudad AS ci
   WHERE c.codigo_cliente = d.codigo_cliente 
   	AND d.codigo_ciudad = ci.codigo_ciudad 
   	AND ci.nombre_ciudad LIKE 'M%'
   GROUP BY ci.nombre_ciudad;
   
   +----------------------+------------+
   | nombre_ciudad        | clientes_M |
   +----------------------+------------+
   | Miami                |          2 |
   | Madrid               |         11 |
   | Montornes del valles |          1 |
   +----------------------+------------+
   ```

   

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

   ```sql
   
   ```

   

10. Calcula el número de clientes que no tiene asignado representante de ventas.

    ```sql
    
    ```

    

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```sql
    SELECT c.nombre_cliente, MIN(p.fecha_pago) AS primer_pago, MAX(p.fecha_pago) AS ultimo_pago
    FROM cliente AS c, pago AS p
    WHERE c.codigo_cliente = p.codigo_cliente
    GROUP BY c.nombre_cliente;
    
    +--------------------------------+-------------+-------------+
    | nombre_cliente                 | primer_pago | ultimo_pago |
    +--------------------------------+-------------+-------------+
    | GoldFish Garden                | 2008-11-10  | 2008-12-10  |
    | Gardening Associates           | 2009-01-16  | 2009-02-19  |
    | Gerudo Valley                  | 2007-01-08  | 2007-01-08  |
    | Tendo Garden                   | 2006-01-18  | 2006-01-18  |
    | Beragua                        | 2009-01-13  | 2009-01-13  |
    | Naturagua                      | 2009-01-06  | 2009-01-06  |
    | Camunas Jardines S.L.          | 2008-08-04  | 2008-08-04  |
    | Dardena S.A.                   | 2008-07-15  | 2008-07-15  |
    | Jardin de Flores               | 2009-01-15  | 2009-02-15  |
    | Flores Marivi                  | 2009-02-16  | 2009-02-16  |
    | Golf S.A.                      | 2009-03-06  | 2009-03-06  |
    | Sotogrande                     | 2009-03-26  | 2009-03-26  |
    | Jardines y Mansiones Cactus SL | 2008-03-18  | 2008-03-18  |
    | Jardinerías Matías SL          | 2009-02-08  | 2009-02-08  |
    | Agrojardin                     | 2009-01-13  | 2009-01-13  |
    | Jardineria Sara                | 2009-01-16  | 2009-01-16  |
    | Tutifruti S.A                  | 2007-10-06  | 2007-10-06  |
    | El Jardin Viviente S.L         | 2006-05-26  | 2006-05-26  |
    +--------------------------------+-------------+-------------+
    ```

    

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

    ```sql
    SELECT pedido_codigo_pedido, COUNT(DISTINCT producto_codigo_producto) AS productos_diferentes
    FROM detalle_pedido
    GROUP BY pedido_codigo_pedido;
    
    +----------------------+----------------------+
    | pedido_codigo_pedido | productos_diferentes |
    +----------------------+----------------------+
    |                    1 |                    5 |
    |                    2 |                    7 |
    |                    3 |                    6 |
    |                    4 |                    8 |
    |                    8 |                    3 |
    |                    9 |                    4 |
    |                   10 |                    3 |
    |                   11 |                    2 |
    |                   12 |                    1 |
    |                   13 |                    3 |
    |                   14 |                    2 |
    |                   15 |                    4 |
    |                   16 |                    2 |
    |                   17 |                    5 |
    |                   18 |                    3 |
    |                   19 |                    5 |
    |                   20 |                    2 |
    |                   21 |                    3 |
    |                   22 |                    1 |
    |                   23 |                    4 |
    |                   24 |                    4 |
    |                   25 |                    3 |
    |                   26 |                    3 |
    |                   27 |                    3 |
    |                   28 |                    3 |
    |                   29 |                    5 |
    |                   30 |                    6 |
    |                   31 |                    3 |
    |                   32 |                    5 |
    |                   33 |                    4 |
    |                   34 |                    4 |
    |                   35 |                    5 |
    |                   36 |                    5 |
    |                   37 |                    3 |
    |                   38 |                    2 |
    |                   39 |                    2 |
    |                   40 |                    2 |
    |                   41 |                    2 |
    |                   42 |                    2 |
    |                   43 |                    1 |
    |                   44 |                    1 |
    |                   45 |                    2 |
    |                   46 |                    2 |
    |                   47 |                    2 |
    |                   48 |                    5 |
    |                   49 |                    3 |
    |                   50 |                    3 |
    |                   51 |                    3 |
    |                   52 |                    1 |
    |                   53 |                    4 |
    |                   54 |                    7 |
    |                   55 |                    5 |
    |                   56 |                    6 |
    |                   57 |                    4 |
    |                   58 |                    4 |
    |                   59 |                    1 |
    |                   60 |                    1 |
    |                   61 |                    1 |
    |                   62 |                    1 |
    |                   63 |                    1 |
    |                   64 |                    1 |
    |                   65 |                    1 |
    |                   66 |                    1 |
    |                   67 |                    1 |
    |                   68 |                    1 |
    |                   74 |                    3 |
    |                   75 |                    3 |
    |                   76 |                    5 |
    |                   77 |                    2 |
    |                   78 |                    4 |
    |                   79 |                    1 |
    |                   80 |                    3 |
    |                   81 |                    1 |
    |                   82 |                    1 |
    |                   83 |                    1 |
    |                   89 |                    6 |
    |                   90 |                    3 |
    |                   91 |                    3 |
    |                   92 |                    3 |
    |                   93 |                    3 |
    |                   94 |                    3 |
    |                   95 |                    3 |
    |                   96 |                    4 |
    |                   97 |                    3 |
    |                   98 |                    5 |
    |                   99 |                    2 |
    |                  100 |                    2 |
    |                  101 |                    2 |
    |                  102 |                    2 |
    |                  103 |                    2 |
    |                  104 |                    2 |
    |                  105 |                    2 |
    |                  106 |                    2 |
    |                  107 |                    2 |
    |                  108 |                    2 |
    |                  109 |                    7 |
    |                  110 |                    3 |
    |                  111 |                    1 |
    |                  112 |                    1 |
    |                  113 |                    1 |
    |                  114 |                    1 |
    |                  115 |                    1 |
    |                  116 |                    5 |
    |                  117 |                    4 |
    |                  118 |                    1 |
    |                  119 |                    1 |
    |                  120 |                    1 |
    |                  121 |                    1 |
    |                  122 |                    1 |
    |                  123 |                    1 |
    |                  124 |                    1 |
    |                  125 |                    1 |
    |                  126 |                    1 |
    |                  127 |                    1 |
    |                  128 |                    2 |
    +----------------------+----------------------+
    ```

    

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

    ```sql
    
    ```




14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

    ```sql
    SELECT p.nombre, SUM(dp.cantidad) AS unidades_vendidas
    FROM producto AS p, detalle_pedido AS dp
    WHERE p.codigo_producto = dp.producto_codigo_producto
    GROUP BY p.nombre
    ORDER BY unidades_vendidas DESC
    LIMIT 20;
    
    +--------------------------------------------+-------------------+
    | nombre                                     | unidades_vendidas |
    +--------------------------------------------+-------------------+
    | Thymus Vulgaris                            |               961 |
    | Thymus Citriodra (Tomillo limón)           |               455 |
    | Rosal bajo 1Âª -En maceta-inicio brotación |               423 |
    | Chamaerops Humilis                         |               335 |
    | Cerezo                                     |               316 |
    | Petrosilium Hortense (Peregil)             |               291 |
    | Trachycarpus Fortunei                      |               279 |
    | Acer Pseudoplatanus                        |               262 |
    | Tuja orientalis "Aurea nana"               |               221 |
    | Azadón                                     |               220 |
    | Brahea Armata                              |               212 |
    | Kaki Rojo Brillante                        |               203 |
    | Peral                                      |               151 |
    | Robinia Pseudoacacia Casque Rouge          |               150 |
    | Beucarnea Recurvata                        |               150 |
    | Ajedrea                                    |               135 |
    | Limonero 30/40                             |               131 |
    | Nectarina                                  |               130 |
    | Lavándula Dentata                          |               128 |
    | Nerium oleander ARBOL Calibre 8/10         |               127 |
    +--------------------------------------------+-------------------+
    ```

    

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

    ```sql
    SELECT dp.pedido_codigo_pedido, (p.precio_venta*dp.cantidad) AS base_imponible, ((p.precio_venta*dp.cantidad)*0.21) AS IVA, ((p.precio_venta*dp.cantidad)+((p.precio_venta*dp.cantidad)*0.21)) AS total
    FROM detalle_pedido AS dp, producto AS p
    WHERE dp.producto_codigo_producto = p.codigo_producto;
    
    +----------------------+----------------+------------+------------+
    | pedido_codigo_pedido | base_imponible | IVA        | total      |
    +----------------------+----------------+------------+------------+
    |                    1 |         700.00 |   147.0000 |   847.0000 |
    |                    1 |         280.00 |    58.8000 |   338.8000 |
    |                    1 |         100.00 |    21.0000 |   121.0000 |
    |                    1 |         285.00 |    59.8500 |   344.8500 |
    |                    1 |         322.00 |    67.6200 |   389.6200 |
    |                    2 |          87.00 |    18.2700 |   105.2700 |
    |                    2 |          56.00 |    11.7600 |    67.7600 |
    |                    2 |         200.00 |    42.0000 |   242.0000 |
    |                    2 |          80.00 |    16.8000 |    96.8000 |
    |                    2 |          72.00 |    15.1200 |    87.1200 |
    |                    2 |        4288.00 |   900.4800 |  5188.4800 |
    |                    2 |        2310.00 |   485.1000 |  2795.1000 |
    |                    3 |        1080.00 |   226.8000 |  1306.8000 |
    |                    3 |         160.00 |    33.6000 |   193.6000 |
    |                    3 |          55.00 |    11.5500 |    66.5500 |
    |                    3 |        7980.00 |  1675.8000 |  9655.8000 |
    |                    3 |         960.00 |   201.6000 |  1161.6000 |
    |                    3 |         600.00 |   126.0000 |   726.0000 |
    |                    4 |          96.00 |    20.1600 |   116.1600 |
    |                    4 |         336.00 |    70.5600 |   406.5600 |
    |                    4 |         336.00 |    70.5600 |   406.5600 |
    |                    4 |          18.00 |     3.7800 |    21.7800 |
    |                    4 |          24.00 |     5.0400 |    29.0400 |
    |                    4 |         170.00 |    35.7000 |   205.7000 |
    |                    4 |         380.00 |    79.8000 |   459.8000 |
    |                    4 |        1827.00 |   383.6700 |  2210.6700 |
    |                    8 |          33.00 |     6.9300 |    39.9300 |
    |                    8 |          32.00 |     6.7200 |    38.7200 |
    |                    8 |        1000.00 |   210.0000 |  1210.0000 |
    |                    9 |          80.00 |    16.8000 |    96.8000 |
    |                    9 |         450.00 |    94.5000 |   544.5000 |
    |                    9 |         880.00 |   184.8000 |  1064.8000 |
    |                    9 |        1365.00 |   286.6500 |  1651.6500 |
    |                   10 |         350.00 |    73.5000 |   423.5000 |
    |                   10 |        2400.00 |   504.0000 |  2904.0000 |
    |                   10 |         320.00 |    67.2000 |   387.2000 |
    |                   11 |         180.00 |    37.8000 |   217.8000 |
    |                   11 |       36960.00 |  7761.6000 | 44721.6000 |
    |                   12 |         290.00 |    60.9000 |   350.9000 |
    |                   13 |          70.00 |    14.7000 |    84.7000 |
    |                   13 |         168.00 |    35.2800 |   203.2800 |
    |                   13 |         500.00 |   105.0000 |   605.0000 |
    |                   14 |          88.00 |    18.4800 |   106.4800 |
    |                   14 |         741.00 |   155.6100 |   896.6100 |
    |                   15 |          52.00 |    10.9200 |    62.9200 |
    |                   15 |          12.00 |     2.5200 |    14.5200 |
    |                   15 |          60.00 |    12.6000 |    72.6000 |
    |                   15 |          90.00 |    18.9000 |   108.9000 |
    |                   16 |         144.00 |    30.2400 |   174.2400 |
    |                   16 |          90.00 |    18.9000 |   108.9000 |
    |                   17 |          70.00 |    14.7000 |    84.7000 |
    |                   17 |          60.00 |    12.6000 |    72.6000 |
    |                   17 |          45.00 |     9.4500 |    54.4500 |
    |                   17 |         110.00 |    23.1000 |   133.1000 |
    |                   17 |          90.00 |    18.9000 |   108.9000 |
    |                   18 |          48.00 |    10.0800 |    58.0800 |
    |                   18 |           8.00 |     1.6800 |     9.6800 |
    |                   18 |          60.00 |    12.6000 |    72.6000 |
    |                   19 |         108.00 |    22.6800 |   130.6800 |
    |                   19 |          48.00 |    10.0800 |    58.0800 |
    |                   19 |          32.00 |     6.7200 |    38.7200 |
    |                   19 |          65.00 |    13.6500 |    78.6500 |
    |                   19 |          80.00 |    16.8000 |    96.8000 |
    |                   20 |         196.00 |    41.1600 |   237.1600 |
    |                   20 |          96.00 |    20.1600 |   116.1600 |
    |                   21 |          70.00 |    14.7000 |    84.7000 |
    |                   21 |          88.00 |    18.4800 |   106.4800 |
    |                   21 |          24.00 |     5.0400 |    29.0400 |
    |                   22 |           6.00 |     1.2600 |     7.2600 |
    |                   23 |         110.00 |    23.1000 |   133.1000 |
    |                   23 |        1100.00 |   231.0000 |  1331.0000 |
    |                   23 |         280.00 |    58.8000 |   338.8000 |
    |                   23 |         150.00 |    31.5000 |   181.5000 |
    |                   24 |          36.00 |     7.5600 |    43.5600 |
    |                   24 |          28.00 |     5.8800 |    33.8800 |
    |                   24 |          16.00 |     3.3600 |    19.3600 |
    |                   24 |         190.00 |    39.9000 |   229.9000 |
    |                   25 |        1050.00 |   220.5000 |  1270.5000 |
    |                   25 |         116.00 |    24.3600 |   140.3600 |
    |                   25 |         320.00 |    67.2000 |   387.2000 |
    |                   26 |         225.00 |    47.2500 |   272.2500 |
    |                   26 |         100.00 |    21.0000 |   121.0000 |
    |                   26 |         350.00 |    73.5000 |   423.5000 |
    |                   27 |         132.00 |    27.7200 |   159.7200 |
    |                   27 |         132.00 |    27.7200 |   159.7200 |
    |                   27 |         240.00 |    50.4000 |   290.4000 |
    |                   28 |         800.00 |   168.0000 |   968.0000 |
    |                   28 |         798.00 |   167.5800 |   965.5800 |
    |                   28 |         462.00 |    97.0200 |   559.0200 |
    |                   29 |         280.00 |    58.8000 |   338.8000 |
    |                   29 |         116.00 |    24.3600 |   140.3600 |
    |                   29 |         640.00 |   134.4000 |   774.4000 |
    |                   29 |         220.00 |    46.2000 |   266.2000 |
    |                   29 |         100.00 |    21.0000 |   121.0000 |
    |                   30 |          10.00 |     2.1000 |    12.1000 |
    |                   30 |          64.00 |    13.4400 |    77.4400 |
    |                   30 |          42.00 |     8.8200 |    50.8200 |
    |                   30 |         128.00 |    26.8800 |   154.8800 |
    |                   30 |         490.00 |   102.9000 |   592.9000 |
    |                   30 |          25.00 |     5.2500 |    30.2500 |
    |                   31 |          25.00 |     5.2500 |    30.2500 |
    |                   31 |          18.00 |     3.7800 |    21.7800 |
    |                   31 |         174.00 |    36.5400 |   210.5400 |
    |                   32 |          14.00 |     2.9400 |    16.9400 |
    |                   32 |          56.00 |    11.7600 |    67.7600 |
    |                   32 |          12.00 |     2.5200 |    14.5200 |
    |                   32 |        2842.00 |   596.8200 |  3438.8200 |
    |                   32 |         100.00 |    21.0000 |   121.0000 |
    |                   33 |         846.00 |   177.6600 |  1023.6600 |
    |                   33 |         960.00 |   201.6000 |  1161.6000 |
    |                   33 |        2120.00 |   445.2000 |  2565.2000 |
    |                   33 |       69300.00 | 14553.0000 | 83853.0000 |
    |                   34 |         392.00 |    82.3200 |   474.3200 |
    |                   34 |         348.00 |    73.0800 |   421.0800 |
    |                   34 |         360.00 |    75.6000 |   435.6000 |
    |                   34 |         432.00 |    90.7200 |   522.7200 |
    |                   35 |         168.00 |    35.2800 |   203.2800 |
    |                   35 |         440.00 |    92.4000 |   532.4000 |
    |                   35 |          30.00 |     6.3000 |    36.3000 |
    |                   35 |         360.00 |    75.6000 |   435.6000 |
    |                   35 |         720.00 |   151.2000 |   871.2000 |
    |                   36 |          48.00 |    10.0800 |    58.0800 |
    |                   36 |          14.00 |     2.9400 |    16.9400 |
    |                   36 |          42.00 |     8.8200 |    50.8200 |
    |                   36 |          10.00 |     2.1000 |    12.1000 |
    |                   36 |         210.00 |    44.1000 |   254.1000 |
    |                   37 |         280.00 |    58.8000 |   338.8000 |
    |                   37 |        1827.00 |   383.6700 |  2210.6700 |
    |                   37 |         380.00 |    79.8000 |   459.8000 |
    |                   38 |          70.00 |    14.7000 |    84.7000 |
    |                   38 |          28.00 |     5.8800 |    33.8800 |
    |                   39 |          36.00 |     7.5600 |    43.5600 |
    |                   39 |          72.00 |    15.1200 |    87.1200 |
    |                   40 |           4.00 |     0.8400 |     4.8400 |
    |                   40 |           8.00 |     1.6800 |     9.6800 |
    |                   41 |           5.00 |     1.0500 |     6.0500 |
    |                   41 |           5.00 |     1.0500 |     6.0500 |
    |                   42 |           3.00 |     0.6300 |     3.6300 |
    |                   42 |           1.00 |     0.2100 |     1.2100 |
    |                   43 |           9.00 |     1.8900 |    10.8900 |
    |                   44 |           5.00 |     1.0500 |     6.0500 |
    |                   45 |           6.00 |     1.2600 |     7.2600 |
    |                   45 |           4.00 |     0.8400 |     4.8400 |
    |                   46 |          28.00 |     5.8800 |    33.8800 |
    |                   46 |          56.00 |    11.7600 |    67.7600 |
    |                   47 |          99.00 |    20.7900 |   119.7900 |
    |                   47 |          65.00 |    13.6500 |    78.6500 |
    |                   48 |          18.00 |     3.7800 |    21.7800 |
    |                   48 |          25.00 |     5.2500 |    30.2500 |
    |                   48 |        3200.00 |   672.0000 |  3872.0000 |
    |                   48 |        2205.00 |   463.0500 |  2668.0500 |
    |                   48 |         950.00 |   199.5000 |  1149.5000 |
    |                   49 |         500.00 |   105.0000 |   605.0000 |
    |                   49 |         100.00 |    21.0000 |   121.0000 |
    |                   49 |          25.00 |     5.2500 |    30.2500 |
    |                   50 |         120.00 |    25.2000 |   145.2000 |
    |                   50 |         570.00 |   119.7000 |   689.7000 |
    |                   50 |        2816.00 |   591.3600 |  3407.3600 |
    |                   51 |         500.00 |   105.0000 |   605.0000 |
    |                   51 |        3120.00 |   655.2000 |  3775.2000 |
    |                   51 |        4130.00 |   867.3000 |  4997.3000 |
    |                   52 |         700.00 |   147.0000 |   847.0000 |
    |                   53 |           6.00 |     1.2600 |     7.2600 |
    |                   53 |          70.00 |    14.7000 |    84.7000 |
    |                   53 |          22.00 |     4.6200 |    26.6200 |
    |                   53 |          42.00 |     8.8200 |    50.8200 |
    |                   54 |          42.00 |     8.8200 |    50.8200 |
    |                   54 |         495.00 |   103.9500 |   598.9500 |
    |                   54 |          20.00 |     4.2000 |    24.2000 |
    |                   54 |          66.00 |    13.8600 |    79.8600 |
    |                   54 |          56.00 |    11.7600 |    67.7600 |
    |                   54 |          15.00 |     3.1500 |    18.1500 |
    |                   54 |          20.00 |     4.2000 |    24.2000 |
    |                   55 |          63.00 |    13.2300 |    76.2300 |
    |                   55 |         532.00 |   111.7200 |   643.7200 |
    |                   55 |         384.00 |    80.6400 |   464.6400 |
    |                   55 |         128.00 |    26.8800 |   154.8800 |
    |                   55 |         462.00 |    97.0200 |   559.0200 |
    |                   56 |         110.00 |    23.1000 |   133.1000 |
    |                   56 |         180.00 |    37.8000 |   217.8000 |
    |                   56 |           6.00 |     1.2600 |     7.2600 |
    |                   56 |          30.00 |     6.3000 |    36.3000 |
    |                   56 |          16.00 |     3.3600 |    19.3600 |
    |                   56 |          30.00 |     6.3000 |    36.3000 |
    |                   57 |         546.00 |   114.6600 |   660.6600 |
    |                   57 |         147.00 |    30.8700 |   177.8700 |
    |                   57 |          26.00 |     5.4600 |    31.4600 |
    |                   57 |         192.00 |    40.3200 |   232.3200 |
    |                   58 |         390.00 |    81.9000 |   471.9000 |
    |                   58 |         320.00 |    67.2000 |   387.2000 |
    |                   58 |        1242.00 |   260.8200 |  1502.8200 |
    |                   58 |        2250.00 |   472.5000 |  2722.5000 |
    |                   59 |         700.00 |   147.0000 |   847.0000 |
    |                   60 |         700.00 |   147.0000 |   847.0000 |
    |                   61 |         700.00 |   147.0000 |   847.0000 |
    |                   62 |         700.00 |   147.0000 |   847.0000 |
    |                   63 |         700.00 |   147.0000 |   847.0000 |
    |                   64 |         700.00 |   147.0000 |   847.0000 |
    |                   65 |         700.00 |   147.0000 |   847.0000 |
    |                   66 |         700.00 |   147.0000 |   847.0000 |
    |                   67 |         700.00 |   147.0000 |   847.0000 |
    |                   68 |         700.00 |   147.0000 |   847.0000 |
    |                   74 |        1050.00 |   220.5000 |  1270.5000 |
    |                   74 |        2176.00 |   456.9600 |  2632.9600 |
    |                   74 |       19404.00 |  4074.8400 | 23478.8400 |
    |                   75 |          60.00 |    12.6000 |    72.6000 |
    |                   75 |         528.00 |   110.8800 |   638.8800 |
    |                   75 |         460.00 |    96.6000 |   556.6000 |
    |                   76 |         250.00 |    52.5000 |   302.5000 |
    |                   76 |         880.00 |   184.8000 |  1064.8000 |
    |                   76 |         528.00 |   110.8800 |   638.8800 |
    |                   76 |        1120.00 |   235.2000 |  1355.2000 |
    |                   76 |         250.00 |    52.5000 |   302.5000 |
    |                   77 |         408.00 |    85.6800 |   493.6800 |
    |                   77 |         180.00 |    37.8000 |   217.8000 |
    |                   78 |         200.00 |    42.0000 |   242.0000 |
    |                   78 |        3920.00 |   823.2000 |  4743.2000 |
    |                   78 |         420.00 |    88.2000 |   508.2000 |
    |                   78 |         120.00 |    25.2000 |   145.2000 |
    |                   79 |         300.00 |    63.0000 |   363.0000 |
    |                   80 |        4000.00 |   840.0000 |  4840.0000 |
    |                   80 |         423.00 |    88.8300 |   511.8300 |
    |                   80 |        1350.00 |   283.5000 |  1633.5000 |
    |                   81 |         120.00 |    25.2000 |   145.2000 |
    |                   82 |        2176.00 |   456.9600 |  2632.9600 |
    |                   83 |         120.00 |    25.2000 |   145.2000 |
    |                   89 |          96.00 |    20.1600 |   116.1600 |
    |                   89 |         105.00 |    22.0500 |   127.0500 |
    |                   89 |          96.00 |    20.1600 |   116.1600 |
    |                   89 |         245.00 |    51.4500 |   296.4500 |
    |                   89 |          88.00 |    18.4800 |   106.4800 |
    |                   89 |          80.00 |    16.8000 |    96.8000 |
    |                   90 |          19.00 |     3.9900 |    22.9900 |
    |                   90 |          10.00 |     2.1000 |    12.1000 |
    |                   90 |          12.00 |     2.5200 |    14.5200 |
    |                   91 |         572.00 |   120.1200 |   692.1200 |
    |                   91 |         182.00 |    38.2200 |   220.2200 |
    |                   91 |         630.00 |   132.3000 |   762.3000 |
    |                   92 |         384.00 |    80.6400 |   464.6400 |
    |                   92 |        2000.00 |   420.0000 |  2420.0000 |
    |                   92 |         630.00 |   132.3000 |   762.3000 |
    |                   93 |         225.00 |    47.2500 |   272.2500 |
    |                   93 |         561.00 |   117.8100 |   678.8100 |
    |                   93 |          96.00 |    20.1600 |   116.1600 |
    |                   94 |         168.00 |    35.2800 |   203.2800 |
    |                   94 |        3300.00 |   693.0000 |  3993.0000 |
    |                   94 |        2291.00 |   481.1100 |  2772.1100 |
    |                   95 |          63.00 |    13.2300 |    76.2300 |
    |                   95 |         192.00 |    40.3200 |   232.3200 |
    |                   95 |         350.00 |    73.5000 |   423.5000 |
    |                   96 |          48.00 |    10.0800 |    58.0800 |
    |                   96 |         112.00 |    23.5200 |   135.5200 |
    |                   96 |         220.00 |    46.2000 |   266.2000 |
    |                   96 |         280.00 |    58.8000 |   338.8000 |
    |                   97 |          96.00 |    20.1600 |   116.1600 |
    |                   97 |         126.00 |    26.4600 |   152.4600 |
    |                   97 |         100.00 |    21.0000 |   121.0000 |
    |                   98 |         112.00 |    23.5200 |   135.5200 |
    |                   98 |         128.00 |    26.8800 |   154.8800 |
    |                   98 |         256.00 |    53.7600 |   309.7600 |
    |                   98 |         108.00 |    22.6800 |   130.6800 |
    |                   98 |         420.00 |    88.2000 |   508.2000 |
    |                   99 |         150.00 |    31.5000 |   181.5000 |
    |                   99 |        1920.00 |   403.2000 |  2323.2000 |
    |                  100 |         440.00 |    92.4000 |   532.4000 |
    |                  100 |        1280.00 |   268.8000 |  1548.8000 |
    |                  101 |          50.00 |    10.5000 |    60.5000 |
    |                  101 |         159.00 |    33.3900 |   192.3900 |
    |                  102 |         384.00 |    80.6400 |   464.6400 |
    |                  102 |         276.00 |    57.9600 |   333.9600 |
    |                  103 |          96.00 |    20.1600 |   116.1600 |
    |                  103 |         208.00 |    43.6800 |   251.6800 |
    |                  104 |         630.00 |   132.3000 |   762.3000 |
    |                  104 |        1130.00 |   237.3000 |  1367.3000 |
    |                  105 |        1344.00 |   282.2400 |  1626.2400 |
    |                  105 |         162.00 |    34.0200 |   196.0200 |
    |                  106 |         231.00 |    48.5100 |   279.5100 |
    |                  106 |         846.00 |   177.6600 |  1023.6600 |
    |                  107 |        1716.00 |   360.3600 |  2076.3600 |
    |                  107 |        1500.00 |   315.0000 |  1815.0000 |
    |                  108 |         424.00 |    89.0400 |   513.0400 |
    |                  108 |         236.00 |    49.5600 |   285.5600 |
    |                  109 |          32.00 |     6.7200 |    38.7200 |
    |                  109 |         108.00 |    22.6800 |   130.6800 |
    |                  109 |         112.00 |    23.5200 |   135.5200 |
    |                  109 |         200.00 |    42.0000 |   242.0000 |
    |                  109 |          50.00 |    10.5000 |    60.5000 |
    |                  109 |          15.00 |     3.1500 |    18.1500 |
    |                  109 |          36.00 |     7.5600 |    43.5600 |
    |                  110 |           6.00 |     1.2600 |     7.2600 |
    |                  110 |          98.00 |    20.5800 |   118.5800 |
    |                  110 |          45.00 |     9.4500 |    54.4500 |
    |                  111 |         700.00 |   147.0000 |   847.0000 |
    |                  112 |         700.00 |   147.0000 |   847.0000 |
    |                  113 |         700.00 |   147.0000 |   847.0000 |
    |                  114 |         700.00 |   147.0000 |   847.0000 |
    |                  115 |         700.00 |   147.0000 |   847.0000 |
    |                  116 |          70.00 |    14.7000 |    84.7000 |
    |                  116 |          32.00 |     6.7200 |    38.7200 |
    |                  116 |          18.00 |     3.7800 |    21.7800 |
    |                  116 |         104.00 |    21.8400 |   125.8400 |
    |                  116 |          40.00 |     8.4000 |    48.4000 |
    |                  117 |          30.00 |     6.3000 |    36.3000 |
    |                  117 |          32.00 |     6.7200 |    38.7200 |
    |                  117 |          68.00 |    14.2800 |    82.2800 |
    |                  117 |          24.00 |     5.0400 |    29.0400 |
    |                  118 |         700.00 |   147.0000 |   847.0000 |
    |                  119 |         700.00 |   147.0000 |   847.0000 |
    |                  120 |         700.00 |   147.0000 |   847.0000 |
    |                  121 |         700.00 |   147.0000 |   847.0000 |
    |                  122 |         700.00 |   147.0000 |   847.0000 |
    |                  123 |         700.00 |   147.0000 |   847.0000 |
    |                  124 |         700.00 |   147.0000 |   847.0000 |
    |                  125 |         700.00 |   147.0000 |   847.0000 |
    |                  126 |         700.00 |   147.0000 |   847.0000 |
    |                  127 |         700.00 |   147.0000 |   847.0000 |
    |                  128 |          15.00 |     3.1500 |    18.1500 |
    |                  128 |          36.00 |     7.5600 |    43.5600 |
    +----------------------+----------------+------------+------------+
    ```

    

16. La misma información que en la pregunta anterior, pero agrupada por código de producto.

    ```sql
    
    ```

    

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

    ```sql
    
    ```

    

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

    ```sql
    
    ```

    

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

    ```sql
    SELECT YEAR(p.fecha_pago) AS año_pago, SUM(p.total) AS total_pagos
    FROM pago AS p
    GROUP BY YEAR(p.fecha_pago);
    
    +----------+-------------+
    | año_pago | total_pagos |
    +----------+-------------+
    |     2008 |    29252.00 |
    |     2009 |    58553.00 |
    |     2007 |    85170.00 |
    |     2006 |    24965.00 |
    +----------+-------------+
    ```
    
    

**Consultas variadas**

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

   ```sql
   SELECT c.nombre_cliente, COUNT(p.codigo_pedido) AS numero_pedidos
   FROM cliente AS c
   LEFT JOIN pedido AS p
   ON c.codigo_cliente = p.codigo_cliente
   GROUP BY c.nombre_cliente;
   
   +--------------------------------+----------------+
   | nombre_cliente                 | numero_pedidos |
   +--------------------------------+----------------+
   | GoldFish Garden                |             11 |
   | Gardening Associates           |              9 |
   | Gerudo Valley                  |              5 |
   | Tendo Garden                   |              5 |
   | Lasas S.A.                     |              0 |
   | Beragua                        |              5 |
   | Club Golf Puerta del hierro    |              0 |
   | Naturagua                      |              5 |
   | DaraDistribuciones             |              0 |
   | Madrileña de riegos            |              0 |
   | Camunas Jardines S.L.          |              5 |
   | Dardena S.A.                   |              5 |
   | Jardin de Flores               |              5 |
   | Flores Marivi                  |             10 |
   | Flowers, S.A                   |              0 |
   | Naturajardin                   |              0 |
   | Golf S.A.                      |              5 |
   | Americh Golf Management SL     |              0 |
   | Aloha                          |              0 |
   | El Prat                        |              0 |
   | Sotogrande                     |              5 |
   | Vivero Humanes                 |              0 |
   | Fuenla City                    |              0 |
   | Jardines y Mansiones Cactus SL |              5 |
   | Jardinerías Matías SL          |              5 |
   | Agrojardin                     |              5 |
   | Top Campo                      |              0 |
   | Jardineria Sara                |             10 |
   | Campohermoso                   |              0 |
   | france telecom                 |              0 |
   | Musée du Louvre                |              0 |
   | Tutifruti S.A                  |              5 |
   | Flores S.L.                    |              5 |
   | The Magic Garden               |              0 |
   | El Jardin Viviente S.L         |              5 |
   +--------------------------------+----------------+
   ```

   

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

   ```sql
   SELECT c.nombre_cliente, COALESCE(SUM(p.total), 0) AS total_pagado
   FROM cliente AS c
   LEFT JOIN pago AS p 
   ON c.codigo_cliente = p.codigo_cliente
   GROUP BY c.nombre_cliente;
   
   +--------------------------------+--------------+
   | nombre_cliente                 | total_pagado |
   +--------------------------------+--------------+
   | GoldFish Garden                |      4000.00 |
   | Gardening Associates           |     10926.00 |
   | Gerudo Valley                  |     81849.00 |
   | Tendo Garden                   |     23794.00 |
   | Lasas S.A.                     |         0.00 |
   | Beragua                        |      2390.00 |
   | Club Golf Puerta del hierro    |         0.00 |
   | Naturagua                      |       929.00 |
   | DaraDistribuciones             |         0.00 |
   | Madrileña de riegos            |         0.00 |
   | Camunas Jardines S.L.          |      2246.00 |
   | Dardena S.A.                   |      4160.00 |
   | Jardin de Flores               |     12081.00 |
   | Flores Marivi                  |      4399.00 |
   | Flowers, S.A                   |         0.00 |
   | Naturajardin                   |         0.00 |
   | Golf S.A.                      |       232.00 |
   | Americh Golf Management SL     |         0.00 |
   | Aloha                          |         0.00 |
   | El Prat                        |         0.00 |
   | Sotogrande                     |       272.00 |
   | Vivero Humanes                 |         0.00 |
   | Fuenla City                    |         0.00 |
   | Jardines y Mansiones Cactus SL |     18846.00 |
   | Jardinerías Matías SL          |     10972.00 |
   | Agrojardin                     |      8489.00 |
   | Top Campo                      |         0.00 |
   | Jardineria Sara                |      7863.00 |
   | Campohermoso                   |         0.00 |
   | france telecom                 |         0.00 |
   | Musée du Louvre                |         0.00 |
   | Tutifruti S.A                  |      3321.00 |
   | Flores S.L.                    |         0.00 |
   | The Magic Garden               |         0.00 |
   | El Jardin Viviente S.L         |      1171.00 |
   +--------------------------------+--------------+
   ```

   

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

   ```sql
   SELECT DISTINCT c.nombre_cliente
   FROM cliente AS c
   JOIN pedido AS p 
   ON c.codigo_cliente = p.codigo_cliente
   JOIN detalle_pedido AS dp 
   ON p.codigo_cliente = dp.pedido_codigo_pedido
   WHERE YEAR(p.fecha_pedido) = 2008
   ORDER BY c.nombre_cliente ASC;
   
   +--------------------------------+
   | nombre_cliente                 |
   +--------------------------------+
   | Camunas Jardines S.L.          |
   | Dardena S.A.                   |
   | El Jardin Viviente S.L         |
   | Flores Marivi                  |
   | Flores S.L.                    |
   | Gerudo Valley                  |
   | GoldFish Garden                |
   | Jardin de Flores               |
   | Jardines y Mansiones Cactus SL |
   | Tutifruti S.A                  |
   +--------------------------------+
   ```

   

4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

   ```sql
   
   ```

   

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

   ```sql
   
   ```

   

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

   ```sql
   
   ```

   

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

   ```sql
   SELECT c.nombre_ciudad, COUNT(e.codigo_empleado) AS numero_empleados
   FROM ciudad AS c
   JOIN direccion AS d
   ON c.codigo_ciudad = d.codigo_ciudad
   JOIN oficina AS o
   ON o.codigo_direccion = d.codigo_direccion
   JOIN empleado AS e
   ON e.codigo_oficina = o.codigo_oficina
   GROUP BY c.nombre_ciudad;
   
   +----------------------+------------------+
   | nombre_ciudad        | numero_empleados |
   +----------------------+------------------+
   | Barcelona            |                4 |
   | Boston               |                3 |
   | Londres              |                3 |
   | Madrid               |                4 |
   | Paris                |                3 |
   | San Francisco        |                2 |
   | Sydney               |                3 |
   | Talavera de la Reina |                6 |
   | Tokyo                |                3 |
   +----------------------+------------------+
   ```
   
   