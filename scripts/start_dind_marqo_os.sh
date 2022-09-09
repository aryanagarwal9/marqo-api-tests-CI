docker rm -f marqo;
     docker run --name marqo --privileged -p 8882:8882 --add-host host.docker.internal:host-gateway --memory=7g marqo_docker_0 &
# wait for marqo to start
until [[ $(curl -v --silent --insecure http://localhost:8882 2>&1 | grep marqo) ]]; do
    sleep 0.1;
done;

