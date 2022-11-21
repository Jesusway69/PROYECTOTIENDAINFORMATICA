-- 1. CREAR UNA BASE DATOS

DROP DATABASE IF EXISTS TIENDAINFORMATICA;
CREATE DATABASE TIENDAINFORMATICA;

-- 2. USAR UNA BASE DE DATOS

USE TIENDAINFORMATICA;

-- 3. CREAR UNA TABLA

DROP TABLE IF EXISTS Producto;
 
CREATE TABLE Producto(
  codigo            VARCHAR(4)   NOT NULL,
  nombreProducto    VARCHAR(100)  NOT NULL,
  descripcion       VARCHAR(100)  NOT NULL,
                    INT          NOT NULL,
  precio            DOUBLE       NOT NULL,
  foto              VARCHAR(10)  NOT NULL,
            PRIMARY KEY(codigo)
);

-- 4. MOSTRAR LAS TABLAS DE UNA BASE DE DATOS

SHOW TABLES;

-- 5. DESCRBIR UNA TABLE

DESCRIBE Producto;

-- 6. INSERTAR REGISTRO EN UNA TABLA

INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P01','Disco duro','NVME M.2 1TB',158.60,'1.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P02','Memoria RAM','DDR4 2600MHZ 8GB',33.25,'2.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P03','Fuente de alimentación','1000W gold',48.50,'3.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P04','Placa base','ATX socket AM4',109.75,'4.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P05','Gabinete PC','caja con ventiladores rgb',35.20,'5.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P06','Tarjeta Gráfica','rtx 3060 12gb',550.52,'6.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P07','Monitor','27" 144hz 4k',355.80,'7.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P08','Teclado y ratón','bluetooth 4.2',67.60,'8.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P09','Webcam','fullhd 1080',25.90,'9.png');
INSERT INTO Producto(codigo,nombreProducto,descripcion,precio,foto) VALUES('P10','Procesador','Ryzen 5 5600X',325.60,'10.png');

-- 7. MOSTRAR TODOS LOS REGISTROS DE UNA TABLA

SELECT * FROM Producto;