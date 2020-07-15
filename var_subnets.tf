variable "subnets" {
  type = list(object({
    tier = string
    cidr = string
    az   = string
  }))
  default = [
    {
      cidr = "10.20.81.0/24"
      tier = "public"
      az   = "a"
    },
    {
      cidr = "10.20.82.0/24"
      tier = "public"
      az   = "b"
    },
    {
      cidr = "10.20.83.0/24"
      tier = "public"
      az   = "c"
    },
    {
      cidr = "10.20.241.0/24"
      tier = "private"
      az   = "a"
    },
    {
      cidr = "10.20.242.0/24"
      tier = "private"
      az   = "b"
    },
    {
      cidr = "10.20.243.0/24"
      tier = "private"
      az   = "c"
    }
  ]
}
