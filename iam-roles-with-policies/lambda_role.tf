module "lambda_role" {
    source = "../iam-role"
    role_name = "${var.lambda_role_name}"
    role_description = "${var.lambda_role_description}"
    trust_policy_name = "lambda"
}

resource "aws_iam_policy" "polly_lambda_access" {
    name = "${var.polly_lambda_access_policy_name}"
    description = "${var.polly_lambda_access_policy_description}"
    policy = "${data.aws_iam_policy_document.polly_lambda_access_policy.json}"
}

resource "aws_iam_role_policy_attachment" "attach_polly_lambda_access" {
    role = "${module.lambda_role.role_name}"
    policy_arn = "${aws_iam_policy.polly_lambda_access.arn}"
}
