variable "algorithm" {
  description = "Algorithm used to compute te password string."
  type        = string
  default     = "bcrypt"

  validation {
    condition     = var.algorithm == "bcrypt"
    error_message = "Invalid algorithm."
  }
}

variable "plain_text" {
  description = "Plain text to encrypt."
  type        = string
}

variable "bcrypt_options" {
  description = "Parameters for bcrypt."
  type        = object({ cost = number })
  default     = { cost = 10 }
}
