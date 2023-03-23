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
    azure_blobs:BlobClient blobClient = check new (blobServiceConfig);

    io:println("List all blobs");    
    var listBlobsResult = blobClient->listBlobs("test-blob-container");
    if (listBlobsResult is error) {
        io:println(listBlobsResult.toString());
    } else {
        io:println(listBlobsResult.toString());
    }
}
