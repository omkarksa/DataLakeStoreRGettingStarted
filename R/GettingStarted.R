
#' keeping all static variables here
{
  configPath <- paste0(getwd(), "/../config.json")
}

#' Create a new `azureActiveContext` using the config.json.
#'
#' SAMPLE config_clientcredentials.json:
#'
#' {
#' "authType": "ClientCredential",
#' "resource": "https://datalake.azure.net/",
#' "tenantID": "72f988bf-blah-41af-blah-2d7cd011blah",
#' "clientID": "1d604733-blah-4b37-blah-98fca981blah",
#' "authKey": "zTw5blah+IN+yIblahrKv2K8dM2/BLah4FogBLAH/ME=",
#' "azureDataLakeAccount": "azuresmrtestadls"
#' }
#'
#' SAMPLE config_devicecode.json:
#'
#' {
#' "authType": "DeviceCode",
#' "resource": "https://datalake.azure.net/",
#' "tenantID": "72fblahf-blah-41af-blah-2d7cBLAHdb47",
#' "clientID": "2dblah05-blah-4e0a-blah-ae4d2BLAH5df",
#' }
#'
#' @return `azureActiveContext` object
getAzureActiveContext <- function() {
  config <- read.AzureSMR.config(configPath)
  asc <- createAzureContext()
  with(config,
       # do NOT specify authKey for DeviceCode based auth
       setAzureContext(asc, tenantID = tenantID, clientID = clientID, authKey = authKey, authType = authType, resource = resource)
  )
  azureAuthenticateOnAuthType(asc)
  return(asc)
}

getADLSAccountName <- function() {
  config <- read.AzureSMR.config(paste0(getwd(), "/../config.json"))
  return(config$azureDataLakeAccount)
}

#' Main function that displays some basic ADLS operations.
#'
doSomeADLSOperations <- function() {
  #get all required objects for an ADLS operation
  asc <- getAzureActiveContext()
  azureDataLakeAccount <- getADLSAccountName()

  res <- azureDataLakeMkdirs(asc, azureDataLakeAccount, "deleteme")
  print(res)

  res <- azureDataLakeGetFileStatus(asc, azureDataLakeAccount, "deleteme")
  print(res)

  res <- azureDataLakeCreate(asc, azureDataLakeAccount, "deleteme/deleteme00.txt", contents = charToRaw("abcd"))
  print(res)

  res <- azureDataLakeRead(asc, azureDataLakeAccount, "deleteme/deleteme00.txt")
  print(res)

  res <- azureDataLakeDelete(asc, azureDataLakeAccount, "deleteme", TRUE)
  print(res)
}
