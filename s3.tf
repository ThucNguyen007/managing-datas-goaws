resource "aws_s3_bucket" "serverless_spa_goaws" {
  bucket = "serverless-spa-goaws"
  acl    = "public-read"
  policy = file("all-infos/policies/s3_spa_policy.json")

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = [
      "PUT",
      "POST",
      "DELETE"
    ]
    allowed_origins = ["*"]
    expose_headers  = []
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "null_resource" "yarn_install" {
  depends_on = [

  ]

  provisioner "local-exec" {
    // interpreter = ["bash", "-c"]
    command = "cd ${path.module}/front-end && yarn install"
  }
}

resource "null_resource" "replace" {
  depends_on = [
    null_resource.yarn_install,
    aws_api_gateway_deployment.staging
  ]

  provisioner "local-exec" {
    // interpreter = ["bash", "-c"]
    command = "cd ${path.module}/front-end && sed -i \"s|staging_api|${aws_api_gateway_deployment.staging.invoke_url}|g\" .env-cmdrc"
  }
}

resource "null_resource" "yarn_build" {
  depends_on = [
    null_resource.replace
  ]

  provisioner "local-exec" {
    // interpreter = ["bash", "-c"]
    command = "cd ${path.module}/front-end && yarn build:staging"
  }
}

resource "null_resource" "upload" {
  depends_on = [
    null_resource.yarn_build,
    aws_s3_bucket.serverless_spa_goaws
  ]

  provisioner "local-exec" {
    // interpreter = ["bash", "-c"]
    command = "cd ${path.module}/front-end && aws s3 cp build s3://serverless-spa-goaws --recursive"
  }
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.serverless_spa_goaws.arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.serverless_spa_goaws.id
  policy = data.aws_iam_policy_document.s3_policy.json
}