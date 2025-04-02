# Getting Started

Welcome

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide

## Assumptions
- The destination collector_ECC_SRV and it's enpoint GetCollector() is a hypothetical ECC function/servie designed to take a table, seatch field and optional range and return an array of objects that fit in the CollectionResults table by calling collectors
- The destination aws_metri_srv will recieve the batch job execution data
- SAP Job Scheduling Service on the BTP will be used to trigger runCollectors every x amount of minutes/hours


## Scripts

- "start": start the cap project,
- "watch": start the cap project and watch for changes,
- "test": run automated tests... if it worked,
- "watch-monitoring_overview": runs ui app,
- "build": builds mta,
- "deploy": deploys to targeted cf subaccount/space
- "undeploy": undeploys from targeted cf subaccount/space
