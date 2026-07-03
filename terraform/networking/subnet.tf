data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {

  count = 3

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

  tags = {

    Name = "public-subnet-${count.index+1}"

    "kubernetes.io/role/elb" = "1"

  }

}

resource "aws_subnet" "private" {

  count = 3

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnets[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {

    Name = "private-subnet-${count.index+1}"

    "kubernetes.io/role/internal-elb" = "1"

  }

}
