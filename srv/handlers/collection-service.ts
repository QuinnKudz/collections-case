import cds from "@sap/cds";
import * as collectionModel from "../../@cds-models/CollectionService";
export default cds.service.impl(async function() {
	
	const metricSrv: cds.RemoteService = await cds.connect.to("aws_metri_srv");
	const eccSrv: cds.RemoteService = await cds.connect.to("collector_ecc_srv");
	

	this.on(collectionModel.runCollectors, async (req: cds.Request) => {
		const collectors = await cds.db.get("my_collection_hub_datacollectors") as collectionModel.DataCollectors;
		const collectorCalls: Promise<any>[] = [];
		collectors.forEach(collector => {
			const path = !!collector.fieldRange ? `GetCollector(table='${collector.tableName}',searchField='${collector.searchFieldName}',range='${collector.fieldRange}')` : `GetCollector(table='${collector.tableName}',searchField='${collector.searchFieldName}')`;
			collectorCalls.push(eccSrv.send({
				method: "GET",
				path: path
			}));
		});
		collectorCalls.forEach( async collectorCall => {
			await collectorCall as Array<Object>;
		});
		const flatCollections = collectorCalls.flat();
		await DELETE.from('CollectionResults');
		await INSERT.into ('CollectionResults').entries(
			flatCollections
		);
		await metricSrv.send({
			method: "POST",
			path: "/",
			data: flatCollections
		});
	});

	this.on(collectionModel.forwardCollection, async (req: cds.Request) => {
		const results = await cds.db.get("my_collection_hub_collectionresults") as collectionModel.CollectionResults;
		await metricSrv.send({
			method: "POST",
			path: "/",
			data: results
		});

	});
});