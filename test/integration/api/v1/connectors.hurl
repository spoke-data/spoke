GET {{protocol}}://{{host}}:{{port}}/api/v1/connectors

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.connectors" count > 0
jsonpath "$.connectors[0].name" != null
jsonpath "$.connectors[0].slug" != null
