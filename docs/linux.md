# Model FHIR Proxy (Node, Moleculer, Postgres) - Linux Containers

---

Linux Containers will run on [Docker Desktop](https://www.docker.com/products/docker-desktop) for Mac, Linux and Windows 10. For Windows Server OS then please refer to [Model FHIR Proxy (Node, Moleculer, Postgres) - Windows Containers](windows.md)

## Launching The Model FHIR Proxy

### Get the source

1. Either navigate to your local repo directory or create one, e.g. `C:\myrepos\` or `~/Repos`

2. In your command line type (followed by enter): `git clone https://github.com/synanetics/synfhir-store.git`

3. Open the folder in your development environment and take a few minutes to have a look at the code (if you wish).

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