#!/bin/bash
set -eo pipefail
set +x

source DOCKER_DEPLOY_ENV

echo "--- Build/Release docker artifact"
scripts/release-docker.sh --service "${CODA_SERVICE}" --version "${CODA_VERSION}"\
 --extra-args "--build-arg coda_version=${CODA_DEB_VERSION} --build-arg deb_repo=${CODA_DEB_REPO}"
scripts/release-docker.sh --service "coda-rosetta" --version "${CODA_VERSION}"\
 --extra-args "--build-arg DUNE_PROFILE=dev --build-arg CODA_BRANCH=${CODA_GIT_BRANCH}"

