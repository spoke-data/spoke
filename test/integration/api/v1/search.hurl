GET {{protocol}}://{{host}}:{{port}}/api/v1/search?q=sports

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.results" != null
jsonpath "$.results.projects" count > 0
jsonpath "$.results.projects.[0].name" != null
jsonpath "$.results.projects.[0].slug" != null
jsonpath "$.results.catalogs" count == 0
jsonpath "$.results.objectStores" count == 0
jsonpath "$.results.connectors" count == 0
jsonpath "$.results.components" count == 0
jsonpath "$.results.coreModels" count == 0
jsonpath "$.results.teams" count == 0
jsonpath "$.results.organizations" count == 0
