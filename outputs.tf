output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = azurerm_private_endpoint.this
}

# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = azurerm_search_service.this
}

output "resource_id" {
  description = "The ID of the machine learning workspace."
  value       = azurerm_search_service.this.id
}

output "system_assigned_mi_principal_id" {
  description = "The principal ID of system assigned managed identity on the search service created, when `var.managed_identities` is `null` or `var.managed_identities.system_assigned` is `false` this output is `null`."
  value       = try(var.managed_identities.system_assigned, false) ? azurerm_search_service.this.identity[0].principal_id : null
}

# debug output
output "identity" {
  description = "The identity block."
  value       = azurerm_search_service.this.identity
}