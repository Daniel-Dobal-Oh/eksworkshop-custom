#!/bin/bash

# Deploy service
cd ~/environment/efs
wget https://eksworkshop.com/beginner/190_efs/efs.files/efs-writer.yaml
wget https://eksworkshop.com/beginner/190_efs/efs.files/efs-reader.yaml
kubectl apply -f efs-writer.yaml
kubectl apply -f efs-reader.yaml

# writer가 잘 동작하는지 확인
kubectl exec -it efs-writer -n storage -- tail /shared/out.txt

sleep 5s
# reader가 잘 동작하는지 확인
kubectl exec -it efs-reader -n storage -- tail /shared/out.txt
