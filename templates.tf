#Web template definition with DB address variable
data "template_file" "initweb" {
  template = "${file("templates/initweb.tpl")}"

  vars = {
    database_address = "${aws_instance.database.private_ip}"
  }
}

# DB template definition
data "template_file" "initdb" {
  template = "${file("templates/initdb.tpl")}"
}
