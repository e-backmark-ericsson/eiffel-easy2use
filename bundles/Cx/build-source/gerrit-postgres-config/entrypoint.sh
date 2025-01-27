#!/bin/bash
#
#   Copyright 2019 Ericsson AB.
#   For a full list of individual contributors, please see the commit history.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# Seed Postgres
# -- wait gerrit
echo "GERRIT_WEBURL: ${GERRIT_WEBURL}"

if [ ! -z "$GERRIT_WEBURL" ]
then
  /seed/health-check.sh "$GERRIT_WEBURL"
fi

# Seed & config Postgres

source ./postgres.sh

# ----------------------------------------------------------------------

# Seed & config Gerrit
echo Seed remrem env vars

ARGO_CD_MS_BACKEND_VALUES_FILE_DEV_TO_SED=/seed/projects/deployments/ms-backend/values-dev.yaml
sed -i -e "s%CX_IMAGE_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_DEV_TO_SED
sed -i -e "s%CX_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_DEV_TO_SED
sed -i -e "s%K8S_DOMAIN_NAME_TO_SED%${K8S_DOMAIN_NAME//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_DEV_TO_SED
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_DEV_TO_SED

ARGO_CD_MS_BACKEND_VALUES_FILE_STAGE_TO_SED=/seed/projects/deployments/ms-backend/values-stage.yaml
sed -i -e "s%CX_IMAGE_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_STAGE_TO_SED
sed -i -e "s%CX_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_STAGE_TO_SED
sed -i -e "s%K8S_DOMAIN_NAME_TO_SED%${K8S_DOMAIN_NAME//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_STAGE_TO_SED
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_STAGE_TO_SED

ARGO_CD_MS_BACKEND_VALUES_FILE_PROD_TO_SED=/seed/projects/deployments/ms-backend/values-prod.yaml
sed -i -e "s%CX_IMAGE_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_PROD_TO_SED
sed -i -e "s%CX_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_PROD_TO_SED
sed -i -e "s%K8S_DOMAIN_NAME_TO_SED%${K8S_DOMAIN_NAME//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_PROD_TO_SED
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_MS_BACKEND_VALUES_FILE_PROD_TO_SED

ARGO_CD_MS_FRONTEND_VALUES_FILE_DEV_TO_SED=/seed/projects/deployments/ms-frontend/values-dev.yaml
sed -i -e "s%CX_IMAGE_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_DEV_TO_SED
sed -i -e "s%CX_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_DEV_TO_SED
sed -i -e "s%K8S_DOMAIN_NAME_TO_SED%${K8S_DOMAIN_NAME//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_DEV_TO_SED
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_DEV_TO_SED

ARGO_CD_MS_FRONTEND_VALUES_FILE_STAGE_TO_SED=/seed/projects/deployments/ms-frontend/values-stage.yaml
sed -i -e "s%CX_IMAGE_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_STAGE_TO_SED
sed -i -e "s%CX_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_STAGE_TO_SED
sed -i -e "s%K8S_DOMAIN_NAME_TO_SED%${K8S_DOMAIN_NAME//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_STAGE_TO_SED
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_STAGE_TO_SED

ARGO_CD_MS_FRONTEND_VALUES_FILE_PROD_TO_SED=/seed/projects/deployments/ms-frontend/values-prod.yaml
sed -i -e "s%CX_IMAGE_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_PROD_TO_SED
sed -i -e "s%CX_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_PROD_TO_SED
sed -i -e "s%K8S_DOMAIN_NAME_TO_SED%${K8S_DOMAIN_NAME//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_PROD_TO_SED
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_MS_FRONTEND_VALUES_FILE_PROD_TO_SED


JENKINSFILE_MS_FRONTEND_TO_SED=/seed/projects/ms-frontend/Jenkinsfile
sed -i -e "s%REMREM_PUBLISH_GEN_PUB_URL_SED%${REMREM_PUBLISH_GEN_PUB_URL//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%REMREM_GENERATE_URL_SED%${REMREM_GENERATE_URL//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%REMREM_PUBLISH_URL_SED%${REMREM_PUBLISH_URL//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%GERRIT_GIT_SERVER_SED%${GERRIT_WEBURL//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%GERRIT_GIT_SERVER_NP_SED%${GERRIT_SERVERNAME_NO_PORT//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%ARTIFACTORY_URL_SED%${ARTIFACTORY_URL//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%DOCKER_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED
sed -i -e "s%DOCKER_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $JENKINSFILE_MS_FRONTEND_TO_SED


JENKINSFILE_MS_BACKEND_TO_SED=/seed/projects/ms-backend/Jenkinsfile
sed -i -e "s%REMREM_PUBLISH_GEN_PUB_URL_SED%${REMREM_PUBLISH_GEN_PUB_URL//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%REMREM_GENERATE_URL_SED%${REMREM_GENERATE_URL//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%REMREM_PUBLISH_URL_SED%${REMREM_PUBLISH_URL//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%GERRIT_GIT_SERVER_SED%${GERRIT_WEBURL//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%GERRIT_GIT_SERVER_NP_SED%${GERRIT_SERVERNAME_NO_PORT//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%ARTIFACTORY_URL_SED%${ARTIFACTORY_URL//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%DOCKER_REGISTRY_SED%${CX_IMAGE_REGISTRY//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED
sed -i -e "s%DOCKER_IMAGE_REPOSITORY_SED%${CX_IMAGE_REPOSITORY//&/\\&}%g" $JENKINSFILE_MS_BACKEND_TO_SED

ARGO_CD_APPLICATION_FILE_MS_BACKEND_DEV_TO_SED=/seed/projects/ms-backend/deployment/argocd/application-ms-backend-dev.yaml
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_BACKEND_DEV_TO_SED
sed -i -e "s%GERRIT_INGRESS_TO_SED%${GERRIT_INGRESS//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_BACKEND_DEV_TO_SED

ARGO_CD_APPLICATION_FILE_MS_BACKEND_STAGE_TO_SED=/seed/projects/ms-backend/deployment/argocd/application-ms-backend-stage.yaml
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_BACKEND_STAGE_TO_SED
sed -i -e "s%GERRIT_INGRESS_TO_SED%${GERRIT_INGRESS//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_BACKEND_STAGE_TO_SED

ARGO_CD_APPLICATION_FILE_MS_BACKEND_PROD_TO_SED=/seed/projects/ms-backend/deployment/argocd/application-ms-backend-prod.yaml
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_BACKEND_PROD_TO_SED
sed -i -e "s%GERRIT_INGRESS_TO_SED%${GERRIT_INGRESS//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_BACKEND_PROD_TO_SED

ARGO_CD_APPLICATION_FILE_MS_FRONTEND_DEV_TO_SED=/seed/projects/ms-frontend/deployment/argocd/application-ms-frontend-dev.yaml
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_FRONTEND_DEV_TO_SED
sed -i -e "s%GERRIT_INGRESS_TO_SED%${GERRIT_INGRESS//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_FRONTEND_DEV_TO_SED

ARGO_CD_APPLICATION_FILE_MS_FRONTEND_STAGE_TO_SED=/seed/projects/ms-frontend/deployment/argocd/application-ms-frontend-stage.yaml
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_FRONTEND_STAGE_TO_SED
sed -i -e "s%GERRIT_INGRESS_TO_SED%${GERRIT_INGRESS//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_FRONTEND_STAGE_TO_SED

ARGO_CD_APPLICATION_FILE_MS_FRONTEND_PROD_TO_SED=/seed/projects/ms-frontend/deployment/argocd/application-ms-frontend-prod.yaml
sed -i -e "s%NAMESPACE_TO_SED%${CX_NAMESPACE//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_FRONTEND_PROD_TO_SED
sed -i -e "s%GERRIT_INGRESS_TO_SED%${GERRIT_INGRESS//&/\\&}%g" $ARGO_CD_APPLICATION_FILE_MS_FRONTEND_PROD_TO_SED



source ./setup.sh


