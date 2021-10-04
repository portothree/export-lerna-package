#!/usr/bin/env bash
# Purpose: Export a lerna package to a new repo
#
# Author: Gustavo Porto
# --------------------------------------

SOURCE_REPO_REMOTE_URL=""
NEW_REPO_REMOTE_URL=""
NEW_REPO_PATH=""
PACKAGE_NAME=""

git clone $SOURCE_REPO_REMOTE_URL $NEW_REPO_PATH
cd $NEW_REPO_PATH

# Fetch all tags from ORI
git fetch --tags

# Clear the link to the ORI repository
git remote rm origin

# Now link your local repository to your newly created NEW repository
git remote add origin $NEW_REPO_REMOTE_URL

# Filter repo history and move to root folder
git filter-repo --subdirectory-filter "packages/${PACKAGE_NAME}"

# Now push all your branches and tags 
git push origin --all
git push --tags
