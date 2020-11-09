resource "azurerm_template_deployment" "main" {
  name        = "${var.dataDiskName}-template"
  resource_group_name  = var.resource_group_name

  #template_body = file("./arm/azuredeploy.json")
  template_body = file(var.template_path)

  parameters = {
    "dataDiskName"    = var.dataDiskName
    "dataDiskSizeGB"  = var.dataDiskSizeGB
    "maxShares"       = var.maxShares
  }

  deployment_mode = "Incremental"
}

