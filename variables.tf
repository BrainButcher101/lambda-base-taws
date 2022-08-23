variable "env" {
  type        = string
  description = "Name environment where the Lambda function is deployed"
}

variable "l_function" {
    ### experimental optional statement!!!
  type = object({
    name    = string
    zip     = string
    hash    = optional(string)
    handler = string
    runtime = string
    memsize = optional(string)
    timeout = optional(string)
    role    = optional(map(any))
    policy  = optional(string)

    vpc_config = optional(object({
      subnet_ids      = list(string)
      security_groups = list(string)
    }))

    env                = optional(map(any))
    policies           = optional(map(any))
    policy_attachments = optional(list(string))
    permissions        = optional(map(any))
    s3_permissions     = optional(map(any))
    track_versions     = optional(bool)
  })
  description = "(Required) Lambda function: Name, zip, hash(optional), handler, runtime, memsize, timeout, role, policy"
}

variable "layer" {
  type = object({
    zip                 = string
    hash                = optional(string)
    compatible_runtimes = optional(list(string))
  })

  default     = null
  description = "Lambda layer definition"
}

variable "logs" {

    ### experimental optional statement!!!

  type = object({
    log_retention_days = number
    kms_key_arn        = optional(string)
  })

  default = {
    log_retention_days = 7
    kms_key_arn        = null
  }

  description = "(Optional) Lambda logging configuration for CloudWatch"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags all the tings"
}