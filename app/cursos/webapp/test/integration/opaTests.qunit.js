sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cursos/test/integration/FirstJourney',
		'cursos/test/integration/pages/CursosList',
		'cursos/test/integration/pages/CursosObjectPage'
    ],
    function(JourneyRunner, opaJourney, CursosList, CursosObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cursos') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCursosList: CursosList,
					onTheCursosObjectPage: CursosObjectPage
                }
            },
            opaJourney.run
        );
    }
);