variable "prefix" {
  description = "Default prefix to use with your resource names."
  default     = "removirtualrouter"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "westus2"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS
variable "dns_servers" {
  description = "The DNS servers to be used with vNet"
  default     = ["127.0.0.1","1.1.1.1"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["GatewaySubnet","vrSubnet"]
}

variable "tags" {
  type = map

  default = {
    owner = "Remo Mattei"
    dev = "terraform"
  }
}


