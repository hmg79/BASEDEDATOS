CREATE SCHEMA sigef;
CREATE TABLE `sigef`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  `intentosfallidos` INT NULL,
  `bloqueadohasta` DATE NULL,
  `id_institución` INT NULL,
  PRIMARY KEY (`id_usuario`))
COMMENT = 'Base de datos de Usuarios con roles de control';
CREATE TABLE `sigef`.`intentoacceso` (
  `id_intentoacceso` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `IP` VARCHAR(100) NOT NULL,
  `fechahora` DATE NOT NULL,
  `exitoso` TINYINT NULL,
  PRIMARY KEY (`id_intentoacceso`),
  UNIQUE INDEX `id_intentoacceso_UNIQUE` (`id_intentoacceso` ASC) VISIBLE)
COMMENT = 'Resguardo de los intentos de accesos y bloqueo del usuario';
CREATE TABLE `sigef`.`provincia` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE INDEX `id_provincia_UNIQUE` (`id_provincia` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE);
CREATE TABLE `sigef`.`localidad` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_localidad`),
  UNIQUE INDEX `id_localidad_UNIQUE` (`id_localidad` ASC) VISIBLE)
COMMENT = 'Tabla de las localidades donde se encuentra un NEP y FP';
CREATE TABLE `sigef`.`institucion` (
  `id_institucion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `id_localidad` INT NOT NULL,
  PRIMARY KEY (`id_institucion`),
  UNIQUE INDEX `id_institucion_UNIQUE` (`id_institucion` ASC) VISIBLE)
COMMENT = 'Tabla de las Instituciones tipo sede';
CREATE TABLE `sigef`.`unidaddependiente` (
  `id_unidaddependiente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
   `id_institucion` INT NOT NULL,
  PRIMARY KEY (`id_unidaddependiente`))
COMMENT = 'Tabla de instituciones que dependen de las sedes';
CREATE TABLE `sigef`.`tipocapacitacion` (
  `id_tipocapacitacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `id_nivel` INT NOT NULL,
  `resolucion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_tipocapacitacion`));
CREATE TABLE `sigef`.`nivel` (
  `id_nivel` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_nivel`),
  UNIQUE INDEX `id_nivel_UNIQUE` (`id_nivel` ASC) VISIBLE)
COMMENT = 'Tabla de nivel Terminalidad Primaria, Capacitación Laboral, Formación Profesional';
CREATE TABLE `sigef`.`alumno` (
  `id_alumno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido` VARCHAR(150) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE INDEX `idalumno_UNIQUE` (`id_alumno` ASC) VISIBLE)
COMMENT = 'Listado de alumnos';
CREATE TABLE `sigef`.`inscripción` (
  `id_inscripcion` INT NOT NULL AUTO_INCREMENT,
  `id_alumno` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `id_institucion` INT NOT NULL,
  `fechaInscripcion` DATE NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  UNIQUE INDEX `id_inscripcion_UNIQUE` (`id_inscripcion` ASC) VISIBLE)
COMMENT = 'Tabla de relacion de Inscripción';
