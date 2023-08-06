GET {{protocol}}://{{host}}:{{port}}/api/v1/components

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.components" count > 0
jsonpath "$.components[0].name" != null
jsonpath "$.components[0].slug" != null
