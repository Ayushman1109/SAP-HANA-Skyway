@echo off
setlocal enabledelayedexpansion
REM Check if service is already running and healthy
curl -fs --max-time 3 http://localhost:80/gilhari/v1/health/check >nul 2>&1
if not errorlevel 1 (
    echo Gilhari microservice is already running and healthy.
    echo REST base URL: http://localhost:80/gilhari/v1/
    exit /b 0
)
REM Remove any existing container with this name (stopped or running)
docker rm -f hana-poc-service >nul 2>&1
docker run --platform linux/amd64 -d --name hana-poc-service -p 80:8081 hana-poc-service:1.0

echo Waiting for Gilhari microservice to start...
echo (This may take up to 3 minutes for cloud or remote databases)
set READY=0
for /L %%i in (1,1,18) do (
    curl -fs http://localhost:80/gilhari/v1/health/check >nul 2>&1
    if not errorlevel 1 set READY=1
    if !READY!==1 goto :done
    timeout /t 10 /nobreak >nul
)
:done
if !READY!==1 (
    echo Gilhari microservice is up and ready.
    echo REST base URL: http://localhost:80/gilhari/v1/
) else (
    echo Service did not respond after 180 seconds.
    echo The container may still be starting. Check: docker logs hana-poc-service
    echo To check if it started later: curl -s http://localhost:80/gilhari/v1/health/check
    exit /b 1
)
