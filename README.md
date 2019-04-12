# Assignment [![Build Status](https://cloud.drone.io/api/badges/Abhishekabhi66/Assignment/status.svg)](https://cloud.drone.io/Abhishekabhi66/Assignment)
###steps

Clone the repo  `https://github.com/Abhishekabhi66/Assignment.git`
1. Create a Docker image using Dockerfile   ` docker image build -t your_user_id/image_name .` 
2. Running application on the local host
3. docker-compose up

2. Run Application on Kubernetes  ` kubectl create -f k8s/`
  
3. Commit changes to trigger a drone ci pipeline to build the latest docker image.
 
`Note:` When I'm trying to deploy our application into Heroku our service got deployed succesfully but it is not getting connected with redis database. As I don't have much experience with Heroku I was unable to acheive it. Our application is running successfully on localhost and kubernetes (using mini-kube).


#Multi-key support

Post-Request:
1.curl --request POST \
     --header "Content-Type: application/json" \
     --data '{"value":"Hello GumGum!"}' \
     http://localhost:5000/set/test
     
2. curl --request POST \
     --header "Content-Type: application/json" \
     --data '{"value":"Hello World!"}' \
     http://localhost:5000/set/test1
3. curl --request POST \
     --header "Content-Type: application/json" \
     --data '{"value":"Abhi"}' \
     http://localhost:5000/set/newKey
     
  Get-Request: \
  1. Running locally \
 curl http://localhost:5000/getKeys/newKey,test,test1,c \
{"c":null,"newKey":"Abhi","test":"Hello GumGum!","test1":"Hello World!"}
  
  2. Running on kubernetes \
  curl http://192.168.99.100:32499/getKeys/test,a,b,c \
  {"a":"Hello GumGum!","b":"Hello World!","c":null,"test":"Hello World!"}
  
