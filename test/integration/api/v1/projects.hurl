GET {{protocol}}://{{host}}:{{port}}/api/v1/projects

HTTP 200
Content-Type: application/json
[Asserts]
header "Content-Type" contains "application/json"
jsonpath "$.environments" count > 0
jsonpath "$.environments[0].name" != null
jsonpath "$.environments[0].slug" != null
jsonpath "$.environments[0].projects" count > 0
jsonpath "$.environments[0].projects[0].name" != null
jsonpath "$.environments[0].projects[0].slug" != null
