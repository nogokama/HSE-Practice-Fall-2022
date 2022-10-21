#!/bin/bash

ME='makogon2907'


cp -r *.pdf _gh_pages/

function get_commit_message {
    echo "pdf updates" # TODO copy commit message from target commit
}

commit_message="$(get_commit_message)"

cd _gh_pages

git config user.name "$ME"
git config user.email "$ME@users.noreply.github.com"
git add .
git commit -m "$commit_message"

git push origin gh_pages

