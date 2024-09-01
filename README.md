# clear
Clear commits history in a GitHub branch!

Sometimes your GitHub repository gets messed up with unnecessary commits. The best way is to use `clear.sh` script that doesn't remove corresponding repository changes.

If want to remove last `n` commits in different way that keep corresponding  changes, Run:

```
import random

# Generate a random number for uniqueness
rand_num = random.randint(1000, 9999)
temp_folder_name = f"temp{rand_num}"

# Step 1: Install Git if it's not already installed
!apt-get install git -y

# Step 2: Define author identity
USERNAME = "rezamarzban"
EMAIL = "rezamarzban1987@gmail.com"
!git config --global user.email '{EMAIL}'
!git config --global user.name '{USERNAME}'

# Step 3: Define the repository name and access token
REPO_NAME = "clear"
ACCESS_TOKEN = "YOUR_ACCESS_TOKEN"  # Replace with your actual access token
repo_url = f"https://{ACCESS_TOKEN}@github.com/{USERNAME}/{REPO_NAME}.git"

# Step 4: Clone the Repository
!git clone {repo_url}

# Step 5: Rename the cloned repository folder to "temp" and delete the .git folder inside it
!mv {REPO_NAME} {temp_folder_name}
!rm -rf {temp_folder_name}/.git

# Step 6: Clone the repository again to the original folder name
!git clone {repo_url}

# Change directory to the cloned repository
%cd {REPO_NAME}

# Checkout the main branch
!git checkout main

# Move the branch pointer back by 5 commits
!git reset HEAD~5

# Force push the changes to the remote repository
!git push --force origin main

# Step 7: Delete all files and folders in the cloned repository except the .git folder
!find . -not -name ".git" -not -path "./.git/*" -delete

# Step 8: Copy all files and folders from the "temp" folder to the current repository folder
!cp -r ../{temp_folder_name}/* .

# Step 9: Push the changes to the remote repository
!git add .
!git commit -m "Updated by Reza Marzban"
!git push origin main
```
