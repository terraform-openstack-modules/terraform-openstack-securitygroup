variable "securitygroup_name" {
  type = "string"
  default = "default"
}

variable "securitygroup_desc" {
  type = "string"
  default = "desc"
}

variable "securitygroup_rules" {
  type = "list"
  default = []
}
