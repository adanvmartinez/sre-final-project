

variable vpc_cidr { 
    default = "10.0.0.0/20"
}
variable public_subnet_cidr {
    default = "10.0.1.0/24"
}

variable "ssh-key"{
    default = "ssh key location"
}

