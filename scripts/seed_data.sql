-- Productos
INSERT INTO producto VALUES
(1, 'Smartphone X', 'Electrónica', '2023-03-01', 800000),
(2, 'Zapatos deportivos ProRun', 'Calzado', '2022-11-15', 65000),
(3, 'Laptop NovaBook', 'Computadores', '2023-08-20', 1200000);

-- Acciones comerciales
INSERT INTO accion_comercial VALUES
(1, 'Campaña lanzamiento Smartphone X', 'Aumentar ventas iniciales', 20000000, '2023-03-10', 1),
(2, 'Promoción regreso a clases', 'Incrementar ventas escolares', 15000000, '2023-02-01', 3),
(3, 'Descuento verano ProRun', 'Reducir inventario de temporada', 10000000, '2023-12-01', 2);

-- Canales de difusión
INSERT INTO canal_difusion VALUES
(1, 'Instagram Ads', 'Digital'),
(2, 'Televisión', 'Tradicional'),
(3, 'Email Marketing', 'Digital');

-- Utiliza
INSERT INTO utiliza VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);

-- Segmentos
INSERT INTO segmento VALUES
(1, 5000, 'Jóvenes profesionales', 'Edad 25-35, nivel medio-alto de ingresos'),
(2, 3000, 'Estudiantes universitarios', 'Edad 18-25, ingresos bajos'),
(3, 2000, 'Deportistas', 'Interés en fitness y vida activa');

-- Dirigido
INSERT INTO dirigido VALUES
(1, 1),
(2, 2),
(3, 3);

-- Clientes
INSERT INTO cliente VALUES
('11.111.111-1', 'Carlos', '1990-05-12', 1200000, 'Pérez', 'Gómez', 1),
('22.222.222-2', 'María', '2001-03-10', 350000, 'López', 'Soto', 2),
('33.333.333-3', 'Andrés', '1995-09-25', 800000, 'García', 'Muñoz', 3);

-- Teléfonos
INSERT INTO telefono_cliente VALUES
('11.111.111-1', '+56911111111'),
('22.222.222-2', '+56922222222'),
('33.333.333-3', '+56933333333');

-- Resultados
INSERT INTO resultado VALUES
(1, 'Ventas', 120, NULL, 1),
(2, 'Leads generados', 300, NULL, 2),
(3, 'Clientes nuevos', 80, NULL, 3);
