#!/bin/bash
# get base dir regardless of execution location
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
basedir="../"
. $(dirname $SOURCE)/init.sh

paperVer=$(cat current-paper)

pushRepo PaperDragon-API $API_REPO master
pushRepo PaperDragon-Server $SERVER_REPO master
pushRepo mc-dev $MCDEV_REPO $paperVer

# Push Parent to Two Remotes
function pushOrigin {
  cd "$basedir"
  git push origin master -f
}

function pushBitbucket {
  cd "$basedir"
  git push bb-push master -f
}

function pushGithub {
  cd "$basedir"
  git push gh-push master -f
}

pushOrigin
pushBitbucket
pushGithub
