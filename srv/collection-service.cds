using my.collection.hub as CH from '../db/schema';

service CollectionService @(path: '/collection', requires: ['CollectionViewer', 'CollectionAmin', 'system-user'])  {

    @readonly
	entity CollectionResults as projection on CH.CollectionResults;

	@readonly
	entity PurchasingDocResults as select from CH.CollectionResults {
		ID,
		value as documnetNumber,
		subValue1ID as purchasingDocumentCategory ,
		subValue2ID as purchasingDocumentStatus
	} where CollectionResults.tableName = 'EKKO';

	@(restrict: [
		{ grant: 'READ', to: ['CollectionViewer', 'system-user'] },
		{ grant: '*', to: 'CollectionAdmin' }
	])
	entity DataCollectors as projection on CH.DataCollectors;

	@(restrict: [
		{ grant: '*', to: 'CollectionAdmin' }
	])
	action runCollectors();

	@(restrict: [
		{ grant: '*', to: 'CollectionAdmin' }
	])
	action forwardCollection();
}
