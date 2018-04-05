# Local GIT repositories

This folder is for local file-based Git repositories.
Store bare file-based Git repositories here.

Create repository:

    git init --bare ~/.git-local/MyProject.git

Add origin and push:

    mkdir ./MyProject && cd ./MyProject
    git init
    touch README.md
    git add .
    git commit -m "Initial commit"
    git remote add origin file://${HOME}/.git-local/MyProject
    git push origin master

Or clone, modify and push:

    git clone file://${HOME}/.git-local/MyProject
    git push origin master
