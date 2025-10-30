SELECT cl.nombre_cliente
FROM cliente cl
JOIN cliente_segmento cs ON cl.rut = cs.rut
JOIN segmento s ON cs.id_segmento = s.id_segmento
JOIN segmento_accion sa ON s.id_segmento = sa.id_segmento
JOIN accion_comercial ac ON sa.id_accion_comercial = ac.id_accion_comercial
JOIN producto pr ON ac.id_producto = pr.id_producto
GROUP BY c.nombre_cliente
HAVING pr.nombre_producto = 'Credito Hipotecario Flexible';

SELECT 
    AVG(r.coeficiente_éxito) AS promedio_exito
FROM resultado r
WHERE r.titulo_resultado ILIKE 'exitoso';


SELECT DISTINCT s.nombre_segmento
FROM segmentos s
JOIN segmento_accion sa ON s.id_segmento = sa.id_segmento
JOIN acción_comercial ac ON sa.id_acción_comercial = ac.id_acción_comercial
JOIN accion_canal aca ON ac.id_acción_comercial = aca.id_acción_comercial
JOIN canal_de_difusión c ON aca.id_canal = c.id_canal
WHERE c.nombre ILIKE 'Email Marketing';

SELECT 
    s.nombre_segmento,
    AVG(r.coeficiente_éxito) AS promedio_exito
FROM segmentos s
JOIN segmento_accion sa ON s.id_segmento = sa.id_segmento
JOIN acción_comercial ac ON sa.id_acción_comercial = ac.id_acción_comercial
JOIN productos_bancarios p ON ac.id_producto = p.id_producto
JOIN resultado r ON ac.id_acción_comercial = r.id_acción_comercial
WHERE p.tipo ILIKE 'Cuenta Joven Digital'
GROUP BY s.nombre_segmento
ORDER BY promedio_exito DESC;

SELECT ac.nombre, ac.objetivo, ac.fecha_termino
FROM acción_comercial ac
JOIN resultado r ON ac.id_acción_comercial = r.id_acción_comercial
WHERE r.titulo_resultado ILIKE 'fallido' 
  AND ac.fecha_termino = '2024-01-01';

SELECT DISTINCT c.nombre, c.rut, c.ingresos_mensuales
FROM clientes c
JOIN cliente_segmento cs ON c.rut = cs.rut
JOIN segmentos s ON cs.id_segmento = s.id_segmento
JOIN segmento_accion sa ON s.id_segmento = sa.id_segmento
JOIN acción_comercial ac ON sa.id_acción_comercial = ac.id_acción_comercial
JOIN accion_canal aca ON ac.id_acción_comercial = aca.id_acción_comercial
JOIN canal_de_difusión cd ON aca.id_canal = cd.id_canal
WHERE c.ingresos_mensuales > 4000000
  AND cd.nombre ILIKE 'instagram';

SELECT 
    cd.nombre AS canal,
    COUNT(*) AS cantidad_promociones
FROM canal_de_difusión cd
JOIN accion_canal aca ON cd.id_canal = aca.id_canal
JOIN acción_comercial ac ON aca.id_acción_comercial = ac.id_acción_comercial
JOIN productos_bancarios p ON ac.id_producto = p.id_producto
WHERE p.tipo ILIKE 'crédito de consumo'
GROUP BY cd.nombre
ORDER BY cantidad_promociones DESC;
