#!/bin/sh
# docker build -t LucasBondDavis/multi-client:latest -t LucasBondDavis/multi-client:$SHA -f ./client/Dockerfile ./client
# docker build -t LucasBondDavis/multi-server:latest -t LucasBondDavis/multi-server:$SHA -f ./server/Dockerfile ./server
# docker build -t LucasBondDavis/multi-worker:latest -t LucasBondDavis/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# docker push LucasBondDavis/multi-client:latest
# docker push LucasBondDavis/multi-server:latest
# docker push LucasBondDavis/multi-worker:latest

# docker push LucasBondDavis/multi-client:$SHA
# docker push LucasBondDavis/multi-server:$SHA
# docker push LucasBondDavis/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cygnetops/multi-server-pgfix-5-11
kubectl set image deployments/client-deployment client=sstephengrider/multi-client:latest
kubectl set image deployments/worker-deployment client=sstephengrider/multi-worker:latest
