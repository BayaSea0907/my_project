# 秘密鍵を作成
openssl genrsa 2048 > server.key

# 証明書署名要求(CSR)を作成(色々入力を求められるので全部Enter)
openssl req -new -config /opt/homebrew/etc/openssl@1.1/openssl.cnf -key server.key > server.csr

# オレオレ証明書を作成
openssl x509 -days 3650 -req -sha256 -signkey server.key < server.csr > server.crt
