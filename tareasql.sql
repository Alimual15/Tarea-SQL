CREATE DATABASE Colegio;

USE Colegio;

CREATE TABLE Escuela (
    IdEscuela INT PRIMARY KEY,
    NombreEscuela VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    Direccion VARCHAR(50) NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    CodigoPostal VARCHAR(50) NOT NULL,
    DireccionPostal VARCHAR(50) NOT NULL
);

CREATE TABLE Clase (
    IdClase INT PRIMARY KEY,
    IdEscuela INT,
    NombreClase VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    FOREIGN KEY (IdEscuela) REFERENCES Escuela(IdEscuela)
);

CREATE TABLE Curso (
    IdCurso INT PRIMARY KEY,
    NombreCurso VARCHAR(50) NOT NULL,
    IdEscuela INT,
    Descripcion VARCHAR(1000),
    FOREIGN KEY (IdEscuela) REFERENCES Escuela(IdEscuela)
);

CREATE TABLE Estudiante (
    IdEstudiante INT PRIMARY KEY,
    IdClase INT,
    NombreEstudiante VARCHAR(100) NOT NULL,
    NumeroEstudiante VARCHAR(20) NOT NULL,
    CalificacionTotal FLOAT,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    FOREIGN KEY (IdClase) REFERENCES Clase(IdClase)
);

CREATE TABLE Profesor (
    IdProfesor INT PRIMARY KEY,
    IdEscuela INT,
    NombreProfesor VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    FOREIGN KEY (IdEscuela) REFERENCES Escuela(IdEscuela)
);

CREATE TABLE Estudiante_Curso (
    IdEstudiante INT,
    IdCurso INT,
    PRIMARY KEY (IdEstudiante, IdCurso),
    FOREIGN KEY (IdEstudiante) REFERENCES Estudiante(IdEstudiante),
    FOREIGN KEY (IdCurso) REFERENCES Curso(IdCurso)
);

CREATE TABLE Profesor_Curso (
    IdProfesor INT,
    IdCurso INT,
    PRIMARY KEY (IdProfesor, IdCurso),
    FOREIGN KEY (IdProfesor) REFERENCES Profesor(IdProfesor),
    FOREIGN KEY (IdCurso) REFERENCES Curso(IdCurso)
);

CREATE TABLE Calificacion (
    IdCalificacion INT PRIMARY KEY,
    IdEstudiante INT, IdCurso INT,
    Calificacion FLOAT,
    FOREIGN KEY (IdEstudiante) REFERENCES Estudiante(IdEstudiante),
    FOREIGN KEY (IdCurso) REFERENCES Curso(IdCurso)
);