#!/bin/bash

set -e

cd $WORKDIR

composer install --no-dev --no-interaction --optimize-autoloader

npm i
npm run build

if [ ! -e ".env" ]; then
    cp .env.example .env

    sed -i 's/^DB_CONNECTION=.*/DB_CONNECTION=sqlite/' .env

    touch database/database.sqlite
EOSQL
    php artisan key:generate
    php artisan migrate

    if $SEED; then
      php artisan db:seed
    fi
fi

php artisan serve --host=0.0.0.0 --port=8000