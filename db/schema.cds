namespace my.collection.hub;

using { managed, cuid } from '@sap/cds/common';

entity DataCollectors: managed {
	key tableName	: String;
	key searchFieldName	: String;
	fieldRange: Integer;
}

entity CollectionResults : cuid, managed  {
	tableName: String;
	value: String;
	subValue1ID: String;
	subValue1Desc: String;
	subValue2ID: String;
	subValue2Desc: String;
}

annotate managed with {
	createdAt @UI.HiddenFilter: false;
}
