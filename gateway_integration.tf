resource "aws_api_gateway_integration" "informations_list" {
  rest_api_id = aws_api_gateway_rest_api.informations.id
  resource_id = aws_api_gateway_resource.informations.id
  http_method = aws_api_gateway_method.informations_list.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.function_list.invoke_arn
}

resource "aws_api_gateway_integration" "informations_create" {
  rest_api_id = aws_api_gateway_rest_api.informations.id
  resource_id = aws_api_gateway_resource.informations.id
  http_method = aws_api_gateway_method.informations_create.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.function_create.invoke_arn
}

resource "aws_api_gateway_integration" "informations_delete" {
  rest_api_id = aws_api_gateway_rest_api.informations.id
  resource_id = aws_api_gateway_resource.informations.id
  http_method = aws_api_gateway_method.informations_delete.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.function_delete.invoke_arn
}

resource "aws_api_gateway_integration" "informations_get" {
  rest_api_id = aws_api_gateway_rest_api.informations.id
  resource_id = aws_api_gateway_resource.informations_id.id
  http_method = aws_api_gateway_method.informations_get.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.function_get.invoke_arn
}
