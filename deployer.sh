#!/bin/sh
set -e

echo "Deploying application ..."

    # Update codebase
    git stash
    
    git reset -- hard
    
    git pull

    # Install dependencies based on lock file
    composer install

echo "Application deployed!"
