data "aws_iam_policy_document" "polly_lambda_access_policy" {
    statement {
            sid = "Perm1"
            effect =  "Allow"

            actions = [
                "polly:SynthesizeSpeech",
                "s3:GetBucketLocation",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
            ]
            resources =  ["*"]
        }

    statement {
            sid = "Perm2"
            effect = "Allow"

            actions = [
                "dynamodb:Query",
                "dynamodb:Scan",
                "dynamodb:PutItem",
                "dynamodb:UpdateItem",

            ]
            resources = ["arn:aws:dynamodb:ap-southeast-2:055042774976:table/${var.polly_ddb_table_name}"]
        }

    statement {
            sid = "Perm3"
            effect =  "Allow"
            
            actions = [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetBucketLocation",
            ]
            resources = ["arn:aws:s3:::${var.audiostorage_bucket_name}/*"]
        }

    statement {
            sid = "Perm4"
            effect = "Allow"
            actions =  [
                "sns:Publish"
            ]
            resources = ["${var.sns_topic_new_posts_arn}"]   
        }
    
}
