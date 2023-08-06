GET {{protocol}}://{{host}}:{{port}}/api/v1/sidebar

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.projects" count > 0
jsonpath "$.projects[0].name" != null
jsonpath "$.projects[0].slug" != null
jsonpath "$.catalogs" count > 0
jsonpath "$.catalogs[0].name" != null
jsonpath "$.catalogs[0].slug" != null
jsonpath "$.objectStorage" count > 0
jsonpath "$.objectStorage[0].name" != null
jsonpath "$.objectStorage[0].slug" != null
jsonpath "$.connectors" count > 0
jsonpath "$.connectors[0].name" != null
jsonpath "$.connectors[0].slug" != null
jsonpath "$.components" count > 0
jsonpath "$.components[0].name" != null
jsonpath "$.components[0].uri" != null
jsonpath "$.teams" count > 0
jsonpath "$.teams[0].organization" != null
jsonpath "$.teams[0].organizationSlug" != null
jsonpath "$.teams[0].name" != null
jsonpath "$.teams[0].slug" != null
jsonpath "$.organizations" count > 0
jsonpath "$.organizations[0].name" != null
jsonpath "$.organizations[0].slug" != null
