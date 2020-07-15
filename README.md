## Synopsis
Terraform configuratino for diagram.png
See `insertCredentials_.bash`

## Stateful Services
`blue` is a stateful instance identifier for `blue` / `green` 

## TODO:
- modularize elasticache and rds
- attachment groups for `morty` instances and `internal_lb`
- move `public_albs/local.sites_.tf` to `vars_sites.tf`
- Outbound network traffic filters, Network ACLs
- Secrets templatizing with Cloud KMS and Hashicorp Vault.
- Add EC2 instances with MariaDB, tcp, and curl probe scripts.
- Add CloudFront and S3 custom error pages bucket
- Add IAM
- Continuous monitoring of these Terraform configurations with Zabbix
