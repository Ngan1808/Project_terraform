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