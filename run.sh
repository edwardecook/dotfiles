#!/usr/bin/env bash

set -euo pipefail

determine_platform() {
  platform="unknown"
  if [[ "$(uname)" == "Linux" ]]; then
    platform="linux"
  elif [[ "$(uname)" == "Darwin" ]]; then
    platform="macos"
  else
    echo "Unknown OS"
    exit 1
  fi
}


log() {
  echo
  echo "----------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------"
  echo
}

install_ansible() {
  if [[ "$platform" == "linux" ]]; then
    sudo apt install ansible -y
  elif [[ "$platform" == "macos" ]]; then
    log "Installing/upgrading Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install ansible
  fi
}

log "Oh boy, here I go installin' again!"
determine_platform

if ! which ansible-playbook > /dev/null 2>&1 ; then
  echo "ansible-playbook not found on \$PATH, installing"
  install_ansible
fi

(
  cd "$(dirname "$0")"
  cmd="ansible-playbook -i localhost, --tags ${platform} --con local playbook.yml"
  $cmd
)
