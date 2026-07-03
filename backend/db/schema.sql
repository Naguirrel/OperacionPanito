CREATE TABLE administradores (
  id_administrador SERIAL PRIMARY KEY,
  usuario VARCHAR UNIQUE NOT NULL,
  contrasena_hash VARCHAR NOT NULL
);

CREATE TABLE actividades (
  id_actividad SERIAL PRIMARY KEY,
  id_administrador INT REFERENCES administradores(id_administrador),
  nombre VARCHAR NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  lugar VARCHAR NOT NULL,
  descripcion TEXT NOT NULL,
  cupo_maximo INT,
  estado VARCHAR NOT NULL
);

CREATE TABLE requerimientos (
  id_requerimiento SERIAL PRIMARY KEY,
  id_actividad INT NOT NULL REFERENCES actividades(id_actividad),
  nombre VARCHAR NOT NULL,
  descripcion TEXT,
  estado VARCHAR NOT NULL DEFAULT 'disponible'
);

CREATE TABLE voluntarios (
  id_voluntario SERIAL PRIMARY KEY,
  nombre_completo VARCHAR NOT NULL,
  contacto VARCHAR NOT NULL,
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inscripciones (
  id_inscripcion SERIAL PRIMARY KEY,
  id_actividad INT NOT NULL REFERENCES actividades(id_actividad),
  id_voluntario INT NOT NULL REFERENCES voluntarios(id_voluntario),
  fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reserva_requerimiento (
  id_reserva SERIAL PRIMARY KEY,
  id_requerimiento INT NOT NULL UNIQUE REFERENCES requerimientos(id_requerimiento),
  id_voluntario INT NOT NULL REFERENCES voluntarios(id_voluntario),
  fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE publicaciones_blog (
  id_publicacion SERIAL PRIMARY KEY,
  id_administrador INT REFERENCES administradores(id_administrador),
  titulo VARCHAR NOT NULL,
  contenido TEXT NOT NULL,
  fecha_publicacion DATE NOT NULL
);
