#!/bin/bash

npm config set scripts-prepend-node-path true

echo "LATEST_MS_COMMIT: ${LATEST_MS_COMMIT}"

. prepare_vscode.sh

cd vscode || exit

yarn monaco-compile-check
yarn valid-layers-check

yarn gulp compile-build
yarn gulp compile-extensions-build
yarn gulp minify-vscode

yarn gulp "vscode-linux-${VSCODE_ARCH}-min-ci"
yarn gulp "vscode-linux-${VSCODE_ARCH}-build-deb"
yarn gulp "vscode-linux-${VSCODE_ARCH}-build-rpm"
. ../create_appimage.sh
