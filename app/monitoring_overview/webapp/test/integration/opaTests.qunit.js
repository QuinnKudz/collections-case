sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'my/collection/hub/monitoringoverview/test/integration/FirstJourney',
		'my/collection/hub/monitoringoverview/test/integration/pages/CollectionResultsList',
		'my/collection/hub/monitoringoverview/test/integration/pages/CollectionResultsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CollectionResultsList, CollectionResultsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('my/collection/hub/monitoringoverview') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCollectionResultsList: CollectionResultsList,
					onTheCollectionResultsObjectPage: CollectionResultsObjectPage
                }
            },
            opaJourney.run
        );
    }
);