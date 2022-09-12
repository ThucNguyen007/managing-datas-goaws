resource "aws_api_gateway_method" "informations_list" {
  rest_api_id   = aws_api_gateway_rest_api.informations.id
  resource_id   = aws_api_gateway_resource.informations.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "informations_create" {
  rest_api_id   = aws_api_gateway_rest_api.informations.id
  resource_id   = aws_api_gateway_resource.informations.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "informations_delete" {
  rest_api_id   = aws_api_gateway_rest_api.informations.id
  resource_id   = aws_api_gateway_resource.informations.id
  http_method   = "DELETE"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "informations_get" {
  rest_api_id   = aws_api_gateway_rest_api.informations.id
  resource_id   = aws_api_gateway_resource.informations_id.id
  http_method   = "GET"
  authorization = "NONE"
}