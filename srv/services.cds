using { Entrenamiento, sap.common } from '../db/schemas';


service AdminService {

    type inText{
        Comentario : String;
    };

    entity Estudiantes as projection on Entrenamiento.Alumnos actions {
        @Common.IsActionCritical
        action notificaAlumno();
        @Common.IsActionCritical
        action inactivaAlumno(text:inText:Comentario);       
    };
    annotate Estudiantes with @odata.draft.enabled;
    annotate Estudiantes with @odata.draft.bypass;
    
    entity Cursos as projection on Entrenamiento.Cursos;

    annotate Cursos with @odata.draft.enabled;
    annotate Cursos with @odata.draft.bypass;

}

service EstudiantesService {

view EstudiantesByCursos as select from Entrenamiento.Cursos as CursosAlumnos

{
    key ID,
    NombreAsignatura,
    estudiantes.NombreAlumno    as NombreAlumno,
    estudiantes.FechaNacimiento as FechaNacimiento,
    estudiantes.Telefono        as Telefono,
    estudiantes.Email           as Email,
    estudiantes.Status          as Status   

}
  
}

annotate AdminService.inText:Comentario with @Common.Label : 'Comentario';
annotate AdminService.inText:Comentario with @UI.MultiLineText:true;

