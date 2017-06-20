resource "aws_instance" "web" {
    ami = "${lookup(var.instance_amis, var.aws_region)}"
    instance_type = "${var.instance_type}"
    key_name = "${var.instance_key_name}"
    count = "${var.servers}"
    security_groups = ["${aws_security_group.web.name}"]
    tags {
        Name = "${var.project_name}-web${count.index}"
        Maintainer = "${var.project_maintainer}"
        Project = "${var.project_name}"
    }

}

resource "aws_security_group" "web" {
    name = "${var.project_name}-${var.service_name}"
    description = "${var.service_name} security settings"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "${var.project_name}-${var.service_name}"
        Maintainer = "${var.project_maintainer}"
        Project = "${var.project_name}"
    }
}
