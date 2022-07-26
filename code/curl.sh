

for i in {1..100}; do
  curl http://localhost:9090/info | jq '.hostname'
done