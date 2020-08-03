# Model FHIR Proxy (Node, Moleculer, Postgres)
Web: [Yorkshire and Humber Care Record](https://yhcr.org)  
Twitter: [@YHCareRecord](https://twitter.com/YHCareRecord/)

Web: [Synanetics](https://synanetics.com)  
Twitter: [@Synanetics](https://twitter.com/synanetics)

Docker: [synaneticsltd/synfhir-store](https://hub.docker.com/r/synaneticsltd/synfhir-store)  

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

### Git
If you haven't already got it, then please install [git](https://www.git-scm.com). If you prefer, you can install the [github desktop client](https://desktop.github.com)... NOTE: Other git clients are available!

### Docker Desktop
For developers, Docker Desktop is required to run the Model FHIR Proxy. There are lots of documents which describe the installation of [Docker Desktop](https://www.docker.com/products/docker-desktop) and this is all that is needed to run the server on your local machine (for Mac, Linux and Windows 10). Installations on Windows Server 2016, 2019 and Ubuntu are accessible via the links in the [Choose your flavour section](#choose-your-flavour) below.

### Docker Compose
[Docker Compose](https://docs.docker.com/compose/) affords the ability to "spin up" an entire stack of Docker containers in one simple command. The Model FHIR Proxy repo includes a docker-compose.yml file which defines each service along with the docker command to get the container up and running. Installations on Windows Server 2016, 2019 and Ubuntu are accessible via the links in the [Choose your flavour section](#choose-your-flavour) below.

### Node.js (Optional)
[Node](https://nodejs.org/en/) isn't required to run the Model FHIR Proxy, however, this repo comes with npm scripts which make it easier to run the software from a single command line call.

### Development Environment/Editor
The flavour of dev environment is of course entirely up to you... the Model FHIR Proxy ultimately doesn't care! [VS Code](https://code.visualstudio.com), [Atom](https://atom.io) and [Sublime](https://www.sublimetext.com) are extensible, open source and free. Each environment does have decent Docker integration which can be installed via the usual plugin/extension management features.

### Postgres (Windows Server)
[PostgreSQL 11.x (for Windows Server 2012 R2, 2016, 2019)](https://www.postgresql.org/download/windows/) is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

---

## Launching The Model FHIR Proxy

### Get the source (requires Git installed)

1. Either navigate to your local repo directory or create one, e.g. `C:\myrepos\` or `~/Repos`

2. At your command line type (followed by enter): `git clone https://github.com/synanetics/synfhir-store.git`

3. Open the folder in your development environment and take a few minutes to have a look at the code (if you wish).

4. From your command line, type: `git checkout -b my-branch-name` where `my-branch-name` is whatever you want to call it (but please do not call it my-branch-name - lets be creative, people). This will create a local branch that you can change and modify as you see fit. Feel free to push any changes back to the repo under this branch - pull requests are always welcome.

### Choose your flavour

[Linux Containers - Docker Desktop for Mac, Linux and Windows 10](docs/linux.md)

[Windows Containers - Windows Server](docs/windows.md)

[Linux Containers - Ubuntu](docs/ubuntu.md)

### Run the Model FHIR Proxy Postman Collection and Environment
Once the Model FHIR Proxy is up and running, you can try out the FHIR API by executing the following Postman collection (and environment). 

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/a255c0155358261336ff#?env%5BMODEL-FHIR-PROXY-PUBLIC%5D=W3sia2V5IjoiYWNjZXNzX3Rva2VuIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImFsbGVyZ3lJbnRvbGVyYW5jZTFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYXRMYXN0UGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJiYXNlX2ZoaXJfcGF0aCIsInZhbHVlIjoiL2ZoaXIvU1RVMyIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYmF0Y2hfZmlyc3RfdGFyZ2V0X3Rlc3RfcGF0aWVudF9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJiYXRjaF9vcmdhbml6YXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYmF0Y2hfcHJhY3RpdGlvbmVyX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJhdGNoX3NlY29uZF90YXJnZXRfdGVzdF9wYXRpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJhdGNoX3RoaXJkX3RhcmdldF90ZXN0X3BhdGllbnRfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiYnVuZGxlIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJ1bmRsZUlkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImNjcmlTZWFyY2hVcmwiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiY2xpZW50SWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiY2xpZW50U2VjcmV0IiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImNvbmRpdGlvbjFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiY29uc2VudDFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiY3VycmVudCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJjdXJyZW50UGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJlbmNvdW50ZXIxX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImVuY291bnRlcjJfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZW5jb3VudGVyM19pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJlbmNvdW50ZXJfcmVzb3VyY2VfdXJsIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9hbGxlcmd5X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9jb25kaXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX2NvbnNlbnRfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX2VuY291bnRlcl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfbG9jYXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX21lZGljYXRpb25faWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX21lZGljYXRpb25fc3RhdGVtZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9vYnNlcnZhdGlvbl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfb3JnYW5pemF0aW9uX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9wYXRpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF9wb2xpY3lfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX3ByYWN0aXRpb25lcl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfcHJhY3RpdGlvbmVyX3JvbGVfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmhpcl9jcmVhdGVkX3Byb2NlZHVyZV9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJmaGlyX2NyZWF0ZWRfc3Vic2NyaXB0aW9uX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImZoaXJfY3JlYXRlZF90ZXJtc19wb2xpY3lfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiZmlyc3RQYWdlUmVzb3VyY2VJZHMiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaGFzaGVkSW5kZXgiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoiaWFtX3NlcnZlcl9hZGRyZXNzIiwidmFsdWUiOiJodHRwczovL29hdXRoLnNhbmRwaXQueWhjci5uaHMudWsiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImluY2x1ZGVfZW5jb3VudGVyX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImluY2x1ZGVfb3JnYW5pc2F0aW9uX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImluY2x1ZGVfb3JnYW5pemF0aW9uX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImluY2x1ZGVfcHJhY3RpdGlvbmVyX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImluZGV4UmVzb3VyY2VJZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJqd3MiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5Ijoiand0X3Rva2VuIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Imxhc3RUZXN0TkhTTnVtYmVyIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Imxhc3RVcGRhdGVkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Imxhc3RfcGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJsb2NhdGlvbjFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibWVkaWNhdGlvbjFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibWVkaWNhdGlvblN0YXRlbWVudDFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibWVzc2FnZUlkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Im5leHRQYWdlUmVzb3VyY2VJZHMiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibmV4dF9wYWdlIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Im9ic2VydmF0aW9uMV9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJvcmdhbml6YXRpb24xX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQxX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQyX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQzX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQ0X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQ1X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQ2X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQ3X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQ4X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnQ5X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnRfcmVzb3VyY2VfdXJsIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBhdGllbnRfc2VhcmNoX25leHRfcGFnZSIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJwYXRpZW50X3NlYXJjaF9yZXN1bHRfaWRzIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InBvbGljeTFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicG9saWN5Ml9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJwcmFjdGl0aW9uZXIxX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InByYWN0aXRpb25lclJvbGUxX2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InByb2NlZHVyZTFfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicHJveHlfc2VydmVyX2FkZHJlc3MiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicmVnaXN0ZXJlZF9jbGllbnRfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicmVnaXN0ZXJlZF9jbGllbnRfc2VjcmV0IiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlcXVlc3QiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicmVxdWVzdElkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlcXVlc3RlZE9uIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlc291cmNlSWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoicmVzb3VyY2VUeXBlIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InJlc291cmNlX3VybCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJyZXZlcnNlX3Byb3h5X2FkZHJlc3MiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5Ijoic2VhcmNoX2ZpcnN0X3RhcmdldF90ZXN0X3BhdGllbnRfaWQiLCJ2YWx1ZSI6IiIsImVuYWJsZWQiOnRydWV9LHsia2V5Ijoic29ydGVkQnVuZGxlIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InRhcmdldF90ZXN0X2VuY291bnRlcl9pZCIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJ0YXJnZXRfdGVzdF9wYXRpZW50X2lkIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InRvdGFsIiwidmFsdWUiOiIiLCJlbmFibGVkIjp0cnVlfV0=)

---

### Issues/Feedback

Problems when running the code? Feel free to [open an issue](https://github.com/synanetics/synfhir-store/issues) or drop us a line at [support@synanetics.com](mailto:support@synanetics.com)


