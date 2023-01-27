output "ddb_table_name" {
    value = "${aws_dynamodb_table.ddb_table.name}"
}

output "ddb_table_arn" {
    value = "${aws_dynamodb_table.ddb_table.arn}"
}
