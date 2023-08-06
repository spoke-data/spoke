GET {{protocol}}://{{host}}:{{port}}/api/v1/catalogs

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.catalogs" count > 0
jsonpath "$.catalogs[0].name" != null
jsonpath "$.catalogs[0].slug" != null
