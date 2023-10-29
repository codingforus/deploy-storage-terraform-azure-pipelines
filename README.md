# Introduction 
Deploying Azure Storage Account using Terraform and Azure YAML Pipelines.

# Terraform
Terraform `tf` file is included in this repository to deploy the Azure resources.

# Azure Pipelines
An Azure YAML pipeline is included in this repository to create an Azure Storage Account and Blob container to store the Terraform state file.

In another step the Terraform configuration is planned and executed and finally destroyed.

The Azure CLI tasks are using a Service Connection to Azure via Workload Identity Federation.