#!/bin/sh
set -e

echo "Deploying application ..."

    # Update codebase
    git fetch origin master
    git reset --hard origin/master

    # Install dependencies based on lock file
    composer install --no-interaction --prefer-dist --optimize-autoloader

    # Note: If you're using queue workers, this is the place to restart them.

    # Clear cache
    php artisan optimize

    # Reload PHP to update opcache
    echo "" | sudo -S service php7.4-fpm reload

echo "Application deployed!"