const cds = require('@sap/cds')
const { SELECT, INSERT, UPDATE, DELETE } = cds.ql

/**Services Implementation */
module.exports = cds.service.impl(function(){

    this.before(['CREATE','UPDATE'], 'Alumnos', function(req){

        console.log("Alumnos" + '-' + req.data.NombreAlumno);

        if(req.data && !req.data.NombreAlumno){
            //req.info(200,'Info - Nome precisa ser preenchido');
            req.error(400,'Erro - Nome precisa ser preenchido');
            //req.warn(412,'Warnig - Nome precisa ser preenchido');
            //req.notify(412,'Notify - Nome precisa ser preenchido');

        }
    })
    this.before(['CREATE','UPDATE'], 'Cursos', function(req){

        console.log("Cursos" + '-' + req.data.NombreAsignatura);

        if(req.data && !req.data.NombreAsignatura){
            req.error(400,'Erro - Ingresar Nombre Asignatura');
        }
        if(req.data && req.data.MaxEstudiantes > 30){
            req.error(400,'Erro - Maximo de Estudiantes no puede ser mayor que 30');
        }
    })

    this.on('notificaAlumno', async function (req) {
        console.log("Notifica Alumno");
        let id;
        let alumnos;
        let query;
        let Nome;
        let curso_ID;
        let cursos;
        let curso_nome;
        let status;

        const params = req.params;
        if (params != null) {
            let adms = await cds.connect.to('AdminService'); 
            for (let i = 0; i < params.length; i++) {
                if (params[i].ID != null) {
                    id = params[i].ID;
                    console.log('ID: ' + id);
                    query = SELECT`ID,NombreAlumno,Status,Curso`.from`Estudiantes`.where`ID = ${id}`;
                    alumnos = await adms.run(query);
                    if (alumnos) {
                        Nome     = alumnos[0].NombreAlumno;
                        curso_ID = alumnos[0].Curso_ID;
                        status   = alumnos[0].Status;
                    }
                    console.log('Nombre: ' + Nome + ' - ID Curso: ' + curso_ID);
                    
                    query = SELECT`ID,NombreAsignatura`.from`Cursos`.where`ID = ${curso_ID}`;
                    cursos = await adms.run(query);
                    if (cursos) {
                        curso_nome = cursos[0].NombreAsignatura;
                    }

                    console.log('Nombre Curso: ' + curso_nome);
                    //req.info(400, 'Alumno: ' + id + ' ' + Nome + ' cursando: ' + curso_nome + ' Status: ' + status + ' notificado con exito!');
                    req.info(400, 'Alumno: ' + Nome + ' cursando : ' + curso_nome + ' Status: ' + status + ' notificado con exito!');

                }
            }
        }
    })

    this.on('inactivaAlumno', async function (req) {
        console.log('Inactiva Alumno');

        const { Estudiantes } = this.entities;

        //recupera ID Alumno
        const params = req.params;
        if(params != null){

            for (let i = 0; i < params.length; i++){

                if (params[i].ID != null) {

                    await UPDATE.entity(Estudiantes, params[i].ID)
                    .set({Status:'I', Comentario: req.data.text});

                    console.log('ID :' + params[i].ID + ' - Status :' + params[i].Status);
                    req.info(400, 'Alumno: ' + params[i].ID + '  ' + req.data.text + 'Status Actualizado Exitosamente');

                }
            }
        }
        req.reply();
    })


    this.after('READ', 'Estudiantes', function(data){

        const alumnos = Array.isArray(data) ? data : [data];

        alumnos.forEach((alumno) => {
            switch (alumno.Status){
                case 'A': //Activo
                    alumno.Critico = 3;
                    break;
                case 'I': //Inactivo
                    alumno.Critico = 2;
                    break;
                case 'P': //Pendiente
                    alumno.Critico = 1;
                    break;
            }
        })
    })


})