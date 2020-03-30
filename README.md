# Kubernetes in action

This repository contains all the code (and some additional files) from my [Kubernetes in Action](https://k8s.si/book) book.

# Tests

In case testing the ingress controller in cloud environment:
- Install the ingress-nginx controller (customized for enabled rbac)
- Replace the host replace.me in the ingress resource with an appropriate domain
- Deploy the ingress resource and the test deployment
- Configure the load balancer and and create listener for nodeports
- Open nodeports in cluster nodes
- Assign load balancer public IP to the domain in the ingress resource

