#output "print_message" {
#  value = var.message
#}

variable "input_config" {
  description = "Complex input object"
  type = object({
    name  = string
    value = object({
      name     = string
      schedule = object({
        unit      = string
        frequency = number
      })
      retention = object({
        duration = number
        unit     = string
      })
      use_default_backup_target = bool
    })
    metadata = object({
      type = string
    })
  })
}

# Print full object
output "full_input" {
  value = var.input_config
}

# Pretty JSON output
output "full_input_json" {
  value = jsonencode(var.input_config)
}

# Example: access nested fields
output "policy_name" {
  value = var.input_config.value.name
}

output "backup_frequency" {
  value = var.input_config.value.schedule.frequency
}
