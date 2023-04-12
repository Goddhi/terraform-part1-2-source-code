region = "us-east-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "Production"

ami = "ami-0aa2b7722dc1b5612"

keypair = "aws-key-pair"

master-username = "goddhigoddhi"

master-password = "godhigodhi1234"

tags = {
  Owner-Email = "goodhi@gmail.comm"
  managed-by = "Terraform"
  Billing-Account = "123456789"
}

