# terraform_route53_alias

Terraform module to create Route53 aliases, needed for CNAME record for top level domain

## Variables

``` terraform
# name: the name of the route 53 record
variable "example_org" { default = "example.org" }

zone_id: the id of the zone
endpoint: dns name of the endpoint
endpoint_zone: the zone id of the endpoint
```

## Dependency

Route53 <https://github.com/virsas/terraform_route53>

In this example I will use Application loadbalancer. But you can use Cloudfront or S3 instead.
ALB <https://github.com/virsas/terraform_alb>

## Terraform example

``` terraform
######################
# Route 53 aliases variables
######################
variable "example_org" { default = "example.org" }

######################
# Route 53 aliases
######################
module "virsas_com_endpoint" {
  source        = "github.com/virsas/terraform_route53_alias"
  zone_id       = module.virsas_com_route53.zone_id
  name          = var.example_org
  endpoint      = module.alb_virsas.dns_name
  endpoint_zone = module.alb_virsas.zone_id
}
```
