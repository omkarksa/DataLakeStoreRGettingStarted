# DataLakeStoreRGettingStarted - Instructions to install and test the DataLakeStoreRGettingStarted client
Sample ADLS client in R using the R connector for ADLS which is part of AzureSMR

## Install R runtime and R studio
## Install required R packages
```
install.packages("devtools", dependencies = TRUE)
library(devtools)

install_github("omkarksa/AzureSMR")
library(AzureSMR)
```

## Prepare the config.json property file
```
{
 "authType": "ClientCredential",
 "resource": "https://datalake.azure.net/",
 "tenantID": "72f988bf-blah-41af-blah-2d7cd011blah",
 "clientID": "1d604733-blah-4b37-blah-98fca981blah",
 "authKey": "zTw5blah+IN+yIblahrKv2K8dM2/BLah4FogBLAH/ME=",
 "azureDataLakeAccount": "azuresmrtestadls"
}
```

## Clone and open the sample client in R Studio
`
git clone https://github.com/omkarksa/DataLakeStoreRGettingStarted.git
`

## Configure the config.json file path in the GettingStarted.R file
`
configPath <- paste0(getwd(), "/../config.json")
`

## Build and load the DataLakeStoreRGettingStarted client

## Set the working directory 
`
setwd("<root_of_sample>/DataLakeStoreRGettingStarted")
`

## Run the test
`
doSomeADLSOperations()
`

**NOTE:**
1. During this installation process if you come across an error with installing any package, please exit RStudio and delete the respective package folder from the paths specified in .libPaths()
