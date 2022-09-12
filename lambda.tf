resource "aws_lambda_function" "function_list" {
  function_name = "informations_list"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/list.zip"
  source_code_hash = filebase64sha256("source/list.zip")
}

resource "aws_lambda_function" "function_create" {
  function_name = "informations_create"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/create.zip"
  source_code_hash = filebase64sha256("source/create.zip")
}

resource "aws_lambda_function" "function_delete" {
  function_name = "informations_delete"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/delete.zip"
  source_code_hash = filebase64sha256("source/delete.zip")
}

resource "aws_lambda_function" "function_get" {
  function_name = "informations_get"
  role          = aws_iam_role.lambda_role.arn
  handler       = "main"
  runtime       = "go1.x"

  filename         = "source/get.zip"
  source_code_hash = filebase64sha256("source/get.zip")
}