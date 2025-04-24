#!/usr/bin/env bash
set -euo pipefail

# Run on GitLab runner. Requires SSH_* and IMAGE_TAG env vars.
ssh_opts="-o StrictHostKeyChecking=no"
remote="$SSH_USER@$SSH_HOST"

ssh $ssh_opts "$remote" <<'EOSSH'
  set -e
  sudo docker login -u "$DOCKER_REGISTRY_USER" -p "$DOCKER_REGISTRY_PASSWORD" $CI_REGISTRY
  sudo docker pull "$IMAGE_TAG"
  sudo docker rm -f fastapi-demo || true
  sudo docker run -d --name fastapi-demo -p 80:8000 "$IMAGE_TAG"
EOSSH
