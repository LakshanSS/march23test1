import ballerina/io;
import ballerinax/azure_storage_service.blobs as azure_blobs;

configurable string accessKey = ?;
configurable string accountName = ?;

public function main() returns error? {
    io:println("Hello, World!");
    azure_blobs:ConnectionConfig blobServiceConfig = {
        accessKeyOrSAS: accessKey,
        accountName: accountName,
        authorizationMethod: "accessKey"
    };
    azure_blobs:ManagementClient managementClient = check new (blobServiceConfig);

    io:println("List all blobs");    
    azure_blobs:AccountInformationResult listBlobsResult = check managementClient->getAccountInformation();
    io:println(listBlobsResult.toString());
}
