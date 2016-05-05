#!/bin/bash

#push to gh-pages
if [[ $TRAVIS_BRANCH == ${working_branch} ]] ; then
  cd _site
  git init

  git config user.name "${user_name}"
  git config user.email "${user_email}"

  git add .
  git commit -m "Deployed by Travis CI."

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${github_user}:${github_password}@${repo_url}" master:gh-pages > /dev/null 2>&1
else
  echo "Invalid branch. You can only deploy from ${working_branch}."
  exit 1
fi
