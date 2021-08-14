variable "node_id" {
  description = "Node ID."
  type        = number

  validation {
    condition     = var.node_id >= 1 && var.node_id <= 4000
    error_message = "Minimum value: 1. Maximum value: 4000."
  }
}

variable "pod" {
  description = "Pod ID."
  type        = number
  default     = 1

  validation {
    condition     = var.pod >= 1 && var.pod <= 255
    error_message = "Minimum value: 1. Maximum value: 255."
  }
}

variable "address" {
  description = "OOB IP address."
  type        = string
}

variable "gateway" {
  description = "OOB gateway IP."
  type        = string
}

variable "endpoint_group" {
  description = "OOB management endpoint group name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{0,64}$", var.endpoint_group))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}
