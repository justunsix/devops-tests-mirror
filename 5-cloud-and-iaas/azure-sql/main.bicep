targetScope = 'subscription'

metadata description = 'Provisions resources for Azure SQL Database'

// ========== //
// Parameters //
// ========== //

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'sim'

@description('Optional. A token to inject into the name of each resource. This value can be automatically injected by the CI.')
param namePrefix string = 'cows'

@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-sql.servers-${serviceShort}-rg'

@description('Optional. The location to deploy resources to.')
param resourceLocation string = 'canadacentral' // or = deployment().location

@description('Optional. The password for login.')
@secure()
param password string = newGuid()

var tags = {
  'created-by': 'bicep'
}

// ============ //
// Dependencies //
// ============ //

// General resources
// =================
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceLocation
}

// ============== //
// Core Resources //
// ============== //

module sql 'br/public:avm/res/sql/server:0.10.1' = {
  scope: resourceGroup
  name: 'sql-server'
  params: {
    // Required parameters
    name: '${uniqueString(deployment().name, resourceLocation)}-test-${serviceShort}'
    // Non-required parameters
    location: resourceLocation
    tags: tags
    administratorLogin: 'sqladmin'
    administratorLoginPassword: password
    databases: [
      {
        name: 'smallestdb'
        sku: {
          name: 'Basic'
          tier: 'Basic'
        }
      }
    ]
    // firewallRules: [
    //   {
    //     startIpAddress: '0.0.0.0'
    //     name: 'AllowAllIps'
    //     endIpAddress: '255.255.255.255'
    //   }
    // ]
    // databases: [
    //   {
    //     name: 'AdventureWorksLT'
    //     sampleName: 'AdventureWorksLT'
    //     autoPauseDelay: 60
    //     minCapacity: '0.5'
    //     sku: {
    //       name: 'GP_S_Gen5_1'
    //       tier: 'GeneralPurpose'
    //     }
    //     zoneRedundant: false
    //   }
    // ]
  }
}
