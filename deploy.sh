#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

mkdir deploy
cd deploy

git init
git config user.name "Lucas Gautheron"
git config user.email "lucas.gautheron@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/Insoumis/tribune.insoumis.online.git"
git fetch upstream
git fetch upstream master

nikola github_deploy
