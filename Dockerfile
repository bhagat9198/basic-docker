FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 5000

CMD [ "node", "app.js" ]  

# docker
  # docker build . -t kub-test
    # kub-test: image name
  # docker run -d --name cont_name -p 5000:5000 kub-test
    # cont_name: container name
  # docker stop --time=30 cont_name 
  # docker rm cont_name
  
# kubernetes
  # minikube status
  # minikube start --driver=virtualbox
  # kubectl help
  # kubectl create deployment first-app --image=bhagat9198/kub-test
    # first-app: deployment name
  # kubectl get deployments
  # kubectl get pods
  # kubectl delete deployment first-app

# deploy img docker
  # create repo on docker
  #  docker tag kub-test bhagat9198/kub-test 
  # docker push bhagat9198/kub-test

# to check whats goining on (deployments-pods)
  # minikube dashboard

# exposing deployment
  # kubectl service - not recommeneded
  # kubectl expose deployment kube-test --port=5000 --type=LoadBalancer
    # 5000: internal port 
    # different types of serviuce/exposing
    # ClusterIP: default, reachable from inside the cluster and so getrs an address which doesnt change
    # NodePort: this port shiould be exposed with help of ip address on which it running and can be used from outside
    # LoadBalancer: utrlise the loaderbalancer on which cluster runs and it will generate the unique address and evenly disribute the traffic. it is only suipported on aws and minikube too
  # kubectl get services
    # should see 2 services - kubernets and app
  # minikube service first-app

# deployment scale
  # kubectl scale first-app --replicas=3

# updating deplyment
  # 1. updating img - img name: bhagat9198/kub-test:2
  # kubctl set image deployment/first-app - not reccomnded
    # img will be the prvious name img which we used to deplyment
  # kubctl set image deployment/first-app cont_name=bhagat9198/kub-test
    # cont_name: name of cont and also be find from minikube dashboard
    # bhagat9198/kub-test: new/updated img name
  # if no chnages occur: no change in tag thus will not be downloaded

# checking status of deployment
  # kubectl rollout status bhagat9198/kub-test

# rollback to previous/last deployment
  # kubectl rollout undo deployment/first-app

# rollout to specific previous version
  # kubectl rollout undo deployment/first-app --to-revision=1 

# rollout history
  # kubectl rollout history deployment/first-app --revision 

# deleteing the service
  # kubectl delete service first-app

# deleting the deployment
  # kubectl delete deployment first-app