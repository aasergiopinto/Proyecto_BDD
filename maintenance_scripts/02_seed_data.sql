BEGIN;

INSERT INTO segmentos VALUES
(1, 10000, 'Universitarios', 'Personas matriculadas en una institución de educación superior'),
(2, 7000, 'Pobres', 'Gente sin plata');

INSERT INTO productos VALUES
(1, 'Tarjeta Más Lucas', 'Cuenta Vista', '2020-01-01', 400000);

INSERT INTO accion_comercial VALUES
(1, 'Descuento en Papa Johns', 'Que los universitarios coman pizza', 15000000, '2025-01-01', 1);

INSERT INTO clientes VALUES 
(218175503, 'Joakin', '2005-04-16', 500000, 'Mac-Auliffe', 'López', 1),
(217978281, 'Martin', '2005-02-10', 450000, 'Correa', 'Olguín', 2),
(219321281, 'Sergio', '2005-04-23', 475000, 'Pinto', 'Tapia', 1);

COMMIT;