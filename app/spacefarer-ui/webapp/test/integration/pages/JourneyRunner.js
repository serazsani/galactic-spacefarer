sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"galactic/spacefarer/spacefarerui/test/integration/pages/SpacefarersList.gen",
	"galactic/spacefarer/spacefarerui/test/integration/pages/SpacefarersObjectPage.gen"
], function (JourneyRunner, SpacefarersListGenerated, SpacefarersObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('galactic/spacefarer/spacefarerui') + '/test/flpSandbox.html#galacticspacefarerspacefarerui-tile',
        pages: {
			onTheSpacefarersListGenerated: SpacefarersListGenerated,
			onTheSpacefarersObjectPageGenerated: SpacefarersObjectPageGenerated
        },
        async: true
    });

    return runner;
});

