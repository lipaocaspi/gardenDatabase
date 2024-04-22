SELECT o.codigo_oficina, c.nombre_ciudad
FROM oficina AS o, direccion AS d, ciudad AS c
WHERE o.codigo_direccion = d.codigo_direccion AND c.codigo_ciudad = d.codigo_ciudad;

SELECT c.nombre_ciudad, t.numero_telefono
FROM pais AS p, region AS r, ciudad AS c, telefono AS t, oficina AS o, direccion AS d
WHERE p.codigo_pais = r.codigo_pais
    AND r.codigo_region = c.codigo_region
    AND c.codigo_ciudad = d.codigo_ciudad
    AND d.codigo_direccion = o.codigo_direccion
    AND o.codigo_oficina = t.codigo_oficina 
    AND p.nombre_pais = 'España';
    
SELECT e.nombre, e.apellido1, e.apellido2, e.email
FROM empleado AS e
WHERE e.codigo_jefe = 7;

SELECT p.nombre_puesto, e.nombre, e.apellido1, e.apellido2, e.email
FROM puesto AS p, empleado AS e
WHERE p.codigo_puesto = e.codigo_puesto AND e.codigo_jefe IS NULL;

SELECT e.nombre, e.apellido1, e.apellido2, p.nombre_puesto
FROM empleado AS e, puesto AS p
WHERE e.codigo_puesto = p.codigo_puesto AND p.nombre_puesto <> 'Representante Ventas';

SELECT cl.nombre_cliente
FROM cliente AS cl, pais AS p, region AS r, ciudad AS c, direccion AS d
WHERE cl.codigo_cliente = d.codigo_cliente
	AND d.codigo_ciudad = c.codigo_ciudad
    AND c.codigo_region = r.codigo_region
    AND r.codigo_pais = p.codigo_pais
    AND p.nombre_pais = 'España';
    
SELECT nombre_estado
FROM estado;

SELECT DISTINCT(c.codigo_cliente)
FROM cliente AS c, pago AS p
WHERE p.codigo_cliente = c.codigo_cliente AND YEAR(p.fecha_pago) = '2008';

SELECT DISTINCT(c.codigo_cliente)
FROM cliente AS c, pago AS p
WHERE p.codigo_cliente = c.codigo_cliente AND DATE_FORMAT(p.fecha_pago, '%Y') = '2008';

SELECT DISTINCT(c.codigo_cliente)
FROM cliente AS c, pago AS p
WHERE p.codigo_cliente = c.codigo_cliente AND p.fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega > fecha_esperada;

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE ADDDATE(fecha_entrega, INTERVAL 2 DAY) <= fecha_esperada;

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE (fecha_esperada - fecha_entrega) >= 2;

SELECT p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.comentarios, p.codigo_cliente, e.nombre_estado
FROM pedido AS p, estado AS e
WHERE p.codigo_estado = e.codigo_estado 
	AND p.codigo_estado = 3 
    AND (YEAR(p.fecha_esperada) = '2009' OR YEAR(p.fecha_entrega) = '2009');
    
SELECT p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, p.comentarios, p.codigo_cliente, e.nombre_estado
FROM pedido AS p, estado AS e
WHERE p.codigo_estado = e.codigo_estado
	AND p.codigo_estado = 1 
    AND MONTH(p.fecha_entrega) = '1';
    
SELECT p.id_transaccion, p.fecha_pago, p.total, f.nombre_forma
FROM pago AS p, forma_pago AS f
WHERE p.codigo_forma = f.codigo_forma
	AND f.nombre_forma = 'PayPal'
	AND YEAR(p.fecha_pago) = '2008'
ORDER BY p.fecha_pago DESC;

SELECT nombre_forma
FROM forma_pago;

SELECT nombre, gama, cantidad_en_stock, precio_venta
FROM producto
WHERE gama = 'Ornamentales' 
	AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

SELECT c.nombre_cliente
FROM cliente AS c, direccion AS d, ciudad AS ci
WHERE c.codigo_cliente = d.codigo_cliente 
	AND d.codigo_ciudad = ci.codigo_ciudad
    AND c.codigo_empleado_rep_ventas IN (11, 30)
    AND ci.nombre_ciudad = 'Madrid';
    
SELECT c.nombre_cliente, e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas
FROM cliente AS c, empleado AS e
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado;

SELECT DISTINCT(c.nombre_cliente), e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas
FROM cliente AS c, empleado AS e, pago AS p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado AND p.codigo_cliente = c.codigo_cliente;

SELECT DISTINCT(c.nombre_cliente), e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas
FROM cliente AS c, empleado AS e, pago AS p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado 
	AND c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
    
SELECT DISTINCT(c.nombre_cliente), e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas, ci.nombre_ciudad
FROM cliente AS c, empleado AS e, pago AS p, oficina AS o, direccion AS d, ciudad AS ci
WHERE p.codigo_cliente = c.codigo_cliente
	AND c.codigo_empleado_rep_ventas = e.codigo_empleado
    AND e.codigo_oficina = o.codigo_oficina
    AND o.codigo_direccion = d.codigo_direccion
    AND d.codigo_ciudad = ci.codigo_ciudad;
    
SELECT DISTINCT(c.nombre_cliente), e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas, ci.nombre_ciudad
FROM cliente AS c, empleado AS e, pago AS p, oficina AS o, direccion AS d, ciudad AS ci
WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)
	AND c.codigo_empleado_rep_ventas = e.codigo_empleado
    AND e.codigo_oficina = o.codigo_oficina
    AND o.codigo_direccion = d.codigo_direccion
    AND d.codigo_ciudad = ci.codigo_ciudad;
    
/* SELECT d.linea_direccion1, d.linea_direccion2
FROM direccion AS d, oficina AS o, cliente AS c, empleado AS e, ciudad AS ci
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
	AND e.codigo_oficina = o.codigo_oficina
    AND o.codigo_direccion = d.codigo_direccion
    AND d.codigo_ciudad = ci.codigo_ciudad
    AND ci.nombre_ciudad = 'Fuenlabrada'; */
    
SELECT c.nombre_cliente, e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas, ci.nombre_ciudad
FROM cliente AS c, empleado AS e, oficina AS o, direccion AS d, ciudad AS ci
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
    AND e.codigo_oficina = o.codigo_oficina
    AND o.codigo_direccion = d.codigo_direccion
    AND d.codigo_ciudad = ci.codigo_ciudad;

SELECT e1.nombre AS nombre_empleado, e1.apellido1 AS apellido1_empleado, e2.nombre AS nombre_jefe, e2.apellido1 AS apellido1_jefe
FROM empleado AS e1
INNER JOIN empleado AS e2
ON e1.codigo_jefe = e2.codigo_empleado;

SELECT e1.nombre AS nombre_empleado, e1.apellido1 AS apellido1_empleado, e2.nombre AS nombre_jefe, e2.apellido1 AS apellido1_jefe, e3.nombre AS nombre_jefe_jefe, e3.apellido1 AS apellido1_jefe_jefe
FROM empleado AS e1
INNER JOIN empleado AS e2
ON e1.codigo_jefe = e2.codigo_empleado
INNER JOIN empleado AS e3
ON e2.codigo_jefe = e3.codigo_empleado;

SELECT DISTINCT(c.nombre_cliente)
FROM cliente AS c
INNER JOIN pedido AS p
ON c.codigo_cliente = p.codigo_cliente AND p.fecha_entrega > p.fecha_esperada;

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

SELECT c.nombre_cliente
FROM cliente AS c
LEFT JOIN pago AS p
ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

SELECT c.nombre_cliente
FROM cliente AS c
LEFT JOIN pedido AS p
ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

SELECT c.nombre_cliente
FROM cliente AS c
LEFT JOIN pago AS p
ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pedido AS pe
ON c.codigo_cliente = pe.codigo_cliente
WHERE p.codigo_cliente IS NULL AND pe.codigo_cliente IS NULL;

SELECT e.nombre, e.apellido1
FROM empleado AS e
LEFT JOIN oficina AS o 
ON e.codigo_oficina = o.codigo_oficina
WHERE o.codigo_oficina IS NULL;

SELECT e.nombre, e.apellido1
FROM empleado AS e
LEFT JOIN cliente AS c 
ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_empleado_rep_ventas IS NULL;

SELECT e.nombre, e.apellido1, o.nombre_oficina
FROM empleado AS e
LEFT JOIN cliente AS c 
ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN oficina AS o
ON e.codigo_oficina = o.codigo_oficina
WHERE c.codigo_empleado_rep_ventas IS NULL;

/* */

SELECT DISTINCT(p.nombre)
FROM producto AS p
LEFT JOIN detalle_pedido AS dp
ON p.codigo_producto = dp.producto_codigo_producto
WHERE dp.producto_codigo_producto IS NULL;

SELECT DISTINCT(p.nombre), p.descripcion, gp.imagen
FROM detalle_pedido AS dp
RIGHT JOIN producto AS p
ON dp.producto_codigo_producto = p.codigo_producto
RIGHT JOIN gama_producto AS gp
ON p.gama = gp.gama
WHERE dp.producto_codigo_producto IS NULL;

SELECT DISTINCT(c.nombre_cliente)
FROM cliente AS c
LEFT JOIN pedido AS p
ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago AS pa
ON c.codigo_cliente = pa.codigo_cliente
WHERE p.codigo_cliente IS NOT NULL AND pa.codigo_cliente IS NULL;

SELECT e1.nombre AS nombre_empleado, e1.apellido1 AS apellido1_empleado, e2.nombre AS nombre_jefe, e2.apellido1 AS apellido1_jefe
FROM empleado AS e1
LEFT JOIN cliente AS c 
ON e1.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN empleado AS e2
ON e1.codigo_jefe = e2.codigo_empleado
WHERE c.codigo_empleado_rep_ventas IS NULL;

SELECT COUNT(codigo_empleado) AS numero_de_empleados
FROM empleado;

/* */

SELECT AVG(total) AS pago_medio
FROM pago
WHERE YEAR(fecha_pago) = '2009';

SELECT COUNT(p.codigo_estado) AS cantidad, e.nombre_estado
FROM pedido AS p, estado AS e
WHERE p.codigo_estado = e.codigo_estado
GROUP BY e.nombre_estado
ORDER BY cantidad DESC;

SELECT MAX(precio_venta) AS precio_max, MIN(precio_venta) AS precio_min
FROM producto;

SELECT COUNT(codigo_cliente) AS numero_clientes
FROM cliente
WHERE codigo_empleado_rep_ventas IS NOT NULL;

SELECT COUNT(c.codigo_cliente) AS clientes_Madrid
FROM cliente AS c, direccion AS d, ciudad AS ci
WHERE c.codigo_cliente = d.codigo_cliente 
	AND d.codigo_ciudad = ci.codigo_ciudad 
	AND ci.nombre_ciudad = 'Madrid';
    
SELECT ci.nombre_ciudad, COUNT(c.codigo_cliente) AS clientes_M
FROM cliente AS c, direccion AS d, ciudad AS ci
WHERE c.codigo_cliente = d.codigo_cliente 
	AND d.codigo_ciudad = ci.codigo_ciudad 
	AND ci.nombre_ciudad LIKE 'M%'
GROUP BY ci.nombre_ciudad;

SELECT e.nombre, e.apellido1, COUNT(c.codigo_cliente) AS numero_clientes
FROM empleado AS e, cliente AS c
WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
GROUP BY e.codigo_empleado;

SELECT COUNT(codigo_cliente) AS numero_clientes
FROM cliente
WHERE codigo_empleado_rep_ventas IS NULL;

SELECT c.nombre_cliente, MIN(p.fecha_pago) AS primer_pago, MAX(p.fecha_pago) AS ultimo_pago
FROM cliente AS c, pago AS p
WHERE c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente;

SELECT pedido_codigo_pedido, COUNT(DISTINCT producto_codigo_producto) AS productos_diferentes
FROM detalle_pedido
GROUP BY pedido_codigo_pedido;

SELECT pedido_codigo_pedido, SUM(cantidad) AS cantidad_total
FROM detalle_pedido
GROUP BY pedido_codigo_pedido;

SELECT p.nombre, SUM(dp.cantidad) AS unidades_vendidas
FROM producto AS p, detalle_pedido AS dp
WHERE p.codigo_producto = dp.producto_codigo_producto
GROUP BY p.nombre
ORDER BY unidades_vendidas DESC
LIMIT 20;

SELECT dp.pedido_codigo_pedido, SUM((p.precio_venta*dp.cantidad)) AS base_imponible, SUM(((p.precio_venta*dp.cantidad)*0.21)) AS IVA, SUM(((p.precio_venta*dp.cantidad)+((p.precio_venta*dp.cantidad)*0.21))) AS total
FROM detalle_pedido AS dp, producto AS p
WHERE dp.producto_codigo_producto = p.codigo_producto
GROUP BY dp.pedido_codigo_pedido;

/* */

SELECT DISTINCT(p.nombre), SUM(dp.cantidad) AS cantidad, SUM((p.precio_venta*dp.cantidad)) AS total, SUM(((p.precio_venta*dp.cantidad)+((p.precio_venta*dp.cantidad)*0.21))) AS total_con_IVA
FROM producto AS p, detalle_pedido AS dp
WHERE ((p.precio_venta*dp.cantidad)+((p.precio_venta*dp.cantidad)*0.21)) > 3000
GROUP BY p.nombre;

SELECT YEAR(p.fecha_pago) AS año_pago, SUM(p.total) AS total_pagos
FROM pago AS p
GROUP BY YEAR(p.fecha_pago);

SELECT c.nombre_cliente, COUNT(p.codigo_pedido) AS numero_pedidos
FROM cliente AS c
LEFT JOIN pedido AS p
ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente;

SELECT c.nombre_cliente, COALESCE(SUM(p.total), 0) AS total_pagado
FROM cliente AS c
LEFT JOIN pago AS p 
ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente;

SELECT DISTINCT c.nombre_cliente
FROM cliente AS c
JOIN pedido AS p 
ON c.codigo_cliente = p.codigo_cliente
JOIN detalle_pedido AS dp 
ON p.codigo_cliente = dp.pedido_codigo_pedido
WHERE YEAR(p.fecha_pedido) = 2008
ORDER BY c.nombre_cliente ASC;

/* */

SELECT c.nombre_cliente, e.nombre AS nombre_representante_ventas, e.apellido1 AS apellido_representante_ventas, ci.nombre_ciudad
FROM cliente AS c, empleado AS e, oficina AS o, direccion AS d, ciudad AS ci
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
	AND e.codigo_oficina = o.codigo_oficina
    AND o.codigo_direccion = d.codigo_direccion
    AND d.codigo_ciudad = ci.codigo_ciudad;
    
/* */

SELECT c.nombre_ciudad, COUNT(e.codigo_empleado) AS numero_empleados
FROM ciudad AS c
JOIN direccion AS d
ON c.codigo_ciudad = d.codigo_ciudad
JOIN oficina AS o
ON o.codigo_direccion = d.codigo_direccion
JOIN empleado AS e
ON e.codigo_oficina = o.codigo_oficina
GROUP BY c.nombre_ciudad;