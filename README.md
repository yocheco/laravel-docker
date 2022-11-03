# laravel-docker


## Config

Create laravel project in src
```
laravel new src --jet
```

Copy env to docker
```
cp .env.demo .env
```

Install npm in laravel
```
cd src
npm i

```

Create .env in LARAVEL src/.env
```
cp .env.example .env

```

install dependences composer
```
composer install

```

### Install boostrap
install more info in https://github.com/nascent-africa/jetstrap

install dependence in php
```
composer require nascent-africa/jetstrap --dev

```

Add boostrap in laravel
```
php artisan jetstrap:swap livewire

```

Finalice 
```
npm install && npm run dev

php artisan migrate

```

### Delete register new user in jetstrap

Delete "Features::registration()" in file src/confing/fortify.php

### Webpack

### Dev
in src/ folder run to compile in dev
```
npm run dev
```

### Prod
in src/ folder run to compile in dev
```
npm run prod
```

### Build
```
docker-compose build
```

### Run
```
docker-compose up -d
```
