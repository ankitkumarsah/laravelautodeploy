#!/bin/sh
set -e

echo "Deploying application ..."

    # Update codebase
    git reset -- hard
    
    git pull

    # Install dependencies based on lock file
    composer install --no-interaction --prefer-dist --optimize-autoloader

    # Reload PHP to update opcache
    echo "" | sudo -S service php7.4-fpm reload

echo "Application deployed!"
