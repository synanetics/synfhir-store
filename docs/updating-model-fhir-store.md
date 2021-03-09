# How to update a FHIR Appliance container

---

Updates to the FHIR Appliance are released regularly and to ensure that you are running the latest version please follow the instructions below.
If you are using Windows Server then please [read these intructions](updating-model-fhir-store-windows.md)

---

## Updating The FHIR Appliance Docker Container

### Docker Compose

From the command line (Windows users should ensure that they are running either Powershell or cmd with elevated permissions):

1. Change your current directory to `run/linux`

2. Execute: `docker-compose up -d --no-deps --build --pull proxy`

### You're done!!

[FHIR Appliance (Node, Moleculer, Postgres)](../README.md)