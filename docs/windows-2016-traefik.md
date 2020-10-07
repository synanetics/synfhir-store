# Configuring SSL for Windows 2016 Server

---

The following instructions are specific to Windows 2016 Server only. Windows 2019 Server users should follow these instructions: [Configure SSL for Windows 2019](windows.md#configure-ssl).

---

## Install

### Traefik

1. Download the Traefik binary distribution for Windows: [Traefik](https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-binary-distribution)

2. Unzip the file downloaded in step 1 and copy all of the enclosed files to `C:\Program Files\traefik`

> Look for the file name ending `windows_amd64.zip`

3. Open `/ssl/windows/2016/dynamic_conf.toml`

   - On line 4 replace ` Host(``) ` with `Host(`[your-host-name]`)` where `[your-host-name]` is the CN of your SSL server certificate (please ensure you type between the back-tick characters). Save the changes.
   - On line 12 type `"http://[docker-host-ip]:[docker-host-port]"` immediately after the `url=`, where `[docker-host-ip]` is the IP address of your docker host and `[docker-host-port]` is that which the Model FHIR Proxy software is running. Please ensure that the url is enclosed with double quotes.

4. Copy both `/ssl/windows/2016/dynamic_conf.toml` and `/ssl/windows/2016/traefik.toml` to `C:\Program Files\traefik`

5. Copy your SSL server certificate and SSL key file to `C:\Program Files\traefik`. Rename each file to `fhir.proxy.crt` and `fhir.proxy.key` respectively.

6. Open a Powershell console with elevated persmissions and enter `cd C:\Program Files\traefik`.

7. Run the SSL termination proxy by typing `./traefik` followed by enter then minimise the console window. To confirm the SSL proxy is up and running browse to `http://localhost:8080` to view it's configuration. Full details that describe the Traefik dashboard are available [here](https://doc.traefik.io/traefik/operations/dashboard/)

### Start the Model FHIR Proxy

[Model FHIR Proxy (Node, Moleculer, Postgres)](windows.md#starting-the-model-fhir-proxy-using-npm)
