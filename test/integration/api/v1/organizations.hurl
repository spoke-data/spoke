GET {{protocol}}://{{host}}:{{port}}/api/v1/organizations

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.organizations" count > 0
jsonpath "$.organizations[0].name" != null
jsonpath "$.organizations[0].slug" != null
