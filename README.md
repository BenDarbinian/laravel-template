# Local Development
### Requirements
- Docker Engine >=20.10.0
- Docker Compose >=2.15.0

### Getting Started
- Set `name` variable in `docker-compose.yml`
- Copy `.env.example` to `.env`
    - `cp .env.example .env`
- Set env values in `.env`
- Start the container
    - `export UID=$(id -u)`
    - `docker-compose up -d --build`
- Install dependencies
    - `docker exec -itu www-data:www-data app composer install`
- Generate the app key
    - `docker exec -itu www-data:www-data app php artisan key:generate`
- Run migrations
    - `docker exec -itu www-data:www-data app php artisan migrate`

### Shutdown
- `docker-compose down`

### Default Credentials
- DB user: `dbu_local / db_secret`
- DB root: `root / db_secretroot`
