# Grafana-Prometheus

## Prerequisites
To install grafana and prometheus the best way is to use the Helm charts, as these tools deployes many resources on the kubernetes cluster.

## Install Prometheus operator 

- Add Helm repositories
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

```

- Install chart
```
helm install prometheus prometheus-community/kube-prometheus-stack
```