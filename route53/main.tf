data "aws_route53_zone" "zone" {
  name = "eldadi.com."
}

resource "aws_route53_record" "cname_record" {
  zone_id = "${data.aws_route53_zone.zone.zone_id}"
  name    = "${var.r53_sub_domain}"
  type    = "CNAME"
  ttl     = 5
  records = ["${var.record_name}"]
}
