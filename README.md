# laravel-docker


### Config

Create laravel app in src
```
laravel new src --jet
```

Copy env to docker
```
cp .env.demo .env
```

Install npm
```
cd src
npm i

```
### Build
```
docker-compose build
```

### Run
```
docker-compose up -d
```

# Install jetstrap
```
composer require laravel/jetstream
php artisan jetstrap:swap livewire
```
