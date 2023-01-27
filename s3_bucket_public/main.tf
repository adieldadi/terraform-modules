resource "aws_s3_bucket" "s3_bucket_website" {
  bucket      = "${var.name}"
  acl = "${var.acl_website}"
  policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [{
		"Sid": "PublicReaderGetObject",
		"Effect": "Allow",
		"Principal": "*",
		"Action": [
			"s3:GetObject"
		],
		"Resource": [
			"arn:aws:s3:::${var.name}/*"
		]
	}]
}
  POLICY
  region = "ap-southeast-2"

   website {
    index_document = "index.html"
    error_document = "error.html"
   }

   tags {
    name = "${var.name}"
    description = "${var.description}"
  }
}
