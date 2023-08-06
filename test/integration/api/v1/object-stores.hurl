GET {{protocol}}://{{host}}:{{port}}/api/v1/object-stores

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.objectStores" count > 0
jsonpath "$.objectStores[0].name" != null
jsonpath "$.objectStores[0].slug" != null
