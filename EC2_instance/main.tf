locals {
  # Common tags to be assigned to all resources
  common_tags = {
    iiName = "HelloWorldsushmita"
    Env   = "Prod"
    Project = "ABC"
    Dept = "Eng"
  }
}

#data "aws_ami" "ubuntu" {
 # most_recent = true

  #filter {
   # name   = "name"
    #values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  #}

  #filter {
   # name   = "virtualization-type"
    #values = ["hvm"]
  #}

  #owners = ["099720109477"] # Canonical
#}
 data "aws_ami" "rhel9" {
 most_recent = true

 filter {
   name   = "name"
   values = ["RHEL-9*-x86_64-*"]  # Filter for RHEL 9 images
 }

 filter {
   name   = "virtualization-type"
   values = ["hvm"]
 }

 owners = ["309956199498"]  # Red Hat's AWS account ID
}

resource "aws_key_pair" "deployer_root_key" {
  key_name= "deployer_root_key_sus"
  public_key = file("./mysshkey.pub")
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.rhel9.id
  instance_type = var.instance_type
  key_name= aws_key_pair.deployer_root_key.key_name
  tags = local.common_tags

}

resource "aws_instance" "web2" {
  ami           = data.aws_ami.rhel9.id
  instance_type = var.instance_type
  key_name= aws_key_pair.deployer_root_key.key_name
  tags = local.common_tags

}
