locals {
  sites = {
    website = {
      instances   = local.ec2_instance_ids.sites.website
      name        = "website",
      common_name = "www.website.com"
      # In demo, cert not created by Terraform
      cert_arn = "arn:aws:acm:us-east-1:355888483171:certificate/f59a285d-c84c-4fb5-8f16-ecb76ddd0b67"
      lb = {
        ## __fix : set te true
        enable_deletion_protection = false
        algorithm_type             = "least_outstanding_requests"
        access_logs                = false
        stickiness                 = false
        cookie_duration            = 1800
        port_listen_lb             = 443
        port_listen_ec2            = 443
        protocol                   = "HTTPS"
        # This cryptography goes up to 11
        ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
        health_check = {
          protocol            = "HTTPS"
          interval            = 10
          timeout             = 5
          path                = "/healthz"
          healthy_threshold   = 7
          unhealthy_threshold = 2
          matcher             = "200"
        }
      }
    }
    content-manager = {
      instances   = local.ec2_instance_ids.sites.content-manager
      name        = "content-manager"
      common_name = "content-manager.com"
      # In demo, cert not created by Terraform
      cert_arn = "arn:aws:acm:us-east-1:355888483171:certificate/469c1a14-fe3e-48c3-a647-193b0a79d645"
      lb = {
        ## __fix : set te true
        enable_deletion_protection = false
        algorithm_type             = "least_outstanding_requests"
        # __fix   bucket permission, IAM?
        #        access_logs                = true
        access_logs     = false
        stickiness      = true
        cookie_duration = 84600
        port_listen_lb  = 443
        port_listen_ec2 = 443
        protocol        = "HTTPS"
        # This cryptography goes up to 11
        ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
        health_check = {
          protocol            = "HTTPS"
          interval            = 15
          timeout             = 10
          path                = "/healthz"
          healthy_threshold   = 2
          unhealthy_threshold = 2
          matcher             = "200"
        }
      }
    }
  }
}
