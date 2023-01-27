resource "aws_lambda_function" "lambda_function" {
    function_name = "${var.function_name}"
    role = "${var.role}"
    runtime = "${var.runtime}"
    handler = "${var.handler}" 
    timeout = "${var.timeout}"
    filename = "${lookup(
        map(
            "newposts", data.archive_file.newposts_lambda_package.output_path,
            "text2audio", data.archive_file.text2audio_lambda_package.output_path,
            "getpostsinfo", data.archive_file.getpostsinfo_lambda_package.output_path,
    ), var.lambda_script_name)}"
    source_code_hash = "${lookup(
        map(
            "newposts", data.archive_file.newposts_lambda_package.output_base64sha256,
            "text2audio", data.archive_file.text2audio_lambda_package.output_base64sha256,
            "getpostsinfo", data.archive_file.getpostsinfo_lambda_package.output_path,
    ), var.lambda_script_name)}"
    
    environment {
      variables {
        lambda_sns_topic_arn = "${var.lambda_sns_topic_arn}"
        lambda_ddb_table_name = "${var.lambda_ddb_table_name}"
        lambda_audiostorage_bucket_name = "${var.lambda_audiostorage_bucket_name}"
      }
    }

}


