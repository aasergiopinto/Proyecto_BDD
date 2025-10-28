CREATE TABLE producto_bancario (
    id_producto_bancario INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL    
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

CREATE TABLE canal_difusion (
    id_canal_difusion INT PRIMARY KEY,
    nombre_canal VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL
);

CREATE TABLE accion_canal (
    id_accion_comercial INT,
    id_canal_difusion INT,
    PRIMARY KEY (id_accion_comercial, id_canal_difusion),
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion_comercial),
    FOREIGN KEY (id_canal_difusion) REFERENCES canal_difusion(id_canal_difusion)
);

CREATE TABLE segmento (
    id_segmento INT PRIMARY KEY,
    tamano_segmento INT NOT NULL,
    nombre_segmento VARCHAR(100),
    criterios TEXT NOT NULL
);

CREATE TABLE cliente_segmento (
    id_segmento INT,
    id_cliente INT,
    PRIMARY KEY (id_segmento, id_cliente),
    FOREIGN KEY (id_segmento) REFERENCES segmento(id_segmento),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) 
);

CREATE TABLE segmento_accion (
    id_segmento INT,
    id_accion_comercial INT,
    PRIMARY KEY (id_segmento, id_accion_comercial),
    FOREIGN KEY (id_segmento) REFERENCES segmento(id_segmento),
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion_comercial)
);

CREATE TABLE cliente (
    rut VARCHAR(14) PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    fecha_nacimiento DATE NOT NULL,
    ingresos_mensuales INT,
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100),
    id_segmento INT,
    FOREIGN KEY (id_segmento) REFERENCES segmento(id_segmento)
);

CREATE TABLE telefono_cliente (
    rut_cliente VARCHAR(14),
    telefono VARCHAR(100),
    PRIMARY KEY (rut_cliente, telefono),
    FOREIGN KEY (rut_cliente) REFERENCES cliente(rut)
);

CREATE TABLE resultado (
    id_resultado INT PRIMARY KEY,
    tipo_resultado VARCHAR(100) NOT NULL,
    clientes_alcanzados INT NOT NULL,
    rentabilidad INT NOT NULL,
    coeficiente_exito FLOAT NOT NULL,
    id_accion_comercial INT,
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion_comercial)
);
