# FHIR Appliance (Node, Moleculer, Postgres)
Web: [Yorkshire and Humber Care Record](https://yhcr.org)  
Twitter: [@YHCareRecord](https://twitter.com/YHCareRecord/)

Web: [Synanetics](https://synanetics.com)  
Twitter: [@Synanetics](https://twitter.com/synanetics)

Docker: [synaneticsltd/synfhir-store](https://hub.docker.com/r/synaneticsltd/synfhir-store)  

---

# What is the FHIR Appliance?
The FHIR Appliance is a FHIR server which is being built by the [Yorkshire and Humber Care Record](https://yhcr.org) (YHCR) project team as part of their work with the [NHS England Local Health and Care Record Exampler](https://www.england.nhs.uk/publication/local-health-and-care-record-exemplars/) (LHCRE) programme. A public git repository will be available soon but for now interested parties and indeed members of the YHCR programme are encouraged to use the software via the docker and node components hosted here. The FHIR Appliance has been developed using a stack of open source software and health care interoperability standards, namely:

[Fast Healthcare Interoperable Resources - FHIR](https://fhir.hl7.org.uk)
Fast Healthcare Interoperability Resources is a standard describing data formats and elements and an application programming interface for exchanging electronic health records. The standard was created by the Health Level Seven International health-care standards organization.

[Moleculer.js](https://moleculer.services)
A Progressive microservices framework for Node.js.

[PostgreSQL](https://www.postgresql.org)
PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and technical standards compliance. It is designed to handle a range of workloads, from single machines to data warehouses or Web services with many concurrent users.

[Docker](https://www.docker.com)
Docker is a set of coupled software-as-a-service and platform-as-a-service products that use operating-system-level virtualization to develop and deliver software in packages called containers.

The FHIR Appliance has been developed in accordance with a series of [technical papers](https://yhcr.org/downloads/) produced by the [YHCR](https://yhcr.org). Each design paper describes a set of "model" software components and architectures that, when realised, can enable health and social care organisations to share data using [FHIR](https://www.hl7.org/fhir/STU3/). 

The FHIR Appliance will keep evolving in step with both the LHCRE and YHCR programmes. The overall aim, however, is that the server will provide an out of the box, open source solution to health and social care organisations who require the ability to share data using FHIR. It is very much hoped that the code base here will be developed by clinicians, engineers, architects and healthcare interoperability standards bodies.

---

# Getting Started
The following steps describe how to get the current version of the FHIR Appliance up and running within your local environment. 

## Pre-requisites

### Git
If you haven't already got it, then please install [git](https://www.git-scm.com). If you prefer, you can install the [github desktop client](https://desktop.github.com)... NOTE: Other git clients are available!

### Docker Desktop
For developers, Docker Desktop is required to run the FHIR Appliance. There are lots of documents which describe the installation of [Docker Desktop](https://www.docker.com/products/docker-desktop) and this is all that is needed to run the server on your local machine (for Mac, Linux and Windows 10). Installations on Windows Server 2016, 2019 and Ubuntu are accessible via the links in the [Choose your flavour section](#choose-your-flavour) below.

### Docker Compose
[Docker Compose](https://docs.docker.com/compose/) affords the ability to "spin up" an entire stack of Docker containers in one simple command. The FHIR Appliance repo includes a docker-compose.yml file which defines each service along with the docker command to get the container up and running. Installations on Windows Server 2016, 2019 and Ubuntu are accessible via the links in the [Choose your flavour section](#choose-your-flavour) below.

### Node.js (Optional)
[Node](https://nodejs.org/en/) isn't required to run the FHIR Appliance, however, this repo comes with npm scripts which make it easier to run the software from a single command line call.

### Development Environment/Editor
The flavour of dev environment is of course entirely up to you... the FHIR Appliance ultimately doesn't care! [VS Code](https://code.visualstudio.com), [Atom](https://atom.io) and [Sublime](https://www.sublimetext.com) are extensible, open source and free. Each environment does have decent Docker integration which can be installed via the usual plugin/extension management features.

### Postgres (Windows Server)
[PostgreSQL 11.x (for Windows Server 2012 R2, 2016, 2019)](https://www.postgresql.org/download/windows/) is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

### Traefik (SSL proxy and load balancer)
[Traefik](https://containo.us/traefik/) is a leading modern reverse proxy and load balancer that makes deploying microservices easy. Traefik integrates with your existing infrastructure components and configures itself automatically and dynamically.

---

## Launching The FHIR Appliance

### Get the source (requires Git installed)

1. Either navigate to your local repo directory or create one, e.g. `C:\myrepos\` or `~/Repos`

2. At your command line type (followed by enter): `git clone https://github.com/synanetics/synfhir-store.git`

3. Open the folder in your development environment and take a few minutes to have a look at the code (if you wish).

4. From your command line, type: `git checkout -b my-branch-name` where `my-branch-name` is whatever you want to call it (but please do not call it my-branch-name - lets be creative, people). This will create a local branch that you can change and modify as you see fit. Feel free to push any changes back to the repo under this branch - pull requests are always welcome.

### SSL Certificates

> The FHIR Appliance requires https to run - if you do not have a CA signed certificate then you can use self-signed certificates for standalone development purposes.

### Choose your flavour

[Linux Containers - Docker Desktop for Mac, Linux and Windows 10](docs/linux.md)

[Windows Containers - Windows Server](docs/windows.md)

[Linux Containers - Ubuntu](docs/ubuntu.md)

### Run the FHIR Appliance Postman Collection and Environment

[FHIR Appliance Postman Collection](docs/postman.md)

### Updating the FHIR Appliance container

[How to update a FHIR Appliance container - Linux](docs/updating-model-fhir-store.md)
[How to update a FHIR Appliance container - Windows Server](docs/updating-model-fhir-store-windows.md)

---

### Issues/Feedback

Problems when running the code? Feel free to [open an issue](https://github.com/synanetics/synfhir-store/issues) or drop us a line at [support@synanetics.com](mailto:support@synanetics.com)


