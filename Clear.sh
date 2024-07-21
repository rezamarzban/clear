#!/bin/bash

# Install Git if it's not already installed
sudo apt-get install git -y

# Define author identity
USERNAME="rezamarzban"
EMAIL="rezamarzban1987@gmail.com"
git config --global user.email "$EMAIL"
git config --global user.name "$USERNAME"

# Define the repository name and access token
REPO_NAME="clear"
ACCESS_TOKEN="YOUR_ACCESS_TOKEN"
repo_url="https://$ACCESS_TOKEN@github.com/$USERNAME/$REPO_NAME.git"

# Step 1: Clone the Repository
git clone "$repo_url"

# Change directory to the cloned repository
cd "$REPO_NAME"

# Step 2: Create a New Orphan Branch
git checkout --orphan temp-branch

# Step 3: Add All Files and Commit
git add -A
git commit -m "Initial commit"

# Step 4: Delete the Old Branch
git branch -D main

# Step 5: Rename the New Branch to Main
git branch -m main

# Step 6: Force Push the New Main Branch to GitHub
git push -f origin main
