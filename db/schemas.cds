namespace Entrenamiento;

using { managed, cuid } from '@sap/cds/common';
using { Attachments } from '@cap-js/attachments';


entity Alumnos : cuid, managed {

    key ID          : UUID;
    NombreAlumno    : String    @mandatory
                                @assert.format : '[a-zA-Z]+ [a-zA-Z]';
    FechaNacimiento : Date      @mandatory;
    Telefono        : String    @assert.format: '[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]';
    Email           : String    @assert.format: '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]';
    Status          : String(1) @assert.range enum {A; I; P };
    Critico         : Integer;
    Comentario      : String;
    Curso           : Association to Cursos;
    attachemts      : Composition of many Attachments;
    
}

entity Cursos : cuid, managed {

    key ID              : UUID;
    NombreAsignatura    : String  @mandatory;
    MaxEstudiantes      : Integer @mandatory 
                                  @assert.range:[0,30];
    estudiantes         : Association to many Alumnos on estudiantes.Curso = $self;

}

