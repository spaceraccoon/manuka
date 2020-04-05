# 🍯 Manuka
A modular OSINT honeypot for blue teamers

## Development

In development, the components run on the following ports in their respective containers:

1. `manuka-client`: `3000`
2. `manuka-server`: `8080`
3. `manuka-listener`: `8080`

To allow for the client and server to talk without CORS issues, an additional nginx layer on `localhost:8080` proxy-passes `/api/` to `manuka-server` amd `/` to `manuka-listener`.

### Requirements

See the individual component repositories for their requirements.

1. `docker >= 19.03.8`
2. `docker-compose >= 1.25.4`

### Configure

1. Create a file in `docker/secrets/postgres_password` with the password for Postgres

### Run

1. `docker-compose -f docker-compose.yml -f docker-compose-dev.yml up --build --remove-orphans`