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

log "Oh boy, here I go installin' again!"
determine_platform

if ! which brew > /dev/null 2>&1 ; then
  echo "brew not found on \$PATH, installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if ! which ansible-playbook > /dev/null 2>&1 ; then
  echo "ansible-playbook not found on \$PATH, installing"
  brew install ansible
fi

(
  cd "$(dirname "$0")"
  cmd="ansible-playbook -i localhost, --tags ${platform} --connection local playbook.yml"
  $cmd
)
