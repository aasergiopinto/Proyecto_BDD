-- Productos
INSERT INTO producto (id_producto, nombre_producto, tipo, fecha_lanzamiento, valor) VALUES
(1, 'Cuenta Más Lucas', 'Cuenta Vista', '2023-01-01', 0),
(2, 'Plan Estudiantil', 'Cuenta Vista', '2022-01-01', 0),
(3, 'Crédito Hipotecario', 'Crédito Hipotecario', '2023-08-20', 0),
(4, 'Tarjeta Crédito Futura', 'Cuenta Corriente', '2000-01-01', 60000)

-- Acciones comerciales
INSERT INTO accion_comercial (id_accion, nombre_accion, objetivo, presupuesto, fecha_inicio, id_producto) VALUES
(1, 'Campaña lanzamiento Cuenta Más Lucas', 'Promocionar Cuenta Más Lucas', 20000000, '2023-03-10', 1),
(2, 'Promoción regreso a clases', 'Promocionar Plan Estudiantil a estudiantes', 15000000, '2022-01-01', 2),
(3, 'Descuento Italiano Veloz', 'Persuadir estudiantes a utilizar su cuenta vista en Italiano Veloz', 10000000, '2023-12-01', 2);

-- Canales de difusión
INSERT INTO canal_difusion (id_canal, nombre_canal, tipo) VALUES
(1, 'Instagram Ads', 'Digital'),
(2, 'Televisión', 'Tradicional'),
(3, 'Email Marketing', 'Digital');

-- Segmentos
INSERT INTO segmento (id_segmento, tamano_segmento, nombre_segmento, criterios) VALUES
(1, 5000, 'Jóvenes profesionales', 'Edad 25-35, nivel medio-alto de ingresos'),
(2, 3000, 'Estudiantes universitarios', 'Edad 18-25, ingresos bajos'),
(3, 2000, 'Deportistas', 'Interés en fitness y vida activa');
(4, 1000, 'Profesionales', 'Interes en créditos hipotecarios y tarjetas de crédito')

-- Clientes
INSERT INTO cliente (rut, nombre_cliente, fecha_nacimiento, ingresos_mensuales, apellido_paterno, apellido_materno, id_segmento) VALUES
('21.817.550-3', 'Joakin', '2005-04-16', 50000, 'Mac-Auliffe', 'López', 2),
('21.827.932-5', 'Sergio', '2005-04-23', 0, 'Pinto', 'Tapia', 2),
('21.662.158-1', 'Jordi', '2004-09-09', 48000, 'Farías', 'Araya', 2),
('11.111.111-2', 'Carlos', '1975-01-01', 3000000, 'Sánchez', 'Sánchez', 4),
('11.111.111-1', 'Carlos', '1990-05-12', 1200000, 'Pérez', 'Gómez', 1),
('22.222.222-2', 'María', '2001-03-10', 350000, 'López', 'Soto', 2),
('33.333.333-3', 'Andrés', '1995-09-25', 800000, 'García', 'Muñoz', 3);

-- Teléfonos
INSERT INTO telefono_cliente (rut_cliente, telefono) VALUES
('21.817.550-3', '+56942938546'),
('21.827.932-5', '+56992231353'),
('21.662.158-1', '+56991326190'),
('11.111.111-1', '+56911111111'),
('22.222.222-2', '+56922222222'),
('33.333.333-3', '+56933333333');

-- Resultados
INSERT INTO resultado (id_resultado, tipo_resultado, valor, id_interaccion, id_accion_comercial) VALUES
(1, 'Ventas', 120, NULL, 1),
(2, 'Leads generados', 300, NULL, 2),
(3, 'Clientes nuevos', 80, NULL, 3);

-- Utiliza (Acción Comercial X usa Canal Y)
INSERT INTO utiliza (id_accion_comercial, id_canal) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);

-- Dirigido (Acción Comercial X se dirige a Segmento Y)
INSERT INTO dirigido (id_segmento, id_accion_comercial) VALUES
(1, 1),
(2, 2),
(3, 3);