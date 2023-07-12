#!/usr/bin/env bash
set -eu
set -o pipefail

repo_dir_name=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)")

pushd .
cd ${repo_dir_name}/pkg-svcs/backend
npm install
npm test
popd