data "aws_vpc" "test" {
   tags = {
     "ApplicationCI" = var.ApplicationCI
   }
}


output "vpc_id" {
  value = data.aws_vpc.test.id
  }
