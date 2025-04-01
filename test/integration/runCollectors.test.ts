import cds from "@sap/cds";
import nock from "nock";

const { POST, expect, axios, chai } = cds.test(__dirname + "/../..", "--with-mocks");
const requires = cds.env.requires;

describe("Action runCollectors", () => {
	beforeEach(() => {
		nock("http://127.0.0.1:8887").persist().get((uri) => uri.includes("http://ecc.dest/sap/not/fake/path/collection/srv")).reply(200, [{"tableName": "EKPO", "value": "POtest"}, {"tableName": "EPPO", "value": "POALsoATest"}]);
		nock("http://127.0.0.1:8887").persist().post((uri) => uri.includes("http://aws.dest/http/not/fake/aws/endpoint")).reply(200, "thanks");
	});
	afterEach(() => {
		nock.cleanAll();
	});

	it("updates CollectionResults with fetched values and forwards", async () => {
		const beginData = await cds.db.get("my_collection_hub_collectionresults");
		const {status, data } = await POST("/collection/runCollectors");
		const endData = await cds.db.get("my_collection_hub_collectionresults");
		expect(endData.length).to.not.equal(beginData.length)
	})

});