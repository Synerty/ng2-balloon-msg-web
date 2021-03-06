#!/usr/bin/env bash

PACKAGE="ng2-balloon-msg"

set -o nounset
set -o errexit

echo "Compiling TypeScript"
tsc || true

if [ -n "$(git status --porcelain)" ]; then
    echo "There are uncomitted changes, please make sure all changes are comitted" >&2
    exit 1
fi

if ! [ -f "package.json" ]; then
    echo "publish.sh must be run in the directory where package.json is" >&2
    exit 1
fi

VER="${1:?You must pass a version of the format 0.0.0 as the only argument}"

if git tag | grep -q "${VER}"; then
    echo "Git tag for version ${VER} already exists." >&2
    exit 1
fi

echo "Setting version to $VER"

# Update the setup.py
#sed -i "s;^package_version.*=.*;package_version = '${VER}';"  setup.py

# Update the package version
#sed -i "s;.*version.*=.*;__version__ = '${VER}';" ${PACKAGE}/__init__.py
#sed -i "s;.*version.*=.*;__version__ = '${VER}';" docs/conf.py


echo "Updating package version"
npm version $VER

echo "Pushing to Git"
git push
git push --tags

# package the plugin
npm run packagr

echo "Publishing to NPM"
(cd dist && npm publish --access=public)


echo
echo "Done"
echo
