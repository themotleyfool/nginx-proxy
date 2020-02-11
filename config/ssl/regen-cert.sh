openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout localhost.key -config <( cat server.csr.cnf )
openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out localhost.crt -days 500 -sha256 -extfile v3.ext -passin pass:fool
mv localhost.key ../nginx/
mv localhost.crt ../nginx/