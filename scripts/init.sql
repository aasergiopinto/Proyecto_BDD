CREATE TABLE producto (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    valor INT NOT NULL
);

CREATE TABLE accion_comercial (
    id_accion INT PRIMARY KEY,
    nombre_accion VARCHAR(150) NOT NULL,
    objetivo TEXT NOT NULL,
    presupuesto INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE canal_difusion (
    id_canal INT PRIMARY KEY,
    nombre_canal VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL
);

CREATE TABLE utiliza (
    id_accion_comercial INT,
    id_canal INT,
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion),
    FOREIGN KEY (id_canal) REFERENCES canal_difusion(id_canal)
);

CREATE TABLE segmento (
    id_segmento INT PRIMARY KEY,
    tamano_segmento INT NOT NULL,
    nombre_segmento VARCHAR(100),
    criterios TEXT NOT NULL
);

CREATE TABLE dirigido (
    id_segmento INT,
    id_accion_comercial INT,
    FOREIGN KEY (id_segmento) REFERENCES segmento(id_segmento),
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion)
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
    FOREIGN KEY (rut_cliente) REFERENCES cliente(rut)
);

CREATE TABLE resultado (
    id_resultado INT PRIMARY KEY,
    tipo_resultado VARCHAR(100) NOT NULL,
    valor INT NOT NULL,
    id_interaccion INT,
    id_accion_comercial INT,
    FOREIGN KEY (id_accion_comercial) REFERENCES accion_comercial(id_accion)
);
