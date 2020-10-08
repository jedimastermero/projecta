variable "port" {

  description = "WEB server default port"
  type = number
  default = 8080

}
variable "test_list" {

  type = list(string)
  default = ["optimus","jazz","ironhide"]
}