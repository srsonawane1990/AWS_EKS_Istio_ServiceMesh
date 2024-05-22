# AWS_EKS_Istio_ServiceMesh
***TEST CASES***
# Docker build
docker build -t srsonawane/eksistio:latest .  
docker push srsonawane/eksistio:latest 

# Docker Push

# login to client pod 
kubectl exec -it client -n backend  -- sh  

# Client pod (SVC) to Service mesh service communication (Service to service)
while true; do curl http://ss-app.staging:8080/api/devices && echo "" && sleep 1; done

## Check the service accessibility from Internet
curl --header "Host: app.devopsbyexample.com" http://a30b496ca063148fe8e23733b4b6c3bd-1201487825.us-west-2.elb.amazonaws.com/api/devices 

## Windows 
Invoke-WebRequest -Uri "http://a452005df59a84ee4bf08fd07236bd96-2027597711.us-west-2.elb.amazonaws.com/api/devices" -Headers @{"Host"="app.devopsbyexample.com"}