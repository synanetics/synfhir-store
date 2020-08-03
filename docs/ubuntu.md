# Model FHIR Proxy (Node, Moleculer, PostGres) - Linux Containers - Ubuntu 18.04 (Bionic)

---

For Windows Server OS then please refer to [Model FHIR Proxy (Node, Moleculer, Postgres) - Windows Containers](windows.md). For Mac, Linux and Windows 10 Docker Desktop please refer to [Model FHIR Proxy (Node, Moleculer, PostGres) - Linux Containers](linux.md).

---

## Launching The Model FHIR Proxy

### Ubuntu Editions

This installation has been tested against the following Ubuntu version:

- Ubuntu 18.04 LTS (Bionic Beaver or Bionic)

### Optional pre-requisites that may help...

1. Nano (Text Editor) - `sudo apt install nano`

### Install NPM
1. At the command line, `sudo apt install npm`

### Install Docker-Compose
1. At the command line, `sudo apt install docker-compose`

### Install Docker
The excellent set of original instructions that the following are based upon are available [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)

1. Update existing packages: `sudo apt update`

2. Install pre-requisite packages: `sudo apt install apt-transport-https ca-certificates curl software-properties-common`

3. Add the GPG key for the official Docker repository: `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`

4. Add the Docker repo to apt sources: `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"`

5. Update the package database with Docker packages: `sudo apt update`

6. Install Docker: `sudo apt install docker-ce`

7. Docker should now be installed and the daemon started. Verify by: `sudo systemctl status docker`

### Configuring the Model FHIR Proxy to connect to Postgres
The linux distribution also deploys up a containerised instance of Postgres. Users will, however, need to set POSTGRES_PASSWORD in the db.env file, as well as updating the PG_CONNECTION in proxy.env to reflect these settings, before launching the Model FHIR Proxy.

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

### Starting the Model FHIR Proxy using [npm](https://www.npmjs.com)
At the command line:

1. Change to the repo directory (if not already there).

2. Execute `npm run linux:proxy:up` to bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode.

3. Execute `npm run linux:proxy:up:detached` to bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode.

4. To tear down (and trash any data) or stop the server, execute one of: `npm run linux:proxy:down` (to tear down) or `npm run linux:proxy:stop` (to stop). Using the stop command here means that you can simply execute `npm run linux:proxy:start` next time you wish to spin the server up.

### Docker Compose
At the command line:

1. Change to the repo directory (if not already there).

2. Change your working directory to run: `cd run/linux`.

3. Bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up`.

4. Or, should you prefer, bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up -d`.

5. To tear the containers down (and trash any data), simply enter `docker-compose down -v`.

6. You can stop and restart the containers (which will persist data if using the postgres container) by using `docker-compose start` and `docker-compose stop` respectively.

### You're done!!

[Run Postman Tests](../README.md#run-the-model-fhir-proxy-postman-collection-and-environment)
