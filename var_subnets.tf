variable "subnets" {
  type = list(object({
    tier = string
    cidr = string
    az   = string
    use  = string
  }))
  default = [
    {
      cidr = "10.20.81.0/24"
      tier = "public"
      az   = "a"
      use  = "false"
    },
    {
      cidr = "10.20.82.0/24"
      tier = "public"
      az   = "b"
      use  = "false"
    },
    {
      cidr = "10.20.83.0/24"
      tier = "public"
      az   = "c"
      use  = "false"
    },
    {
      cidr = "10.20.241.0/24"
      tier = "private"
      az   = "a"
      use  = "true"
    },
    {
      cidr = "10.20.242.0/24"
      tier = "private"
      az   = "b"
      use  = "true"
    },
    {
      cidr = "10.20.243.0/24"
      tier = "private"
      az   = "c"
      use  = "false"
    }
  ]
}
