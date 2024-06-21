provider "aws" {
  region = "us-east-1"
}

module "aws_vpc" {
  source = "../module/aws_vpc"
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  name = "vpc"
}

module "aws_subnet" {
  source = "../module/aws_subnet"
  vpc_id = module.aws_vpc.vpc_id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  name = "10.0.2.0 - us-east-1a"
}

module "aws_ig" {
  source = "../module/aws_ig"
  vpc_id = module.aws_vpc.vpc_id
  name = "ig_internet"
}

module "aws_route_table" {
  source = "../module/aws_route_table"
  vpc_id = module.aws_vpc.vpc_id
  gateway_id = module.aws_ig.ig_id
  cidr_block = "0.0.0.0/0"
  name = "rt_internet"
}

module "aws_route_table_association" {
  source = "../module/aws_rt_association"
  subnet_id = module.aws_subnet.subnet_id
  route_table_id = module.aws_route_table.rt_id
}

module "aws_security_group" {
  source = "../module/aws_security_group"
  vpc_id = module.aws_vpc.vpc_id
  name = "sg_custom"
}
module "aws_ec2" {
  source = "../module/aws_ec2"
  ami = "ami-07caf09b362be10b8"
  instance_type = "t2.micro"
  subnet_id = module.aws_subnet.subnet_id
  vpc_security_group_ids = [module.aws_security_group.sg_id]
  key_name = "mainkey"
  name = "ec2-worker0"
}

module "aws_eip" {
  source = "../module/aws_eip"
  ig_name = module.aws_ig.name
}

module "aws_nat_gateway" {
  source = "../module/aws_nat_gateway"
  allocation_id = module.aws_eip.eip_id
  subnet_id = module.aws_subnet.subnet_id
  ig_name = module.aws_ig.name
  name = "NAT 1"
}

module "aws_s3_bucket" {
  source = "../module/aws_s3"
  bucket = "bucket"
  name_tag = "custom_bucket"
  environment = "Dev"
}

module "aws_rds" {
  source = "../module/aws_rds"
  allocated_storage = 10
  db_name = "my_db"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  parameter_group_name = "default.mysql8.0"
  username = "tannd"
  password = "Tan12345"
}

module "aws_kms" {
  source = "../modules/aws_kms"
  kms_key_id                       = "494abfbe-6d50-48e4-beae-dac96a1a9ee1"
  kms_key_arn                      = "arn:aws:kms:us-east-1:992382486985:key/f28c53bb-dd5b-4e59-8df5-c9da3d41955c"

  description             = "Complete key showing various configurations available"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false

  key_owners             = ["arn:aws:kms:us-east-1:992382486985:key/f28c53bb-dd5b-4e59-8df5-c9da3d41955c:role/owner"]
  key_administrators     = ["arn:aws:kms:us-east-1:992382486985:key/f28c53bb-dd5b-4e59-8df5-c9da3d41955c:role/admin"]
  key_users              = ["arn:aws:kms:us-east-1:992382486985:key/f28c53bb-dd5b-4e59-8df5-c9da3d41955c:role/user"]
  key_service_users      = ["arn:aws:kms:us-east-1:992382486985:key/f28c53bb-dd5b-4e59-8df5-c9da3d41955c:role/ec2-role"]

  aliases = ["one", "foo/bar"]
  computed_aliases = {
    ex = {
      name = "keykms"
    }
  }
  aliases_use_name_prefix = true

  grants = {
    lambda = {
      grantee_principal = "arn:aws:kms:us-east-1:992382486985:key/f28c53bb-dd5b-4e59-8df5-c9da3d41955c:role/lambda-function"
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
      constraints = {
        encryption_context_equals = {
          Department = "Finance"
        }
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
