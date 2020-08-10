const https = require("https");
const fs = require("fs");

https.globalAgent.options.ca = [fs.readFileSync("./ssl/certs/sandpit-ca.pem")];

https.get("https://mfp.sandpit.yhcr.nhs.uk/fhir/stu3/Patient", ( res ) => {
    console.log(res.statusCode);
    console.log(res.headers);
})