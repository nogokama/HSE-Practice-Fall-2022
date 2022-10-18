#!/bin/bash

ME='makogon2907'

cp -r main.pdf _gh_pages/article.pdf

function get_commit_message {
    echo "pdf updates" # TODO copy commit message from target commit
}

commit_message="$(get_commit_message)"

cd _gh_pages

git config user.name "$ME"
git config user.email "$ME@users.noreply.github.com"
git add resume.pdf
git commit --allow-empty -m "$commit_message"

git push origin gh_pages

