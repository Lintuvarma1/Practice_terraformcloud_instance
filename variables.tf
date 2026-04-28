variable "instance_ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI (HVM), SSD Volume Type

}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.micro"

}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "awslinux" # Replace with your actual key pair name

}

variable "security_group_name" {
  description = "The name of the security group to create"
  type        = string
  default     = "allow_ssh"

}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Allow SSH inbound traffic"

}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default     = "Terraform-EC2-Instance"

}
output "public_ip" {
    description = "The public IP address of the EC2 instance"
    value       = aws_instance.example.*.public_ip

}

variable "inst_count" {
  description = "Number of EC2 instances to create"
  type        = number

}

variable "access_key" {
  description = "The access key for the AWS account"
  type        = string
}

variable "secret_key" {
  description = "The secret key for the AWS account"
  type        = string  
}