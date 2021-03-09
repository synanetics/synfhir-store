# How to update a FHIR Appliance container - Windows Server

---

The Windows Server FHIR Appliances require a base Windows Server image to run and this image is updated as and when patches to the o/s are released by Microsoft.
To ensure that both the Windows Server images, Traefik and FHIR Appliance are using the latest versions then it is far easier to stop the containers, remove the outdated legacy images and restart it.

---

## Updating The FHIR Appliance Docker Container

### Docker Compose

From the command line (Windows users should ensure that they are running either Powershell or cmd with elevated permissions):

1. Change your current directory to `run/windows/[VERSION]` (where version is either 2016 or 2019).

2. Execute: `docker-compose down -v` to stop and remove both the FHIR Appliance and, if using, SSL Proxy/Traefik containers.

3. Execute: `docker rmi -f synaneticsltd/synfhir-store:windows-[VERSION]-latest` (where version is either 2016 or 2019).

4. If using Windows 2019 and Traefk then execute: `docker rmi -f synaneticsltd/synfhir-windows-traefik:ltsc2019`.

5. Execute: `docker-compose up` to pull down the latest images, including the updated Windows base server images, start the FHIR Appliance and, if using, the Traefik SSL proxy containers.

### You're done

[FHIR Appliance (Node, Moleculer, Postgres)](../README.md)