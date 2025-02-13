#!/usr/bin/env sh
set -eux

# install kubernetes
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d cluster get k3s-default || k3d cluster create --wait
k3d kubeconfig merge --kubeconfig-merge-default

# install kit
curl -q https://raw.githubusercontent.com/kitproj/kit/main/install.sh | sh

# do time consuming tasks, e.g. download deps and initial build
kit build