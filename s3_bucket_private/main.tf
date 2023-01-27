resource "aws_s3_bucket" "s3_bucket_private" {
  bucket = "${var.name}"
  acl = "private"
  region = "ap-southeast-2"

  tags {
    name = "${var.name}"
    description = "${var.description}"
  }
}
