output "record_name" {
    value = "${aws_route53_record.cname_record.name}"
}

output "record_fqdn" {
    value = "${aws_route53_record.cname_record.fqdn}"
}
