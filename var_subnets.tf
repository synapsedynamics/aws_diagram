variable "subnets" {
  type = list(object({
    cidr = string
    network_tier = string
    az   = string
  }))
  default = [
    {
      cidr = "10.20.81.0/24"
      network_tier = "public"
      az   = "a"
    },
    {
      cidr = "10.20.82.0/24"
      network_tier = "public"
      az   = "b"
    },
    {
      cidr = "10.20.83.0/24"
      network_tier = "public"
      az   = "c"
    },
    {
      cidr = "10.20.241.0/24"
      network_tier = "private"
      az   = "a"
    },
    {
      cidr = "10.20.242.0/24"
      network_tier = "private"
      az   = "b"
    },
    {
      cidr = "10.20.243.0/24"
      network_tier = "private"
      az   = "c"
    }
  ]
}
