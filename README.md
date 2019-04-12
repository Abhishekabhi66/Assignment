# Assignment [![Build Status](https://cloud.drone.io/api/badges/Abhishekabhi66/Assignment/status.svg)](https://cloud.drone.io/Abhishekabhi66/Assignment)
###steps

Clone the repo  `https://github.com/Abhishekabhi66/Assignment.git`
1. Create a Docker image using Dockerfile   ` docker image build -t your_user_id/image_name .` 
2. Running application on the local host
3. docker-compose up

2. Run Application on Kubernetes  ` kubectl create -f k8s/`
  
3. Commit changes to trigger a drone ci pipeline to build the latest docker image.
 
`Note:` When I'm trying to deploy our application into Heroku our service got deployed succesfully but it is not getting connected with redis database. As I don't have much experience with Heroku I was unable to acheive it. Our application is running successfully on localhost and kubernetes (using mini-kube).
