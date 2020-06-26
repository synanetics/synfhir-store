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

### Docker
Docker is required to run the Model FHIR Proxy. There are lots of documents which describe the installation of [Docker Desktop](https://www.docker.com/products/docker-desktop) and this is all that is needed to run the server on your local machine (for Mac, Linux and Windows 10). For Windows Server 2016 and 2019 then please follow the instructions for [Docker Enterprise Edition](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server)

### Docker Compose
[Docker Compose](https://docs.docker.com/compose/) affords the ability to "spin up" an entire stack of Docker containers in one simple command. The Model FHIR Proxy repo includes a docker-compose.yml file which defines each service along with the docker command to get the container up and running. Note, Windows Server users should follow the instructions on the `Windows Server Tab` which is about half way down the page.

### Node.js (Optional)
[Node](https://nodejs.org/en/) isn't required to run the Model FHIR Proxy, however, this repo comes with npm scripts which make it easier to run the software from a single command line call.

### Development Environment/Editor
The flavour of dev environment is of course entirely up to you... the Model FHIR Proxy ultimately doesn't care! [VS Code](https://code.visualstudio.com), [Atom](https://atom.io) and [Sublime](https://www.sublimetext.com) are extensible, open source and free. Each environment does have decent Docker integration which can be installed via the usual plugin/extension management features.

### Postgres (Windows Server)
[PostgreSQL 11.x (for Windows Server 2012 R2, 2016, 2019)](https://www.postgresql.org/download/windows/) is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

---

## Launching The Model FHIR Proxy

### Get the source (requres Git installed)

1. Either navigate to your local repo directory or create one, e.g. `C:\myrepos\` or `~/Repos`

2. In your command line type (followed by enter): `git clone https://github.com/synanetics/synfhir-store.git`

3. Open the folder in your development environment and take a few minutes to have a look at the code (if you wish).

4. From your command line, type: `git checkout -b my-branch-name` where `my-branch-name` is whatever you want to call it (but please do not call it my-branch-name - lets be creative, people). This will create a local branch that you can change and modify as you see fit. Feel free to push any changes back to the repo under this branch - pull requests are always welcome.

### Choose your flavour

[Linux Containers - Docker Desktop for Mac, Linux and Windows 10](docs/linux.md)

[Windows Containers - Windows Server](docs/windows.md)

### Run the Model FHIR Proxy Postman Collection and Environment

[Model FHIR Proxy Postman Collection](docs/postman.md)

---

### Issues/Feedback

Problems when running the code? Feel free to [open an issue](https://github.com/synanetics/synfhir-store/issues) or drop us a line at [support@synanetics.com](mailto:support@synanetics.com)


