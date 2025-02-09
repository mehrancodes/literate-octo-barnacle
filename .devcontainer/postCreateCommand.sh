# set up php
cd /workspace/src
composer install
cp .env.example .env
php artisan key:generate
touch database/database.sqlite
php artisan migrate

# set up node
curl https://get.volta.sh | bash
source ~/.bashrc
npm install
