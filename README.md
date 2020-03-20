# 🍯 manuka
A modular OSINT honeypot for blue teamers

## Development

In development, the components run on the following ports on `localhost`:

1. `manuka-client`: `3000`
2. `manuka-server`: `3001`
3. `manuka-listener`: `3002`

To allow for the client and server to talk without CORS issues, an additional nginx layer proxy-passes `/api/` from port `3003` to port `3001` and `/` to port `3000`.

### Requirements

See the individual component repositories for their requirements.

1. `nginx >= 1.17.9`

### Run

1. `./start-dev.sh`; follow the instructions to start the individual components