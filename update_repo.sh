#!/bin/bash

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add your SSH key to the agent
ssh-add /c/Users/mohni/.ssh/id_ed25519

# Update submodule 1
cd frontend
git checkout main
git pull origin main
cd ..

# Update submodule 2
cd backend
git checkout main
git pull origin main
cd ..

# Commit the submodule updates in the parent repository
git add frontend backend
git commit -m "Update frontend backend modules"

# Push the changes to the remote repository
git push origin main

# Stop the SSH agent
ssh-agent -k
