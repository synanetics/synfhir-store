# Model FHIR Proxy (Node, Moleculer, PostGres) - Windows Containers

---

 For Mac, Linux and Windows 10 Docker Desktop please refer to [Model FHIR Proxy (Node, Moleculer, PostGres) - Linux Containers](linux.md). For Ubuntu, please refer to [Model FHIR Proxy (Node, Moleculer, PostGres) - Linux Containers - Ubuntu 18.04 (Bionic)](ubuntu.md)

---

## Launching The Model FHIR Proxy

### Windows Server Editions

This installation has been tested against the following Windows Server builds:

- Windows 2016 Standard Edition Build 14393
- Windows 2019 Standard Edition Build 17763

Please ensure that you are using these builds as a minumum.

### Optional pre-requisites that may help...

1. [Install Chrome](https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=en-GB)

2. [Install Notepad++](https://notepad-plus-plus.org)

3. [Install VS Code](https://code.visualstudio.com/download)

### Install Docker Enterprise Edition (Docker EE)
Further instructions for Docker Enterprise Edition can be found [here](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server)

1. Open PowerShell in elevated/administrator mode

2. Update the TLS version so that the server can access the PSRepository. At the command line enter `[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12` (followed by enter to execute the command).

3. At the command line enter `Install-Module -Name DockerMsftProvider -Repository PSGallery` (followed by enter to execute the command).

4. At the command line enter `Install-Package -Name docker -ProviderName DockerMsftProvider` (followed by enter to execute the command).
   
   * When prompted, enter `A` and press enter to Accept All

5. Type `Restart-Computer -Force` followed by enter to execute the command. Probably obvious, but this will restart the server.

6. For Windows Server 2019: when the Server comes back up, run the `hello-world` Docker Windows Container to test the installation by typing `docker run hello-world` in an elevated PowerShell followed by enter.

> Microsoft has deprecated and removed nanoserver for Windows Server 2016. Windows Server 2016 users should test their Docker installation by typing `docker run docker/surprise:latest` in an elevated PowerShell followed by enter.

### Installing and configuring PostGres
Currently, the Windows Container distribution does not include the ability to run PostGres within a Windows Container. As a result, it is necessary to use a separate PostGres instance which can either run on a dedicated machine within your network, on the same machine as the Model FHIR Proxy (Docker host) or in the cloud. The following instructions describe the installation and configuration steps necessary to connect the Model FHIR Proxy to an instance of PostGres running on the Docker host. If you already have an instance installed then you can skip installation step 1.

> The following instructions detail how to configure a PostGres installation to run with the containerised Model FHIR Proxy on the same machine (Docker host). It is recommended that for production deployments, PostGres is run on its own dedicated server that is either hosted inside your network or securely hosted in the cloud as per your own organization's policy and standards. 

1. Install [PostGres 11.x x86-64](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads/)

> After installation, please check that Windows Defender Firewall, or any firewall software running on the server, allows inbound TCP/IP and UDP from external sources to the `PostGreSQL Server` service (port 5432).

2. [Connect to the database server](https://www.pgadmin.org/docs/pgadmin4/4.17/connecting.html) using the [pgAdmin client](https://www.pgadmin.org) and [create a new database](https://www.pgadmin.org/docs/pgadmin4/4.17/database_dialog.html) named `fhirstore` 

3. [Create a new login/group role](https://www.pgadmin.org/docs/pgadmin4/4.17/role_dialog.html). 

  * Enter `iamonfhir` in the name field (General tab)
  * Enter a password field (Definition tab)
  * Switch all the options in the Privileges tab to Yes

4. Select the `fhirstore` database and [change the owner](https://www.pgadmin.org/docs/pgadmin4/4.23/user_mapping_dialog.html) to `iamonfhir` 

> The name and password are what the Model FHIR Proxy will use when connecting to the database.

### Fetch the Docker Host IP Address
Requests to PostGres from the Model FHIR Proxy will "appear" to the server as if they are coming from an external machine/host. It is therefore necessary to ascertain the IPv4 address of the Docker host so that it can be used as the `[DB_HOST]` in the `PG_CONNECTION` Model FHIR Proxy environment variable. The IPv4 address will also be required to update the [pg_hba.conf](https://www.postgresql.org/docs/9.2/auth-pg-hba-conf.html) to allow non-local connections from the Docker host machine.

In a PowerShell:

1. Execute: `Resolve-DNSName (Hostname) | Select IPAddress | select IPAddress -expandproperty IPAddress | select -last 1`

2. Make a note of the Docker host's IP address.

### Update [pg_hba.conf](https://www.postgresql.org/docs/9.2/auth-pg-hba-conf.html) to allow connections from the Docker host

1. Stop the PostGreSQL Server Service

2. Open `[PostGres Installation Path]\PostGreSQL\11\data\pg_hba.conf` in a text editor.

3. Under the section called "IPv4 local connections" add a new entry directly underneath line 80 (replacing `[DOCKER_HOST_IP]` with the IPv4 address found in step 1 above):

`host     all       all       [DOCKER_HOST_IP]/32     password`

4. Save the file and restart the PostGreSQL Server Service.

### Configuring the Model FHIR Proxy to connect to PostGres
In pgAdmin:

1. Select the fhirstore database and [Open the pgAdmin Query Tool](https://www.pgadmin.org/docs/pgadmin4/latest/query_tool.html).

2. In the Query Tool window, copy and paste the SQL from the run/windows/db/schema directory and click the [Execute/Refresh](https://www.pgadmin.org/docs/pgadmin4/latest/query_tool_toolbar.html#query-execution) button.

3. Go back to the repo folder open run/proxy.env

4. Find the setting called PG_CONNECTION - it will look similar to this: `PG_CONNECTION=postgresql://iamonfhir:[PASSWORD]@[DB_HOST]:[DB_HOST_PORT]/fhirstore`

5. Change `[PASSWORD]` to match the password configured in step 3 of the Installation and configuring PostGres instructions above (removing the square brackets).

6. Change `[DB_HOST]` to match the server address of your PostGres instance (removing the square brackets) - note if you are running PostGres on the same machine as the Docker host then this will be the IPv4 address found in the "Fetch the Docker Host IP Address" section above. 

7. Change `[DB_PORT]` to match the TCP/IP port that the target PostGres instance is listening for connections (removing the square brackets). By default, this is `5432`.

### Configure SSL

> Windows 2016 Server users please follow these instructions that are specific to your environment: [Configuring SSL for Windows 2016 Server](windows-2016-traefik.md)

The Model FHIR Proxy contains an open source reverse proxy and load balancer solution called [Traefik](https://containo.us/traefik/). Primarily, the Model FHIR Proxy uses this component as a means to enable HTTPS communication and can be used with both self-signed (for development) and CA signed certificates. To configure the Traefik container:

1. Copy your certificate and private key files to the `/ssl/certs` directory of this repo.

2. Rename your certificate file to `fhir.proxy.crt`

3. Rename your private key file to `fhir.proxy.key`

4. Open `windows/[os]/.env` and set the `SSL_CERTIFICATE_CN` environment variable to the server name where the certificate is installed (where `[os]` is one of 2016 or 2019 depending on your Windows Server version)

> The Model FHIR Proxy requires https to run

### Starting the Model FHIR Proxy using [npm](https://www.npmjs.com)
At the command line (where `[os]` is one of 2016 or 2019 depending on your Windows Server version):

1. Change to the repo directory (if not already there), e.g. `cd C:\repos\synfhir-store`.

2. Execute `npm run windows:[os]:proxy:up` to bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode.

3. Execute `npm run windows:[os]:proxy:up:detached` to bring the server up in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode.

4. To tear down or stop the server, execute one of: `npm run windows:[os]:proxy:down` (to tear down) or `npm run windows:[os]:proxy:stop` (to stop). Using the stop command here means that you can simply execute `npm run windows:[os]:proxy:start` next time you wish to spin the server up.

### Docker Compose
At the command line (where `[os]` is one of 2016 or 2019 depending on your Windows Server version):

1. Change to the repo directory (if not already there), e.g. `cd C:\repos\synfhir-store`.

2. Change your working directory to run: `cd run/windows/[os]`.

3. Bring the server up in [interactive](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up`.

4. Or, should you prefer, bring the server in [detached](https://docs.docker.com/engine/reference/commandline/exec/) mode, by executing `docker-compose up -d`.

5. To tear the containers down, simply enter `docker-compose down`.

6. You can stop and restart the containers by using `docker-compose start` and `docker-compose stop` respectively.

### You're done!!

[Run Postman Tests](../README.md#run-the-model-fhir-proxy-postman-collection-and-environment)
