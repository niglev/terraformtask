# DB template definition
data "template_file" "initdb" {
  template = "${file("templates/initdb.tpl")}"
}
