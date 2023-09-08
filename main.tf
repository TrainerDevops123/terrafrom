provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3JEROJNH6JPLOFJN"
  secret_key = "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"
}

resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
}

/*
data "aws_vpc" "foo" {
	provider = aws.east
	default  = true
}
*/

module "webserver" {
	source        = "./modules"
	name          = "tuts-webserver"
	vpc_id        = aws_vpc.main.id
	cidr_block    = cidrsubnet(aws_vpc.main.cidr_block, 4, 1)
	ami           = "ami-003634241a8fcdec0"
	instance_type = "t2.micro"
}

