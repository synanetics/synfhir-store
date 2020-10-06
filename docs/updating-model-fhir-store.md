# How to update a Model FHIR Proxy container

---

Updates to the Model FHIR Proxy are released regularly and to ensure that you are running the latest version please follow the instructions below.

---

## Updating The Model FHIR Proxy Docker Container

### Docker Compose

From the command line (Windows users should ensure that they are running either Powershell or cmd with elevated permissions):

1. Change your current directory to either `run/linux` or `run/windows/[VERSION]` (where, if running Windows, version is either 2016 or 2019).

2. Execute: `docker-compose up -d --no-deps --build proxy`

### You're done!!

[Model FHIR Proxy (Node, Moleculer, Postgres)](../README.md)