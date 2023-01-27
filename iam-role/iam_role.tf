resource "aws_iam_role" "iam_role" {
    name = "${var.role_name}"
    description = "${var.role_description}"
    assume_role_policy = "${lookup(
        map(
            "lambda", data.aws_iam_policy_document.lambda_trust.json
        ), var.trust_policy_name
    )}"
}
