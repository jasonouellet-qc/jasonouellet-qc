#!/usr/bin/env bash
# bash boilerplate
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
function l { # Log a message to the terminal.
    echo
    echo -e "[$SCRIPT_NAME] ${1:-}"
}

# check if there's already a currently existing feature branch in notehub-js for this branch
# i.e. the altered openapi.yaml file's already been copied there at least once before
#echo "Check if feature branch $BRANCH already exists in Notehub JS"
#git ls-remote --exit-code --heads origin $BRANCH >/dev/null 2>&1
#EXIT_CODE=$?
#echo "EXIT CODE $EXIT_CODE"

#if [[ $EXIT_CODE == "0" ]]; then
  #echo "Git branch '$BRANCH' exists in the remote repository"
  # fetch branches from notehub-js
  #git fetch
  # stash currently copied openapi.yaml
  #git stash
  # check out existing branch from notehub-js
  #git checkout $BRANCH 
  # overwrite any previous openapi.yaml changes with current ones
  #git checkout stash -- .
#else
  #echo "Git branch '$BRANCH' does not exist in the remote repository"
  # create a new branch in notehub-js 
  #git checkout -b $BRANCH
#fi

if [$DEBUG eq 1]; then
  echo "Statut avant add"
  git status
fi

git add -A .
git config user.name github-actions
git config user.email github-actions@github.com

if [$DEBUG eq 1]; then
  echo "Statut avant commit"
  git status
fi

git commit -am "feat: Update Personal profile"
#git push --set-upstream origin $BRANCH

echo "Updated personal profile successfully!"