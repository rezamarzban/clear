# clear
Clear commits history in a GitHub branch!

Sometimes your GitHub repository gets messed up with unnecessary commits. The best way is to use `clear.sh` script that doesn't remove corresponding repository changes.

If want to remove last `n` commits in different way that remove corresponding repository changes also, Run:

```
# Install Git if it's not already installed
!apt-get install git -y

# Define author identity
USERNAME = "rezamarzban"
EMAIL = "rezamarzban1987@gmail.com"
!git config --global user.email '{EMAIL}'
!git config --global user.name '{USERNAME}'

# Define the repository name and access token
REPO_NAME = "clear"
ACCESS_TOKEN = "YOUR_ACCESS_TOKEN"
repo_url = f"https://{ACCESS_TOKEN}@github.com/{USERNAME}/{REPO_NAME}.git"

# Step 1: Clone the Repository
!git clone {repo_url}

# Change directory to the cloned repository
%cd {REPO_NAME}

# Checkout the main branch
!git checkout main

# Move the branch pointer back by one commit, it can be changed to any number to remove last n commits!
!git reset HEAD~1

# Force push the changes to the remote repository
!git push --force origin main
```
