# Model FHIR Proxy (Node, Moleculer, Postgres)
Yorkshire and Humber Care Record](https://yhcr.org)

Twitter: [@YHCareRecord](https://twitter.com/YHCareRecord/)

---

# What is the Model FHIR Proxy?
The Model FHIR Proxy is a FHIR server which is being built by the [Yorkshire and Humber Care Record](https://yhcr.org) (YHCR) project team as part of their work with the [NHS England Local Health and Care Record Exampler](https://www.england.nhs.uk/publication/local-health-and-care-record-exemplars/) (LHCRE) programme. A public git repository will be available soon but for now interested parties and indeed members of the YHCR programme are encouraged to use the software via the docker and node components hosted here. The Model FHIR Proxy has been developed using a stack of open source software and health care interoperability standards, namely:

[Fast Healthcare Interoperable Resources - FHIR](https://fhir.hl7.org.uk)
Fast Healthcare Interoperability Resources is a standard describing data formats and elements and an application programming interface for exchanging electronic health records. The standard was created by the Health Level Seven International health-care standards organization.

[Moleculer.js](https://moleculer.services)
A Progressive microservices framework for Node.js.

[PostgreSQL](https://www.postgresql.org)
PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and technical standards compliance. It is designed to handle a range of workloads, from single machines to data warehouses or Web services with many concurrent users.

[Docker](https://www.docker.com)
Docker is a set of coupled software-as-a-service and platform-as-a-service products that use operating-system-level virtualization to develop and deliver software in packages called containers.

The Model FHIR Proxy is being developed in accordance to a series of [technical papers](https://yhcr.org/downloads/) produced by the [YHCR](https://yhcr.org). Each design paper describes a set of "model" software components and architectures that, when realised, can enable health and social care organisations to share data using [FHIR](https://www.hl7.org/fhir/STU3/). 

The Model FHIR Proxy is very much a work in progress and will keep evolving in step with both the LHCRE and YHCR programmes. The overall aim, however, is that the server will provide an out of the box, open source solution to health and social care organisations who require the ability to share data using FHIR. It is very much hoped that the code base here will be developed by clinicians, engineers, architects and healthcare interoperability standards bodies.

---

# Getting Started
The following steps describe how to get the current version of the Model FHIR Proxy up and running within your local environment. 

## Pre-requisites

### Docker
Docker is required to run ROQR. There are lots of documents which describe the installation of [Docker Desktop](https://www.docker.com/products/docker-desktop) and this is all that is needed to run the server on your local machine.

### Docker Compose
[Docker Compose](https://docs.docker.com/compose/) affords the ability to "spin up" an entire stack of Docker containers in one simple command. The ROQR repo includes a docker-compose.yml file which defines each service along with the docker command to get the container up and running.

### Node.js (Optional)
[Node](https://nodejs.org/en/) isn't required to run the Model FHIR Proxy, however, this repo comes with npm scripts which make it easier to run the software from a single command line (see below).

### Development Environment/Editor
The flavour of dev enviroment is of course entirely up to you... the Model FHIR Proxy ultimately doesn't care! [VS Code](https://code.visualstudio.com), [Atom](https://atom.io) and [Sublime](https://www.sublimetext.com), are extensible, open source and free. Each environment does have decent Docker integration which can be installed via the usual plugin/extension management features.

---

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

### Postman Collection and Environment
Once the Model FHIR Proxy is up and running, you can try out the FHIR API by executing the following Postman collection (and environment). 
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/dc0824e925ddb1d4cf9c#?env%5BMODEL-FHIR-PROXY%5D=W3sia2V5IjoiYXRMYXN0UGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJiYXNlX2ZoaXJfcGF0aCIsInZhbHVlIjoiL2ZoaXIvU1RVMyIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYmF0Y2hfZmlyc3RfdGFyZ2V0X3Rlc3RfcGF0aWVudF9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJiYXRjaF9vcmdhbml6YXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYmF0Y2hfcHJhY3RpdGlvbmVyX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJhdGNoX3NlY29uZF90YXJnZXRfdGVzdF9wYXRpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJhdGNoX3RoaXJkX3RhcmdldF90ZXN0X3BhdGllbnRfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYnVuZGxlIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJ1bmRsZUlkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImNjcmlTZWFyY2hVcmwiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiY3VycmVudCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJjdXJyZW50UGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJlbmNvdW50ZXJfcmVzb3VyY2VfdXJsIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9hbGxlcmd5X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9jb25kaXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX2NvbnNlbnRfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX2VuY291bnRlcl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfbG9jYXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX21lZGljYXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX21lZGljYXRpb25fc3RhdGVtZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9vYnNlcnZhdGlvbl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfb3JnYW5pemF0aW9uX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9wYXRpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9wb2xpY3lfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX3ByYWN0aXRpb25lcl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfcHJhY3RpdGlvbmVyX3JvbGVfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX3Byb2NlZHVyZV9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfc3Vic2NyaXB0aW9uX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF90ZXJtc19wb2xpY3lfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmlyc3RQYWdlUmVzb3VyY2VJZHMiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaGFzaGVkSW5kZXgiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaW5jbHVkZV9lbmNvdW50ZXJfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaW5jbHVkZV9vcmdhbmlzYXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaW5jbHVkZV9vcmdhbml6YXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaW5jbHVkZV9wcmFjdGl0aW9uZXJfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaW5kZXhSZXNvdXJjZUlkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Imp3dF90b2tlbiIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJsYXN0VGVzdE5IU051bWJlciIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJsYXN0VXBkYXRlZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJsYXN0X3BhZ2UiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibWVzc2FnZUlkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Im5leHRQYWdlUmVzb3VyY2VJZHMiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibmV4dF9wYWdlIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnRfcmVzb3VyY2VfdXJsIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnRfc2VhcmNoX25leHRfcGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJwYXRpZW50X3NlYXJjaF9yZXN1bHRfaWRzIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InByb3h5X3NlcnZlcl9hZGRyZXNzIiwidmFsdWUiOiJodHRwOi8vbG9jYWxob3N0OjMwMDEiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlZ2lzdGVyZWRfY2xpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlZ2lzdGVyZWRfY2xpZW50X3NlY3JldCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJyZXF1ZXN0IiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlcXVlc3RJZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJyZXF1ZXN0ZWRPbiIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJyZXNvdXJjZUlkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlc291cmNlVHlwZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJyZXNvdXJjZV91cmwiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicmV2ZXJzZV9wcm94eV9hZGRyZXNzIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InNlYXJjaF9maXJzdF90YXJnZXRfdGVzdF9wYXRpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InNvcnRlZEJ1bmRsZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJ0YXJnZXRfdGVzdF9lbmNvdW50ZXJfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoidGFyZ2V0X3Rlc3RfcGF0aWVudF9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJ0b3RhbCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX1d)