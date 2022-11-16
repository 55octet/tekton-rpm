#!/bin/bash

namespace="bootstrap"
secret_name="github-ssh"
flux_name="bootstrap"

if ! kubectl get ns ${namespace} 1> /dev/null 2>&1 ; then
    kubectl create namespace ${namespace}
fi

if ! kubectl -n bootstrap get secret ${secret_name} 1> /dev/null 2>&1; then
    kubectl -n bootstrap create secret generic ${secret_name} \
        --from-file=identity=id_ed25519_tekton \
        --from-literal=known_hosts="$(ssh-keyscan github.com 2>&1)"
fi

if ! kubectl -n bootstrap get gitrepo ${flux_name} 1> /dev/null 2>&1 | kubectl -n bootstrap get kustomization ${flux_name} 1> /dev/null 2>&1; then
    kubctl create -f tekton/bootstrap.yaml
fi
