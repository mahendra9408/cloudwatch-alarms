variable "instance_parameters" {
  description = "Map of instance parameters, where key is the instance identifier and value is an object containing parameters"
  type        = map(object({
    instance_id   = string
    ami_id        = string
    instance_type = string
    device        = string
    fstype        = string
    path          = string
  }))
  default = {
    "instance1" = {
      instance_id   = "i-0c13ea65759b666a0"
      ami_id        = "ami-05e00961530ae1b55"
      instance_type = "t2.micro"
      device        = "/dev/sda1"
      fstype        = "ext4"
      path          = "/"
    }
    "instance2" = {
      instance_id   = "i-0c13ea65759b666a0"
      ami_id        = "ami-05e00961530ae1b55"
      instance_type = "t2.micro"
      device        = "/dev/xvdf"
      fstype        = "ext4"
      path          = "/data"
    }
    # Add more instances and their parameters as needed
  }
}
