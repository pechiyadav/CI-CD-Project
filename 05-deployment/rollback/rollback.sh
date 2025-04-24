#!/usr/bin/env bash
set -euo pipefail
ssh_opts="-o StrictHostKeyChecking=no"
remote="$SSH_USER@$SSH_HOST"

echo "Rolling back to image: $ROLLBACK_TAG"

ssh $ssh_opts "$remote" <<EOSSH
  sudo docker pull "$ROLLBACK_TAG"
  sudo docker rm -f fastapi-demo || true
  sudo docker run -d --name fastapi-demo -p 80:8000 "$ROLLBACK_TAG"
EOSSH
