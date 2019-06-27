data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name      = "taskkey"
  subnet_id     = "${aws_subnet.private-subnet.id}"
  user_data     = "${data.template_file.initweb.rendered}"

  security_groups = [
    "${aws_security_group.sgweb.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "16"
    delete_on_termination = true
  }

  tags {
    Name = "webserver"
  }
}

resource "aws_instance" "database" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name      = "taskkey"
  subnet_id     = "${aws_subnet.private-subnet.id}"
  user_data     = "${data.template_file.initdb.rendered}"

  security_groups = [
    "${aws_security_group.sgdb.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "16"
    delete_on_termination = true
  }

  tags {
    Name = "database"
  }
}

