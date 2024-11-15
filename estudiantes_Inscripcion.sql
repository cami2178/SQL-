INSERT INTO estudiantes (nombre, edad)
VALUES ('MARIA', 21),
('SOPHIA', 27),
('JUAN', 25),
('DANIEL', 18),
('MARTA', 24);

INSERT INTO cursos (nombre_curso, duracion)
VALUES ('Matemáticas', '6 meses'),
('Física', '8 meses'),
('Historia', '5 meses'),
('lenguaje', '12 meses');

INSERT INTO inscripciones (id_estudiantes, id_cursos)
VALUES (1,1), (1,2), (2,3), (2,4), (3,1), (3,2), (4,3), (4,4);

SELECT estudiantes.nombre AS estudiante, cursos.nombre_curso AS curso FROM estudiantes
JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiantes
JOIN cursos ON inscripciones.id_cursos = cursos.id_curso;

SELECT estudiantes.nombre AS estudiante, cursos.nombre_curso AS curso FROM estudiantes
JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiantes
JOIN cursos ON inscripciones.id_cursos = cursos.id_curso
WHERE cursos.nombre_curso = 'Matemáticas';

SELECT estudiantes.nombre AS estudiante, cursos.nombre_curso AS curso FROM estudiantes
JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiantes
JOIN cursos ON inscripciones.id_cursos = cursos.id_curso
WHERE estudiantes.nombre = 'SOPHIA';

SELECT cursos.nombre_curso AS curso, COUNT(inscripciones.id_estudiantes) AS numero_estudiantes
FROM cursos JOIN inscripciones ON cursos.id_curso = inscripciones.id_cursos GROUP BY cursos.id_curso;

SELECT estudiantes.nombre AS estudiante FROM estudiantes LEFT JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiantes
WHERE inscripciones.id_estudiantes IS NULL;