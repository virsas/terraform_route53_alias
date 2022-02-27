resource "aws_route53_record" "alias" {

  zone_id = var.zone_id
  name    = var.name
  type    = var.type

  alias {
    name                   = var.endpoint
    zone_id                = var.endpoint_zone
    evaluate_target_health = var.health
  }
}