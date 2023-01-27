data "aws_iam_policy_document" "lambda_trust" {
    statement {
      sid = "LambdaTrustPolicy"
      effect = "Allow"
      actions = ["sts:AssumeRole"]

      principals {
        type = "Service"
        identifiers = ["lambda.amazonaws.com"]
      }
    }
}
