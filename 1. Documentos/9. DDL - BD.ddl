-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-07-24 16:13:51 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE calificacion (
    id_calificacion                unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    calificacion                   NUMBER(2),
    nutricionista_id_nutricionista NUMBER(9) NOT NULL,
    usuarios_id_usuarios           NUMBER(7) NOT NULL
);

ALTER TABLE calificacion ADD CONSTRAINT calificacion_pk PRIMARY KEY ( id_calificacion );

CREATE TABLE disponibilidad (
    id_disponibilidad    NUMBER(2) NOT NULL,
    disponibilidad       CHAR(1),
    fecha_disponibilidad TIMESTAMP WITH LOCAL TIME ZONE
);

ALTER TABLE disponibilidad ADD CONSTRAINT disponibilidad_pk PRIMARY KEY ( id_disponibilidad );

CREATE TABLE especialidad (
    id_especialidad     NUMBER(6) NOT NULL,
    nombre_especialidad VARCHAR2(20),
    usu_crea            VARCHAR2(20),
    date_crea           TIMESTAMP WITH LOCAL TIME ZONE,
    usu_modifica        VARCHAR2(20),
    date_modifica       TIMESTAMP WITH LOCAL TIME ZONE
);

ALTER TABLE especialidad ADD CONSTRAINT especialidad_pk PRIMARY KEY ( id_especialidad );

CREATE TABLE nutricionista (
    id_nutricionista                 NUMBER(9) NOT NULL,
    nombre                           VARCHAR2(25),
    apellidos                        VARCHAR2(25),
    dni                              NUMBER(9),
    foto                             BLOB,
    usu_crea                         VARCHAR2(20),
    date_crea                        TIMESTAMP WITH LOCAL TIME ZONE,
    usu_modifica                     VARCHAR2(20),
    date_modifica                    TIMESTAMP WITH LOCAL TIME ZONE,
    especialidad_id_especialidad     NUMBER(6) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    disponibilidad_id_disponibilidad NUMBER(2) NOT NULL
);

CREATE INDEX nutricionista__idx ON
    nutricionista (
        dni
    ASC );

ALTER TABLE nutricionista ADD CONSTRAINT nutricionista_pk PRIMARY KEY ( id_nutricionista );

CREATE TABLE servicio (
    id_servicio                    NUMBER(7) NOT NULL,
    usuarios_id_usuarios           NUMBER(7) NOT NULL,
    nutricionista_id_nutricionista NUMBER(9) NOT NULL,
    sucripsión_id_suscripción      NUMBER NOT NULL,
    calificacion_id_calificacion   unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( id_servicio );

CREATE TABLE sucripsión (
    id_suscripción  NUMBER NOT NULL,
    pk_tsuscripsión NUMBER NOT NULL,
    metodo_pago     VARCHAR2(20),
    monto           VARCHAR2(5),
    nombre          VARCHAR2(20)
);

ALTER TABLE sucripsión ADD CONSTRAINT sucripsión_pk PRIMARY KEY ( id_suscripción );

CREATE TABLE tiempo_suscripsión (
    id_tsuscripsión NUMBER NOT NULL,
    tiempo          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 

);

ALTER TABLE tiempo_suscripsión ADD CONSTRAINT tiempo_suscripsión_pk PRIMARY KEY ( id_tsuscripsión );

CREATE TABLE usuarios (
    id_usuarios                    NUMBER(7) NOT NULL,
    nombres                        VARCHAR2(20),
    apellidos                      VARCHAR2(20),
    dni                            NUMBER(9),
    telefono                       VARCHAR2(15),
    correo                         VARCHAR2(50),
    usu_crea                       unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    date_crea                      TIMESTAMP WITH LOCAL TIME ZONE,
    usu_modifica                   VARCHAR2(20),
    date_modifica                  TIMESTAMP WITH LOCAL TIME ZONE,
    nutricionista_id_nutricionista NUMBER NOT NULL
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_usuarios );

ALTER TABLE calificacion
    ADD CONSTRAINT calificacion_nutricionista_fk FOREIGN KEY ( nutricionista_id_nutricionista )
        REFERENCES nutricionista ( id_nutricionista );

ALTER TABLE calificacion
    ADD CONSTRAINT calificacion_usuarios_fk FOREIGN KEY ( usuarios_id_usuarios )
        REFERENCES usuarios ( id_usuarios );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE nutricionista
    ADD CONSTRAINT nutricionista_disponibilidad_fk FOREIGN KEY ( disponibilidad_id_disponibilidad )
        REFERENCES disponibilidad ( id_disponibilidad );

ALTER TABLE nutricionista
    ADD CONSTRAINT nutricionista_especialidad_fk FOREIGN KEY ( especialidad_id_especialidad )
        REFERENCES especialidad ( id_especialidad );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_calificacion_fk FOREIGN KEY ( calificacion_id_calificacion )
        REFERENCES calificacion ( id_calificacion );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_nutricionista_fk FOREIGN KEY ( nutricionista_id_nutricionista )
        REFERENCES nutricionista ( id_nutricionista );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_sucripsión_fk FOREIGN KEY ( sucripsión_id_suscripción )
        REFERENCES sucripsión ( id_suscripción );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_usuarios_fk FOREIGN KEY ( usuarios_id_usuarios )
        REFERENCES usuarios ( id_usuarios );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE sucripsión
    ADD CONSTRAINT sucripsión_tiempo_suscripsión_fk FOREIGN KEY ( pk_tsuscripsión )
        REFERENCES tiempo_suscripsión ( id_tsuscripsión );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             1
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   7
-- WARNINGS                                 0
