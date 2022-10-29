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

## getting pod goserver information
kubectl get pods $pod -o yaml
