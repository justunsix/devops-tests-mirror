# Azure SQL Database Creation

Uses Bicep to create an Azure SQL Database using Azure Verified Modules.

See:

- [Bicep registry modules](https://github.com/Azure/bicep-registry-modules).
  - [Azure SQL server modules](https://github.com/Azure/bicep-registry-modules/tree/main/avm/res/sql/server).

## Setup

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### Optional tooling options

Tools to make it easier to work with Bicep files. Choose one of the following or use a combination:

- [VS Code](https://code.visualstudio.com/) with Bicep extension for Visual Studio Code
- [Neovim](https://neovim.io/) or [Vim](https://www.vim.org/) with plugin [vim-bicep](https://github.com/carlsmedstad/vim-bicep)
- [Helix](https://helix-editor.com/) with [bicep-langserver](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations#bicep) from [Azure Bicep](https://github.com/Azure/bicep/releases/latest)

## Deployment

```shell

# Login to Azure and select appropriate subscription
az login

# Deploy Bicep defined resources in the selected subscription
## Other options: https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-cli
az deployment sub create --location "Canada Central" --template-file main.bicep

```

## See Also

`main.bicep` based on

- [Azure Samples for Adventure Works Database](https://github.com/Azure-Samples/database-templates-sql-adventureworks/blob/main/infra/main.bicep)
- [Azure SQL Bicep registry module Usage Examples](https://github.com/Azure/bicep-registry-modules/tree/main/avm/res/sql/server#Usage-examples)