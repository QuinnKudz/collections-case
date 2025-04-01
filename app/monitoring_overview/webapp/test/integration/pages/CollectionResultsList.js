sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'my.collection.hub.monitoringoverview',
            componentId: 'CollectionResultsList',
            contextPath: '/CollectionResults'
        },
        CustomPageDefinitions
    );
});