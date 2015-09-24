#!/bin/bash
# go to the content directory and create a *new* Git repo
cd content

# Remove possible existing git repo. We'll replace entire wiki
rm -rf .git

# Init new repo
git init

# Add origin
git remote add origin git@github.com:dmachat/angular-webpack-cookbook.wiki.git

# Reset any local changes
git clean -fd
git reset --hard HEAD

# Update from remote wiki
git pull origin master:master

# Finally remove the git repository to keep changes versioned in the parent repo
rm -rf .git

# Some tweaks to make this work with both the wiki and the gitbook output
mv _Sidebar.md SUMMARY.md
mv Home.md README.md
sed -i 's/)/\.md)/g' SUMMARY.md
