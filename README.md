## Synopsis
Terraform configuratino for diagram.png
See `insertCredentials_.bash`

## Security Groups
The assumption is that every EC2 instance or stateful service explicitly allows certain ports providing access to attached security groups specified with  `ingress_rules[*].security_group_source_names[*]`.
Network ACLs are to prevent unexpected traffic from leaving the VPC.


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
