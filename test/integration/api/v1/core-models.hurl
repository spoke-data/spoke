GET {{protocol}}://{{host}}:{{port}}/api/v1/core-models

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.coreModels" count > 0
jsonpath "$.coreModels[0].name" != null
jsonpath "$.coreModels[0].slug" != null
