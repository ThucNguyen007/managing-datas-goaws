provider "aws" {
  region = "us-east-1"
}

resource "aws_api_gateway_rest_api" "informations" {
  name = "informations-api"
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.informations_list,
    aws_api_gateway_integration.informations_create,
    aws_api_gateway_integration.informations_delete,
    aws_api_gateway_integration.informations_get,
  ]

  rest_api_id = aws_api_gateway_rest_api.informations.id
  stage_name  = "staging"
}

output "base_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}
