# Model FHIR Proxy (Node, Moleculer, Postgres) - Windows Containers

---

Windows Containers will run on [Docker Enterprise Edition](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server). For Mac, Linux and Windows 10 please refer to [Model FHIR Proxy (Node, Moleculer, Postgres) - Linux Containers](linux.md)

---

## Launching The Model FHIR Proxy

### Optional pre-requisites that may help...

1. [Install Chrome](https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=en-GB)

2. [Install Notepad++](https://notepad-plus-plus.org)

3. [Install VS Code](https://code.visualstudio.com/download)

### Install Docker Enterprise Edition (Docker EE)
Further instructions for Docker Enterprise Edition can be found [here](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server)

1. Open PowerShell in elevated/administrator mode

2. At the command line enter `Install-Module -Name DockerMsftProvider -Repository PSGallery` followed by return.

3. At the command line enter `Install-Package -Name docker -ProviderName DockerMsftProvider` followed by return.
   
   * When prompted, enter `A` and return to Accept All

4. Execute: `Restart-Computer -Force`

5. When the Server comes back up, run the `hello-world` Docker Windows Container to test the installation by executing `docker run hello-world` followed by return.

### Installing and configuring Postgres
Currently, the Windows Container distribution does not include the ability to run Postgres within a Windows Container. As a result, it is necessary to use a separate Postgres instance which can either run within your network, on the same machine as the Model FHIR Proxy or in the cloud. The following instructions describe the installation and configuration steps necessary to connect the Model FHIR Proxy to an instance of Postgres - if you already have an instance installed then you can skip installation step 1.

1. Install [Postgres 11.x x86-64](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads/)

2. [Connect to the database server](https://www.pgadmin.org/docs/pgadmin4/4.17/connecting.html) using the [pgAdmin client](https://www.pgadmin.org) and [create a new database](https://www.pgadmin.org/docs/pgadmin4/4.17/database_dialog.html) named `fhirstore` 

3. [Create a new login/group role](https://www.pgadmin.org/docs/pgadmin4/4.17/role_dialog.html). 

  * Enter `iamonfhir` in the name field (General tab)
  * Enter a password field (Definition tab)
  * Switch all the options in the Privelges tab to Yes

  The name and password are what the Model FHIR Proxy will use when connecting to the database.

### Configuring the Model FHIR Proxy to connect to Postgres
In pgAdmin:

1. Select the fhirstore database and [Open the pgAdmin Query Tool](https://www.pgadmin.org/docs/pgadmin4/latest/query_tool.html)

2. In the Query Tool window, copy and paste the SQL from the run/windows/db/schema directory and click the [Execute/Refresh](https://www.pgadmin.org/docs/pgadmin4/latest/query_tool_toolbar.html#query-execution) button.

3. Go back to the repo folder open run/proxy.env

4. Find the setting called PG_CONNECTION - it will look similar to this: `PG_CONNECTION=postgresql://iamonfhir:[PASSWORD]@[DB_HOST]:[DB_HOST_PORT]/fhirstore`

5. Change `[PASSWORD]` to match the password configured in step 3 (removing the square brackets)

6. Change `[DB_HOST]` to match the server address of your postgres instance (removing the square brackets).

7. Change `[DB_PORT]` to match the TCP/IP port that the target postgres instance is listening (removing the square brackets). By default, this is`5432`

### Starting the Model FHIR Proxy using [npm](https://www.npmjs.com)
At the command line:

1. Change to the repo directory (if not already there).

2. Execute `npm run windows:proxy:up` to bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode.

3. Execute `npm run windows:proxy:up:detached` to bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode.

4. To tear down or stop the server, execute one of: `npm run windows:proxy:down` (to tear down) or `npm run windows:proxy:stop` (to stop). Using the stop command here means that you can simply execute `npm run windows:proxy:start` next time you wish to spin the server up.

### Docker Compose
At the command line:

1. Change to the repo directory (if not already there).

2. Change your working directory to run: `cd run/windows`

3. Bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up`

4. Or, should you prefer, bring the server in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up -d`

5. To tear the containers down, simply enter `docker-compose down`

6. You can stop and restart the containers by using `docker-compose start` and `docker-compose stop` respectively.

### Your done!!

[Run Postman Tests](../README.md)
