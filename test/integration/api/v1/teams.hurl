GET {{protocol}}://{{host}}:{{port}}/api/v1/teams

HTTP 200
Content-Type: application/json
[Asserts]
header "Access-Control-Allow-Origin" contains "*"
header "Content-Type" contains "application/json"
jsonpath "$.teams" count > 0
jsonpath "$.teams[0].name" != null
jsonpath "$.teams[0].slug" != null
jsonpath "$.teams[0].organizationName" != null
jsonpath "$.teams[0].organizationSlug" != null
