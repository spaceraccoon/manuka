# 🍯 Manuka
A modular OSINT honeypot for blue teamers

## Development

In development, the components run on the following ports in their respective containers:

1. `manuka-client`: `3000`
2. `manuka-server`: `8080`
3. `manuka-listener`: `8080`

To allow for the client and server to talk without CORS issues, an additional nginx layer on `localhost:8080` proxy-passes `/api/` to `manuka-server` amd `/` to `manuka-listener`.

In addition, `manuka-listener` operates on the following ports:
1. `8081` for the staged login webpage
2. `8082` for interacting with the staged email

### Requirements

See the individual component repositories for their requirements.

1. `docker >= 19.03.8`
2. `docker-compose >= 1.25.4`
3. `ngok >= 2.3.35`

### Configure

1. Create a file in `docker/secrets/postgres_password` with the password for Postgres.
2. Setup Google account for Gmail to receive emails from social media profiles.
3. Setup Google Cloud Pub/Sub on https://console.cloud.google.com/cloudpubsub for push email functionality (guide: https://developers.google.com/gmail/api/guides/push). The guide will have instructions to create a Cloud project too.
4. Create file `docker/secrets/google_credentials.json` with your project's credentials.
5. Add the topic created on Cloud Pub/Sub to `docker/secrets/google_topic`.
6. Obtain an oauth2 token for your Google account. Manuka requires an oauth2 token the first time it is run. Subsequently, it will automatically refresh the token. Save the token in `docker/secrets/google_oauth2_token.json`.

### Run

1. `docker-compose -f docker-compose.yml -f docker-compose-dev.yml up --build --remove-orphans`
2. Initialize `manuka-listener` gmail push service:
    1. Initialize ngok `./ngok http <manuka-listener port>` and take note of the https URL.
    2. On Google PubSub dashboard left-hand menu, go to *Subscriptions* -> *\<subscription name\>* -> *Edit Subscription* and change the Endpoint URL to *\<ngok https URL\>/notifications*.
    3. Try sending an email from another account to the target Gmail account. You should see `POST /notifications    200 OK` on the `ngrok` console, and `Received push notification` on the Docker console.
