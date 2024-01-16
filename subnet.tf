variable "Apptier_subnet1_tag" {
  type    = string
  default = "Apptier-us-east-1a-subnet-01"
}

variable "Apptier_subnet2_tag" {
  type    = string
  default = "Apptier-us-east-1b-subnet-02"
}

variable "Apptier_subnet3_tag" {
  type    = string
  default = "Apptier-us-east-1c-subnet-03"
}
# output "vpc_id" {
#   value = data.aws_vpc.vpc.id
#   }



  # data "aws_availability_zones" "available" {}
  #
  # output "availability_zones" {
  #   value = data.aws_availability_zones.available.names
  # }

# resource "aws_instance" "myec2" {
#     ami = "ami-0759f51a90924c166"
#     instance_type = "t2.micro"
#     vpc_security_group_ids = [data.aws_security_group.test.id]
# }


# data "aws_subnet" "selected_subnets" {
#   for_each = {
#     "subnet_id_1" = "subnet-0c23552e43a07aefb",
#     "subnet_id_2" = "subnet-0b09af3b18293a547",
#     "subnet_id_3" = "subnet-090461cdd25f295ed",
#   }
#
#   id = each.value
# }
#
# output "subnet_azs" {
#   value = {
#     for subnet_id, subnet_info in data.aws_subnet.selected_subnets :
#     subnet_id => subnet_info.availability_zone
#   }
# }


# data "aws_subnet_ids" "selected_subnets" {
#   vpc_id = "data.aws_vpc.vpc.id"  # Specify your VPC ID here
# }
# data "aws_subnet_ids" "all_subnets" {
#   vpc_id = data.aws_vpc.vpc.id # Specify your VPC ID here
# }

data "aws_subnet" "Apptier_subnet_1" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = [var.Apptier_subnet1_tag]
  }
}

data "aws_subnet" "Apptier_subnet_2" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = [var.Apptier_subnet2_tag]
  }
}

data "aws_subnet" "Apptier_subnet_3" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = [var.Apptier_subnet3_tag]
  }
}

output "Apptier_subnet_1" {
  value = data.aws_subnet.Apptier_subnet_1.id
}

output "Apptier_subnet_2" {
  value = data.aws_subnet.Apptier_subnet_2.id
}

output "Apptier_subnet_3" {
  value = data.aws_subnet.Apptier_subnet_3.id
}

output "Apptier_subnet_1_AZ" {
  value = data.aws_subnet.Apptier_subnet_1.availability_zone
}

output "Apptier_subnet_2_AZ" {
  value = data.aws_subnet.Apptier_subnet_2.availability_zone
}

output "Apptier_subnet_3_AZ" {
  value = data.aws_subnet.Apptier_subnet_3.availability_zone
}

output "subnets" {
  value = [data.aws_subnet.Apptier_subnet_1.id,data.aws_subnet.Apptier_subnet_2.id,data.aws_subnet.Apptier_subnet_3.id]
}

output "AZs" {
  value = [data.aws_subnet.Apptier_subnet_1.availability_zone,data.aws_subnet.Apptier_subnet_2.availability_zone,data.aws_subnet.Apptier_subnet_3.availability_zone]
}

locals {
  subnet_ids = [data.aws_subnet.Apptier_subnet_1.id,data.aws_subnet.Apptier_subnet_2.id,data.aws_subnet.Apptier_subnet_3.id]
  availability_zones = [data.aws_subnet.Apptier_subnet_1.availability_zone,data.aws_subnet.Apptier_subnet_2.availability_zone,data.aws_subnet.Apptier_subnet_3.availability_zone]
}

output "test" {
  value = zipmap(local.availability_zones,local.subnet_ids)
}
