# BASIC HELM CHART

## Procedure

This Helm chart feature a basic chart that use AppVersion in Chart.yaml to define the docker image tags.
Further information can be found [here](!https://jfrog.com/blog/helm-charts-best-practices/)

```bash
export VER=1.0.0
export APP_VV=helm-kubia-"${VER}".tgz 
export APP_V1=helm-kubia-"${VER}"-app-version-v1.tgz
export APP_V4=helm-kubia-"${VER}"-app-version-v4.tgz

# Generate helm chart version 1.0.0 and app-version v1
helm package . --version "${VER}" --app-version v1
mv "${APP_VV}" "${APP_V1}"

# Generate helm chart version 1.0.0 and app-version v4
helm package . --version "${VER}" --app-version v4
mv "${APP_VV}" "${APP_V4}"

# Test if app-version can be used as image tag
helm install --name kubia --namespace kubia "${APP_V1}"
helm upgrade --install kubia ${APP_V4} --namespace=kubia

# Test service v1
export V1_IP_ADDR=$(kubectl get service kubia-nodeport -o jsonpath='{.spec.clusterIP}')
curl http://${V1_IP_ADDR}

# Test service v4
export V4_IP_ADDR=$(kubectl get service kubia-nodeport -o jsonpath='{.spec.clusterIP}')
curl http://${V4_IP_ADDR}

## Test result

Helm chart app-version v4 overrides v1 successfully.

