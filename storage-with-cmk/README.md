# ARM template to provide storage account with Customer Managed Keys and Private Endpoint

This arm template provisions a storage account with blob endpoint with encryption of data at rest using customer managed keys using Azure Key Vault. 
The arm template provisions both Storage Account, Azure Key Vault and places them behind a private endpoint in the designated virtual network. 


## Prerequisites

* Resource group created and user have owner or contributor permissions on the Resource group
* Existing Virual network and subnet provisioned



## Steps

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fanildwarepo%2Fgeneric-utils%2Fmain%2Fstorage-with-cmk%2Fazuredeploy-storage-with-cmk-pe.json) 