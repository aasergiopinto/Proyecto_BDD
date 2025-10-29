
DROP TABLE IF EXISTS resultado CASCADE;
DROP TABLE IF EXISTS telefono_cliente CASCADE;
DROP TABLE IF EXISTS cliente_segmento CASCADE;
DROP TABLE IF EXISTS segmento_accion CASCADE;
DROP TABLE IF EXISTS accion_canal CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS canal_difusion CASCADE;
DROP TABLE IF EXISTS accion_comercial CASCADE;
DROP TABLE IF EXISTS segmento CASCADE;
DROP TABLE IF EXISTS producto_bancario CASCADE;


CREATE TABLE producto_bancario (
    id_producto_bancario INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL    
);

CREATE TABLE canal_difusion (
    id_canal_difusion INT PRIMARY KEY,
    nombre_canal VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL
);

CREATE TABLE segmento (
    id_segmento INT PRIMARY KEY,
    tamano_segmento INT NOT NULL,
    nombre_segmento VARCHAR(100),
    criterios TEXT NOT NULL
);
CREATE TABLE cliente (
    rut VARCHAR(14) PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    fecha_nacimiento DATE NOT NULL,
    ingresos_mensuales INT,
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100)
);

CREATE TABLE accion_comercial (
    id_accion_comercial INT PRIMARY KEY,
    nombre_accion VARCHAR(150) NOT NULL,
    objetivo TEXT NOT NULL,
    presupuesto INT NOT NULL,
    exito_esperado FLOAT,
    fecha_inicio DATE NOT NULL,
    fecha_termino DATE,
    id_producto_bancario INT,
    FOREIGN KEY (id_producto_bancario) REFERENCES producto_bancario(id_producto_bancario)
);

CREATE TABLE accion_canal (
    id_accion_comercial INT,
    id_canal_difusion INT,
    PRIMARY KEY (id_accion_comercial, id_canal_difusion),
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion_comercial),
    FOREIGN KEY (id_canal_difusion) REFERENCES canal_difusion(id_canal_difusion)
);

CREATE TABLE cliente_segmento (
    id_segmento INT,
    rut VARCHAR(14),
    PRIMARY KEY (id_segmento, rut),
    FOREIGN KEY (id_segmento) REFERENCES segmento(id_segmento),
    FOREIGN KEY (rut) REFERENCES cliente(rut) 
);

CREATE TABLE segmento_accion (
    id_segmento INT,
    id_accion_comercial INT,
    PRIMARY KEY (id_segmento, id_accion_comercial),
    FOREIGN KEY (id_segmento) REFERENCES segmento(id_segmento),
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion_comercial)
);

CREATE TABLE telefono_cliente (
    rut VARCHAR(14),
    telefono VARCHAR(100),
    PRIMARY KEY (rut, telefono),
    FOREIGN KEY (rut) REFERENCES cliente(rut)
);

CREATE TABLE resultado (
    id_resultado INT PRIMARY KEY,
    tipo_resultado VARCHAR(100) NOT NULL,
    clientes_alcanzados INT NOT NULL,
    rentabilidad INT NOT NULL,
    coeficiente_exito FLOAT NOT NULL,
    id_accion_comercial INT,
    inversion_recuperada BOOLEAN,
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion_comercial)
);

-- DML

INSERT INTO producto_bancario (id_producto_bancario, nombre_producto, tipo, fecha_lanzamiento) VALUES
(201, 'Credito Hipotecario Flexible', 'Hipoteca', '2023-01-15'),
(202, 'Cuenta Joven Digital', 'Cuenta Corriente', '2024-03-01'),
(203, 'Fondo Mutuo Agresivo', 'Inversion', '2022-06-20');

INSERT INTO segmento (id_segmento, tamano_segmento, nombre_segmento, criterios) VALUES
(101, 50000, 'Alto Valor', 'Ingresos mensuales > $2.000.000 y saldo promedio alto.'),
(102, 35000, 'Joven Universitario', 'Edad entre 18 y 25, con estudios superiores.'),
(103, 70000, 'Ahorrador Conservador', 'Edad > 45, sin deudas de consumo, historial de depósitos a plazo.');

INSERT INTO canal_difusion (id_canal_difusion, nombre_canal, tipo) VALUES
(301, 'Email Marketing', 'Digital'),
(302, 'Sucursal Física', 'Presencial'),
(303, 'App Móvil - Banner', 'Digital'),
(304, 'Redes Sociales', 'Digital');

-- B. DATOS DE CLIENTES Y SU SEGMENTACIÓN (N:M)
INSERT INTO cliente (rut, nombre_cliente, fecha_nacimiento, ingresos_mensuales, apellido_paterno, apellido_materno) VALUES
('18.123.456-7', 'Andrea', '1980-05-20', 2500000, 'Soto', 'Perez'),
('20.987.654-3', 'Javier', '2002-11-10', 500000, 'Muñoz', 'Rojas'),
('15.555.333-2', 'Roberto', '1975-02-28', 1800000, 'Vega', 'Lara'),
('14.000.111-k', 'Sofia', '1995-08-12', 1200000, 'Diaz', 'Araya');

INSERT INTO telefono_cliente (rut, telefono) VALUES
('18.123.456-7', '+56911112222'),
('20.987.654-3', '+56933334444'),
('15.555.333-2', '+56955556666'),
('18.123.456-7', '227890123');

INSERT INTO cliente_segmento (id_segmento, rut) VALUES
(101, '18.123.456-7'),
(103, '18.123.456-7'),
(102, '20.987.654-3'),
(103, '15.555.333-2'),
(101, '14.000.111-k');


-- C. DATOS DE ACCIONES COMERCIALES Y RESULTADOS (PRUEBA DE RENTABILIDAD VS PRESUPUESTO)
INSERT INTO accion_comercial (id_accion_comercial, nombre_accion, objetivo, presupuesto, exito_esperado, fecha_inicio, fecha_termino, id_producto_bancario) VALUES
(401, 'Mega Campaña Hipotecaria', 'Aumentar colocación de hipotecas en 20%', 100000000, 0.20, '2025-10-01', '2025-12-31', 201),
(402, 'Promo App Inversión', 'Captar 1.000 nuevos inversionistas', 5000000, 0.10, '2025-11-01', '2025-12-31', 203),
(403, 'Black Friday Cuenta Joven', 'Abrir 5.000 cuentas nuevas', 20000000, 0.05, '2025-11-20', '2025-12-05', 202),
(404, 'Reactivación Clientes SMS', 'Venta de Hipoteca a clientes inactivos', 1000000, 0.01, '2025-10-15', '2025-11-15', 201);

INSERT INTO resultado (id_resultado, tipo_resultado, clientes_alcanzados, rentabilidad, coeficiente_exito, inversion_recuperada, id_accion_comercial) VALUES
(501, 'Cierre Q4 Hipoteca', 15000, 150000000, 0.15, TRUE, 401),
(502, 'Cierre Q4 Inversion', 500, 2500000, 0.05, FALSE, 402),
(503, 'Cierre Q4 Cta Joven', 2000, 20000000, 0.04, TRUE, 403),
(504, 'Cierre Q4 SMS', 100, 5000000, 0.50, TRUE, 404);

-- D. RELACIONES ENTRE CAMPAÑAS, CANALES Y SEGMENTOS
INSERT INTO accion_canal (id_accion_comercial, id_canal_difusion) VALUES
(401, 301), (401, 302),
(402, 303), (402, 304),
(403, 303),
(404, 301);

INSERT INTO segmento_accion (id_segmento, id_accion_comercial) VALUES
(101, 401),
(103, 402),
(102, 403),
(101, 404);