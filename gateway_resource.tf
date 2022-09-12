resource "aws_api_gateway_resource" "informations" {
  rest_api_id = aws_api_gateway_rest_api.informations.id
  parent_id   = aws_api_gateway_rest_api.informations.root_resource_id
  path_part   = "informations"
}

resource "aws_api_gateway_resource" "informations_id" {
  rest_api_id = aws_api_gateway_rest_api.informations.id
  parent_id   = aws_api_gateway_resource.informations.id
  path_part   = "{id}"
}