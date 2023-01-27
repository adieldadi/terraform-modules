resource "aws_sns_topic" "user_updates" {
  name = "${var.topic_name}"

  tags {
    name = "${var.topic_name}"
    description = "${var.description}"
  }
}
