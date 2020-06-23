-- Database: fhirstore
	
CREATE TABLE public."ResourceData"
(
    "ResourceType" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceID" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "Resource" json,
    "VersionID" integer,
    "LastUpdated" timestamp with time zone,
    CONSTRAINT "ResourceData_pkey" PRIMARY KEY ("ResourceType", "ResourceID")
)

TABLESPACE pg_default;

ALTER TABLE public."ResourceData"
    OWNER to iamonfhir;

GRANT ALL ON TABLE public."ResourceData" TO iamonfhir;

-- Table: public."ResourceIndex"

-- DROP TABLE public."ResourceIndex";

CREATE TABLE public."ResourceIndex"
(
    "ResourceType" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceID" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "SearchTerm" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "SearchType" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ValueType" character varying COLLATE pg_catalog."default",
    "ValueId" character varying COLLATE pg_catalog."default",
    "ValueUrl" character varying COLLATE pg_catalog."default",
    "ValueDisplay" character varying COLLATE pg_catalog."default",
    "ValueNumber" numeric,
    "ValueSystem" character varying COLLATE pg_catalog."default",
    "ValueCode" character varying COLLATE pg_catalog."default",
    "ValueUri" character varying COLLATE pg_catalog."default",
    "ValueStartDate" timestamp with time zone,
    "ValueEndDate" timestamp with time zone,
    "ValueText" character varying COLLATE pg_catalog."default",
    "ValueString" character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public."ResourceIndex"
    OWNER to iamonfhir;

GRANT ALL ON TABLE public."ResourceIndex" TO iamonfhir;

CREATE TABLE public."ResourceVersion"
(
    "ResourceType" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceID" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "VersionID" integer NOT NULL,
    "Resource" json,
    "LastUpdated" timestamp with time zone,
    "IsDeleted" boolean DEFAULT false,
    CONSTRAINT "ResourceVersion_pkey" PRIMARY KEY ("ResourceType", "ResourceID", "VersionID")
)

TABLESPACE pg_default;

ALTER TABLE public."ResourceVersion"
    OWNER to iamonfhir;

GRANT ALL ON TABLE public."ResourceVersion" TO iamonfhir;

CREATE TABLE public."QueryCache"
(
    id character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "RowNumber" integer NOT NULL,
    "Resource" json,
    "Expires" timestamp with time zone,
    "ResourceType" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceID" character varying(64) COLLATE pg_catalog."default",
    CONSTRAINT "QueryCache_pkey" PRIMARY KEY (id, "ResourceType", "RowNumber")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
 
ALTER TABLE public."QueryCache"
    OWNER to iamonfhir;
 
GRANT ALL ON TABLE public."QueryCache" TO iamonfhir;

CREATE TABLE public."AsyncIncludes"
(
    id character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceType" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceID" character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "Resource" json,
    "Expires" timestamp with time zone,
    CONSTRAINT "AsyncIncludes_pkey" PRIMARY KEY (id, "ResourceType", "ResourceID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

 
ALTER TABLE public."AsyncIncludes"
    OWNER to iamonfhir;

GRANT ALL ON TABLE public."AsyncIncludes" TO iamonfhir;

CREATE TABLE public."AsyncRequest"
(
    id character varying(64) COLLATE pg_catalog."default" NOT NULL,
    data json,
    CONSTRAINT "AsyncRequest_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."AsyncRequest"
    OWNER to iamonfhir;

GRANT ALL ON TABLE public."AsyncRequest" TO iamonfhir;

CREATE TABLE public."QueryDetails"
(
    id character varying(64) COLLATE pg_catalog."default" NOT NULL,
    "ResourceType" character varying(64) COLLATE pg_catalog."default",
    "Expires" timestamp with time zone,
    "Query" json,
    "Total" integer,
    "PageSize" integer,
    CONSTRAINT "QueryDetails_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

 
ALTER TABLE public."QueryDetails"
    OWNER to iamonfhir;

 
GRANT ALL ON TABLE public."QueryDetails" TO iamonfhir;