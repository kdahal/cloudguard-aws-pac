resource "aws_lambda_function" "auto_remediate" {
  function_name = "autoRemediateS3"
  handler       = "auto_remediate.lambda_handler"
  runtime       = "python3.9"
  filename      = "../lambda/auto_remediate.zip"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_remediation_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
