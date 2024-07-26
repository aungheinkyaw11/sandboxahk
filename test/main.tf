resource "aws_instance" "multiec2" {
    count = length(var.instance_name)
    ami = "ami-0ad21ae1d0696ad58"
    instance_type = "t2.micro"
    tags = {
      Name = var.instance_name[count.index]
    }
}
