resource "aws_lambda_function" "monitor" {
  function_name    = var.name
  handler          = format("%s.%s", var.name, "exec")
  role             = var.role_arn
  runtime          = "ruby2.5"
  filename         = data.archive_file.function.output_path
  source_code_hash = data.archive_file.function.output_base64sha256

  environment {
    variables = {
      MACKEREL_API_KEY  = var.mackerel_api_key
      SLACK_WEBHOOK_URL = var.slack_webhook_url
    }
  }
}

data "archive_file" "function" {
  type        = "zip"
  source_dir  = "function"
  output_path = "script.zip"
}
