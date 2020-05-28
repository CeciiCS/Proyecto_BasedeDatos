-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-05-28 00:48:22 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativa (
    idalt                INTEGER NOT NULL,
    descripcion          VARCHAR2(500),
    valorlogico          CHAR(1),
    porcentaje           FLOAT,
    pregunta_idpregunta  INTEGER NOT NULL
);

ALTER TABLE alternativa ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalt );

CREATE TABLE estudiante (
    rut              VARCHAR2(10) NOT NULL,
    nombre           VARCHAR2(50 CHAR),
    apellidopat      VARCHAR2(50 CHAR),
    apellidomat      VARCHAR2(50 CHAR),
    programa_idprog  INTEGER NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( rut );

CREATE TABLE pregunta (
    idpregunta   INTEGER NOT NULL,
    pregunta     VARCHAR2(500),
    puntaje      FLOAT,
    test_idtest  INTEGER NOT NULL
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta );

CREATE TABLE programa (
    idprog  INTEGER NOT NULL,
    nombre  VARCHAR2(50)
);

ALTER TABLE programa ADD CONSTRAINT programa_pk PRIMARY KEY ( idprog );

CREATE TABLE resultadotest (
    respuesta            INTEGER NOT NULL,
    puntaje              INTEGER,
    pregunta_idpregunta  INTEGER NOT NULL,
    test_idtest          INTEGER NOT NULL,
    estudiante_rut       VARCHAR2(10) NOT NULL
);

ALTER TABLE resultadotest
    ADD CONSTRAINT resultadotest_pk PRIMARY KEY ( pregunta_idpregunta,
                                                  test_idtest,
                                                  estudiante_rut,
                                                  respuesta );

CREATE TABLE test (
    idtest           INTEGER NOT NULL,
    nombre           VARCHAR2(100),
    descripcion      VARCHAR2(500),
    autor            VARCHAR2(100),
    fechacreacion    DATE,
    programa_idprog  INTEGER NOT NULL,
    unidad_idunidad  INTEGER NOT NULL
);

CREATE UNIQUE INDEX test__idx ON
    test (
        unidad_idunidad
    ASC );

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( idtest );

CREATE TABLE unidad (
    idunidad         INTEGER NOT NULL,
    nombre           VARCHAR2(100),
    programa_idprog  INTEGER NOT NULL
);

ALTER TABLE unidad ADD CONSTRAINT unidad_pk PRIMARY KEY ( idunidad );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_programa_fk FOREIGN KEY ( programa_idprog )
        REFERENCES programa ( idprog );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE resultadotest
    ADD CONSTRAINT resultadotest_estudiante_fk FOREIGN KEY ( estudiante_rut )
        REFERENCES estudiante ( rut );

ALTER TABLE resultadotest
    ADD CONSTRAINT resultadotest_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE resultadotest
    ADD CONSTRAINT resultadotest_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE test
    ADD CONSTRAINT test_programa_fk FOREIGN KEY ( programa_idprog )
        REFERENCES programa ( idprog );

ALTER TABLE test
    ADD CONSTRAINT test_unidad_fk FOREIGN KEY ( unidad_idunidad )
        REFERENCES unidad ( idunidad );

ALTER TABLE unidad
    ADD CONSTRAINT unidad_programa_fk FOREIGN KEY ( programa_idprog )
        REFERENCES programa ( idprog );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             16
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
-- ERRORS                                   0
-- WARNINGS                                 0
