# This is using kind as the cluster provider

## Getting started with the local cluster
kind create cluster --config ./k8s/kind.yaml --name local

## Changing context 
kubectl config use-context kind-local

## getting contexts
kubectl config get-contexts

## Creating pod inside cluster 
kubectl apply -f ./k8s/pod.yaml

## Creating pod with replicaset
kubectl apply -f ./k8s/replicaset.yaml

### What is the problem with replicasets?
#### If we update the image that the pod is using it will not update the pods that are already running
#### We need to delete the replicaset and create it again
#### We can use deployments to solve this problem

## Creating deployment
kubectl apply -f ./k8s/deployment.yaml

## Updating deployment

## getting pod goserver information to prove that the image was updated
kubectl get pods $pod -o yaml

## Tracking deployment history
kubectl rollout history deployment $deployment

## Rolling back deployment
kubectl rollout undo deployment $deployment

## Rolling back to a specific revision
kubectl rollout undo deployment $deployment --to-revision=$revision

## Getting informations about the deployment
kubectl describe deployment $deployment

## Creating service to expose the pod
kubectl apply -f ./k8s/service.yaml

## Getting service information
kubectl get service $service

## Accessing the service
kubectl port-forward service/$service 8080:8080

### The port specified by the service is the port that the service is exposing to 
### and the same port that the service is going to redirect to the pod
### To specify the port that the service is going to redirect to we need to use the targetPort

### Applying configmap to load the environment variables
kubectl apply -f ./k8s/configmap-env.yaml

### Applying configmap to create files
kubectl apply -f ./k8s/configmap-volume.yaml

### Entering the pod to check the files
kubectl exec -it $pod -- bash

### Catching the logs of the pod
kubectl logs $pod