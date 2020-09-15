#!/bin/bash
# get base dir regardless of execution location
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
. $(dirname $SOURCE)/init.sh

minecraftversion=$(cat $basedir/Paper/work/BuildData/info.json | grep minecraftVersion | cut -d '"' -f 4)

basedir
pushRepo PaperDragon-API ${API_REPO} master:ver/${minecraftversion}
pushRepo PaperDragon-Server ${SERVER_REPO} master:ver/${minecraftversion}
pushRepo mc-dev ${MCDEV_REPO} ${paperVer}

# Push Parent to Remotes
branch="$(git symbolic-ref HEAD 2>/dev/null)" || "master"
branch=${branch##refs/heads/}

git push origin ${branch} -f
git push origin ${branch}:mc/${minecraftversion} -f
git push origin ${branch}:ver/${minecraftversion} -f
(
    git ls-remote --exit-code pd-push >> /dev/null
    [[ "$?" == "128" ]] && git remote add pd-push git@github.com:domnian/PaperDragon >> /dev/null
)
[[ "$(git config minecraft.push-${FORK_NAME})" == "1" ]] && (
    git push pd-push master -f
    git push pd-push master:ver/${minecraftversion} -f
)
