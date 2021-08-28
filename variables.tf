  variable "region" {
    type = string
    default = "europe-north1"
}

variable "project" {
    type = string
    default = "dichlist-server"
}

variable "instance" {
    type = string
    default = "e2-highcpu-4"
}

variable "user" {
    type = string
    default = "taras"
}


variable "publickeypath" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}
