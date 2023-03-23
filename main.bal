import ballerina/io;
import ballerinax/azure_storage_service.blobs as azure_blobs;

configurable string accessKey = ?;
configurable string accountName = ?;

public function main() {
    io:println("Hello, World!");
    azure_blobs:ConnectionConfig blobServiceConfig = {
        accessKeyOrSAS: accessKey,
        accountName: accountName,
        authorizationMethod: "accessKey"
    };
    azure_blobs:BlobClient blobClient = check new (blobServiceConfig);

    log:printInfo("List all blobs");    
    var listBlobsResult = blobClient->listBlobs("sample-container");
    if (listBlobsResult is error) {
        log:printError(listBlobsResult.toString());
    } else {
        log:printInfo(listBlobsResult.toString());
    }
}
