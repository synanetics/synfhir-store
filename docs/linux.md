# Model FHIR Proxy (Node, Moleculer, Postgres) - Linux Containers

---

For Windows Server OS then please refer to [Model FHIR Proxy (Node, Moleculer, Postgres) - Windows Containers](windows.md). For Ubuntu, please refer to [Model FHIR Proxy (Node, Moleculer, PostGres) - Linux Containers - Ubuntu 18.04 (Bionic)](ubuntu.md)

---

## Launching The Model FHIR Proxy

### Windows 10 Docker Desktop Users
Please make sure that you are running linux containers [Docker for Windows](https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers).

### Configuring the Model FHIR Proxy to connect to Postgres
The linux distribution also deploys up a containerised instance of Postgres which is useful for development. Users will, however, need to set POSTGRES_PASSWORD in the db.env file, as well as updating the PG_CONNECTION in proxy.env to reflect these settings, before launching the Model FHIR Proxy.

> The following instructions detail how to configure a Postgres installation to run with the containerised Model FHIR Proxy on the same machine (Docker host). It is recommended that for production deployments, Postgres is run on its own dedicated server that is either hosted inside your network or securely hosted in the cloud.

From the command line (or a text editor):

1. Change your current directory to run/linux and open the db.env file.

2. Set the POSTGRES_PASSWORD value (after the =).

3. Save the db.env file to keep your changes.

4. Change your current directory to run and open the proxy.env file.

5. Find the setting called PG_CONNECTION - it will look similar to this: `PG_CONNECTION=postgresql://iamonfhir:[PASSWORD]@[DB_HOST]:[DB_HOST_PORT]/fhirstore`.

6. Change `[PASSWORD]` to match POSTGRES_PASSWORD (removing the square brackets).

7. Change `[DB_HOST]` to match the server address of your postgres instance (removing the square brackets). If you are running the containerised version that is part of this repo then this should be `localdb`.

8. Change `[DB_PORT]` to match the TCP/IP port that the target postgres instance is listening (removing the square brackets). If you are running the containerised version that is part of this repo then this should be `5432`.

### Configure SSL
The Model FHIR Proxy contains an open source reverse proxy and load balancer solution called [Traefik](https://containo.us/traefik/). Primarily, the Model FHIR Proxy uses this component as a means to enable HTTPS communication and can be used with both self-signed (for development) and CA signed certificates. To configure the Traefik container:

1. Copy your certificate and private key files to the `/ssl/certs` directory of this repo.

2. Rename your certificate file to `fhir.proxy.crt`

3. Rename your private key file to `fhir.proxy.key`

> The Model FHIR Proxy requires https to run

### Starting the Model FHIR Proxy using [npm](https://www.npmjs.com)
At the command line:

1. Change to the repo directory (if not already there).

2. Execute `npm run linux:proxy:up` to bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode.

3. Execute `npm run linux:proxy:up:detached` to bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode.

4. To tear down (and trash any data created) or stop the server, execute one of: `npm run linux:proxy:down` (to tear down) or `npm run linux:proxy:stop` (to stop). Using the stop command here means that you can simply execute `npm run linux:proxy:start` next time you wish to spin the server up.

5. You can specify the number of Model FHIR Proxy instances to run behind the load balancer by `INSTANCES=n npm run linux:proxy:up` (where n is the desired number of instances).

### Docker Compose
At the command line:

1. Change to the repo directory (if not already there).

2. Change your working directory to run: `cd run/linux`.

3. Bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up`.

4. Or, should you prefer, bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up -d`.

5. To tear the containers down (and trash any data created), simply enter `docker-compose down -v`.

6. You can stop and restart the containers (which will persist data if using the postgres container) by using `docker-compose start` and `docker-compose stop` respectively.

### You're done!!

[Run Postman Tests](../README.md#run-the-model-fhir-proxy-postman-collection-and-environment)