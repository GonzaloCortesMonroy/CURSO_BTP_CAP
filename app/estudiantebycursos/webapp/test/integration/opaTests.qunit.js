sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'estudiantebycursos/test/integration/FirstJourney',
		'estudiantebycursos/test/integration/pages/EstudiantesByCursosList',
		'estudiantebycursos/test/integration/pages/EstudiantesByCursosObjectPage'
    ],
    function(JourneyRunner, opaJourney, EstudiantesByCursosList, EstudiantesByCursosObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('estudiantebycursos') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEstudiantesByCursosList: EstudiantesByCursosList,
					onTheEstudiantesByCursosObjectPage: EstudiantesByCursosObjectPage
                }
            },
            opaJourney.run
        );
    }
);