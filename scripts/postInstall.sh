#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;

target=$(docker-compose port linkwarden 3000)

curl http://${target}/api/v1/users \
  -H 'accept: */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6,zh-CN;q=0.5,zh;q=0.4,ja;q=0.3' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'pragma: no-cache' \
  -H 'priority: u=1, i' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
  --data-raw '{"name":"admin","username":"admin","password":"'${ADMIN_PASSWORD}'"}'