### (Task1.) GitHub Organizations 체크 로직 추가함(2025.02.12)

GitHub Organizations의 멤버가 아닌경우 Access Key발급을 하지 않음.

### (Task2.) API & Azurite 컨테이너로 구성

컨테이너

- PM2 : API서버(코어 갯수만큼)
- Azurite : 스토리지 서버
- Network : codepush-net

### (Task3.) Azurite 컨테이너로 구성시 외부 컨테이터에서 접근 가능하도록 변경(2025.02.13)

- script/storage/azure-storage.ts .fromConnectionString 부분 수정.

### (Task4.) Redis TLS 적용

- script/redis-manager.ts 수정 constructor() 부분 수정
