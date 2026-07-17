#!/bin/bash
# Check if service is already running and healthy
if curl -fs --max-time 3 "http://localhost:80/gilhari/v1/health/check" > /dev/null 2>&1; then
    echo "✔ Gilhari microservice is already running and healthy."
    echo "  REST base URL: http://localhost:80/gilhari/v1/"
    exit 0
fi
# Remove any existing container with this name (stopped or running)
docker rm -f hana-poc-service > /dev/null 2>&1 || true
docker run --platform linux/amd64 --hostname hana-poc-service --add-host=host.docker.internal:host-gateway -d --name hana-poc-service -p 80:8081 hana-poc-service:1.0

echo "Waiting for Gilhari microservice to start..."
echo "(This may take up to 3 minutes for cloud or remote databases)"
for i in $(seq 1 18); do
    if curl -fs "http://localhost:80/gilhari/v1/health/check" > /dev/null 2>&1; then
        echo "✔ Gilhari microservice is up and ready."
        echo "  REST base URL: http://localhost:80/gilhari/v1/"
        exit 0
    fi
    sleep 10
done
echo "✘ Service did not respond after 180 seconds."
echo "  The container may still be starting. Check: docker logs hana-poc-service"
echo "  To check if it started later: curl -s http://localhost:80/gilhari/v1/health/check"
exit 1
