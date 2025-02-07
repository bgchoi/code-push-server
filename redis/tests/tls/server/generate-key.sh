# 서버용 개인 키 생성
openssl genpkey -algorithm RSA -out redis.key

# 서버 인증서 서명 요청 (CSR) 생성
openssl req -new -key redis.key -out redis.csr -subj "/CN=redis-server"

# 서버 인증서 서명 (유효기간 5년)
openssl x509 -req -in redis.csr -CA ../ca.crt -CAkey ../ca.key -CAcreateserial -out redis.crt -days 18250 -sha256


# ca.crt 복사 
cp ../ca.crt .

