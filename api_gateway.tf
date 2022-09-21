resource "aws_api_gateway_rest_api" "informations1" {
  name = "informations1-api"

  binary_media_types = [
    "multipart/form-data",
    "*/*"
  ]
}

///////////////////////////// Gateway Resources ///////////////////////////////////////////

resource "aws_api_gateway_resource" "informations1" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  parent_id   = aws_api_gateway_rest_api.informations1.root_resource_id
  path_part   = "informations1"
}

resource "aws_api_gateway_resource" "informations1_id" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  parent_id   = aws_api_gateway_resource.informations1.id
  path_part   = "{id}"
}

resource "aws_api_gateway_resource" "login" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  parent_id   = aws_api_gateway_rest_api.informations1.root_resource_id
  path_part   = "login"
}

resource "aws_api_gateway_resource" "change_password" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  parent_id   = aws_api_gateway_rest_api.informations1.root_resource_id
  path_part   = "change-password"
}

resource "aws_api_gateway_authorizer" "this" {
  name          = "CognitoUserPoolAuthorizer"
  type          = "COGNITO_USER_POOLS"
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  provider_arns = [aws_cognito_user_pool.user.arn]
}

////////////////////////////   Gateway Methods    //////////////////////////////////////////////

resource "aws_api_gateway_method" "login" {
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  resource_id   = aws_api_gateway_resource.login.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "change_password" {
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  resource_id   = aws_api_gateway_resource.change_password.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "informations1_create" {
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  resource_id   = aws_api_gateway_resource.informations1.id
  http_method   = "POST"
  authorization = "COGNITO_USER_POOLS"
  authorizer_id = aws_api_gateway_authorizer.this.id

  request_parameters = {
    "method.request.header.Accept"       = false,
    "method.request.header.Content-Type" = false,
  }
}

resource "aws_api_gateway_method" "informations1_list" {
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  resource_id   = aws_api_gateway_resource.informations1.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "informations1_get" {
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  resource_id   = aws_api_gateway_resource.informations1_id.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "informations1_delete" {
  rest_api_id   = aws_api_gateway_rest_api.informations1.id
  resource_id   = aws_api_gateway_resource.informations1.id
  http_method   = "DELETE"
  authorization = "NONE"
}

//////////////////////////// Gateway Integrations //////////////////////////////////////////////

resource "aws_api_gateway_integration" "login" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  resource_id = aws_api_gateway_resource.login.id
  http_method = aws_api_gateway_method.login.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.lambda}/invocations"
}

resource "aws_api_gateway_integration" "change_password" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  resource_id = aws_api_gateway_resource.change_password.id
  http_method = aws_api_gateway_method.change_password.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.lambda}/invocations"
}

resource "aws_api_gateway_integration" "informations1_list" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  resource_id = aws_api_gateway_resource.informations1.id
  http_method = aws_api_gateway_method.informations1_list.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.lambda}/invocations"
}

resource "aws_api_gateway_integration" "informations1_get" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  resource_id = aws_api_gateway_resource.informations1_id.id
  http_method = aws_api_gateway_method.informations1_get.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.lambda}/invocations"
}

resource "aws_api_gateway_integration" "informations1_create" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  resource_id = aws_api_gateway_resource.informations1.id
  http_method = aws_api_gateway_method.informations1_create.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.lambda}/invocations"
}


resource "aws_api_gateway_integration" "informations1_delete" {
  rest_api_id = aws_api_gateway_rest_api.informations1.id
  resource_id = aws_api_gateway_resource.informations1.id
  http_method = aws_api_gateway_method.informations1_delete.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${data.aws_caller_identity.current.account_id}:function:$${stageVariables.lambda}/invocations"
}

////////////////////////////////////// "Staging" Gateway deployment /////////////////////////////////////////////////////////////


resource "aws_api_gateway_deployment" "staging" {
  depends_on = [
    aws_api_gateway_integration.login,
    aws_api_gateway_integration.change_password,
    aws_api_gateway_integration.informations1_create,
    aws_api_gateway_integration.informations1_list,
    aws_api_gateway_integration.informations1_get,
    aws_api_gateway_integration.informations1_delete,
  ]

  rest_api_id = aws_api_gateway_rest_api.informations1.id
  stage_name  = "staging"
  variables = {
    lambda : "login",
    lambda : "change_password",
    lambda : "informations1_create",
    lambda : "informations1_list",
    lambda : "informations1_get",
    lambda : "informations1_delete"
  }
}

/////////////////////////////////////// "Production" Gateway deployment ///////////////////////////////////////////////////////////   

resource "aws_api_gateway_deployment" "production" {
  depends_on = [
    aws_api_gateway_integration.login,
    aws_api_gateway_integration.change_password,
    aws_api_gateway_integration.informations1_create,
    aws_api_gateway_integration.informations1_list,
    aws_api_gateway_integration.informations1_get,
    aws_api_gateway_integration.informations1_delete,
  ]

  rest_api_id = aws_api_gateway_rest_api.informations1.id
  stage_name  = "production"
  variables = {
    lambda : "login:production",
    lambda : "change_password:production",
    lambda : "informations1_create:production",
    lambda : "informations1_list:production",
    lambda : "informations1_get:production",
    lambda : "informations1_delete:production"
  }
}