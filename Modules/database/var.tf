variable "sql_database" {
  type = map(object({
    name                = string
    resource_group_name = string
    sku_name            = string
    enclave_type        = string
    max_size_gb         = number
  }))
}
