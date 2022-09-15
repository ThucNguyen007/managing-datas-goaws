resource "aws_lambda_function" "function_list" {
  function_name = "informations1_list"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/list.zip"
  source_code_hash = filebase64sha256("source/list.zip")
}

resource "aws_lambda_function" "function_create" {
  function_name = "informations1_create"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/create.zip"
  source_code_hash = filebase64sha256("source/create.zip")
}

resource "aws_lambda_function" "function_delete" {
  function_name = "informations1_delete"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/delete.zip"
  source_code_hash = filebase64sha256("source/delete.zip")
}

resource "aws_lambda_function" "function_get" {
  function_name = "informations1_get"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/get.zip"
  source_code_hash = filebase64sha256("source/get.zip")
}

resource "aws_lambda_function" "function_login" {
  function_name = "login"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/login.zip"
  source_code_hash = filebase64sha256("source/login.zip")

  environment {
    variables = {
      COGNITO_CLIENT_ID = aws_cognito_user_pool_client.client.id
    }
  }
}

resource "aws_lambda_function" "function_change_password" {
  function_name = "change_password"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/change-password.zip"
  source_code_hash = filebase64sha256("source/change-password.zip")

  environment {
    variables = {
      COGNITO_CLIENT_ID = aws_cognito_user_pool_client.client.id
    }
  }
}

resource "aws_lambda_permission" "apigw_list_staging" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_list.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_alias" "fuaws_api_gateway_deploymentnction_list_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.function_list.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "apigw_list_production" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.function_list.function_name}:production"
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_get_staging" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_get.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_alias" "fuaws_api_gateway_deploymentnction_get_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.function_get.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "apigw_get_production" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.function_get.function_name}:production"
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_create_staging" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_create.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_alias" "fuaws_api_gateway_deploymentnction_create_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.function_create.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "apigw_create_production" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.function_create.function_name}:production"
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_delete_staging" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_delete.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_alias" "fuaws_api_gateway_deploymentnction_delete_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.function_delete.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "apigw_delete_production" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.function_delete.function_name}:production"
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_login_staging" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_login.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_alias" "fuaws_api_gateway_deploymentnction_login_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.function_login.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "apigw_login_production" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.function_login.function_name}:production"
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_permission" "apigw_change_password_staging" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function_change_password.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

resource "aws_lambda_alias" "fuaws_api_gateway_deploymentnction_change_password_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.function_change_password.arn
  function_version = "$LATEST"
}

resource "aws_lambda_permission" "apigw_change_password_production" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.function_change_password.function_name}:production"
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.informations1.execution_arn}/*/*"
}

