# Model FHIR Proxy (Node, Moleculer, Postgres) - Windows Containers

---

Windows Containers will run on [Docker Enterprise Edition](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server). For Mac, Linux and Windows 10 please refer to [Model FHIR Proxy (Node, Moleculer, Postgres) - Linux Containers](linux.md)

## Launching The Model FHIR Proxy

### Configuring the Model FHIR Proxy to connect to Postgres
Currently, the Windows Container distribution does not include the ability to run Postgres within a Windows Container. As a result, it is necessary to install Postgres separately but connect to it from the Model FHIR Proxy. To do, so make the following changes to the proxy.env file (located in run/proxy.env):

1. Install [Postgres 11.x x86-64](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads/) if you have not already done so.

2. [Connect to the database server](https://www.pgadmin.org/docs/pgadmin4/4.17/connecting.html) using the PG Admin client and [create a new database](https://www.pgadmin.org/docs/pgadmin4/4.17/database_dialog.html) named `fhirstore` 

3. [Create a new login/group role](https://www.pgadmin.org/docs/pgadmin4/4.17/role_dialog.html). 
  * Enter a name (General tab)
  * Enter a password field (Definition tab)
  * Switch all the options in the Privelges tab to Yes

  The name and password are what the Model FHIR Proxy will use when connecting to the database.

4. 

1. Change to PG_CONNECTION=postgresql://dbuser:dbpassword@dbserveraddress:dbport/fhirstore

2. The dbserveraddress has to be visible to the container - where the database runs on the same machine as the container then you can use "host.docker.internal" as the server address.

### Docker Compose
At the command line:

1. Change to the repo directory (if not already there).

2. Change your working directory to run: `cd run`

3. Bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up`

4. Or, should you prefer, bring the server in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up -d`

5. To tear the containers down, simply enter `docker-compose down`

6. You can stop and restart the containers (which will persist data) by using `docker-compose start` and `docker-compose stop` respectively.

### Starting the Model FHIR Proxy using [npm](https://www.npmjs.com)
At the command line:

1. Change to the repo directory (if not already there).

2. Execute `npm run proxy:up` to bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode.

3. Execute `npm run proxy:up:detached` to bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode.

4. To tear down or stop the server, execute one of: `npm run proxy:down` (to tear down) or `npm run proxy:stop` (to stop). Using the stop command here means that you can simply execute `npm run proxy:start` next time you wish to spin the server up.