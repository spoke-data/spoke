GET {{protocol}}://{{host}}:{{port}}/api/v1/sidebar

HTTP 200
# Content-Type: application/json; charset=utf-8
[Asserts]
# header "Content-Type" contains "utf-8"
jsonpath "$.projects" count > 0
jsonpath "$.projects[0].name" != null
jsonpath "$.projects[0].slug" != null
jsonpath "$.catalogs" count > 0
jsonpath "$.catalogs[0].name" != null
jsonpath "$.catalogs[0].slug" != null
jsonpath "$.storage" count > 0
jsonpath "$.storage[0].name" != null
jsonpath "$.storage[0].slug" != null
jsonpath "$.connectors" count > 0
jsonpath "$.connectors[0].name" != null
jsonpath "$.connectors[0].slug" != null
jsonpath "$.components" count > 0
jsonpath "$.components[0].name" != null
jsonpath "$.components[0].uri" != null
jsonpath "$.teams" count > 0
jsonpath "$.teams[0].organization" != null
jsonpath "$.teams[0].name" != null
jsonpath "$.teams[0].uri" != null
jsonpath "$.organizations" count > 0
jsonpath "$.organizations[0].name" != null
jsonpath "$.organizations[0].slug" != null
