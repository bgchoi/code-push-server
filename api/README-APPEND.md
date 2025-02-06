### GitHub Organizations 체크 로직 추가함(2025.02.12)

GitHub Organizations의 멤버가 아닌경우 Access Key발급을 하지 않음.

### Docker 컨테이너로 구성

컨테이너

- PM2 : API서버(코어 갯수만큼)
- Azurlite : 스토리지 서버

### Azurlite 컨테이너로 구성시 외부 컨테이터에서 접근 가능하도록 변경(2025.02.13)

- azure-storage.ts

```
    // MODIFY CODE. AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;QueueEndpoint=http://{HOSTNAME}:10001/devstoreaccount1;";
    let tableClientConnectionString =
    "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;TableEndpoint=http://{HOSTNAME}:10002/devstoreaccount1";

    let blobServiceClientConnectionString =
    "DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://{HOSTNAME}:10000/devstoreaccount1;";

    tableClientConnectionString = tableClientConnectionString.replace(
    "{HOSTNAME}",
    process.env.CUSTOM_AZURE_STORAGE_HOST || "localhost"
    );

    blobServiceClientConnectionString = blobServiceClientConnectionString.replace(
    "{HOSTNAME}",
    process.env.CUSTOM_AZURE_STORAGE_HOST || "localhost"
    );

    tableServiceClient = TableServiceClient.fromConnectionString(tableClientConnectionString, { allowInsecureConnection: true });
    tableClient = TableClient.fromConnectionString(tableClientConnectionString, AzureStorage.TABLE_NAME, {
    allowInsecureConnection: true,
    });
    blobServiceClient = BlobServiceClient.fromConnectionString(blobServiceClientConnectionString);

    const DEBUG = false;
    if (DEBUG) {
    console.log("tableServiceClient - devConnectionString : " + tableClient.url);
    console.log("tableClient - devConnectionString : " + tableServiceClient.url);
    console.log("blobServiceClient - devConnectionString : " + blobServiceClient.url);
    }
```
