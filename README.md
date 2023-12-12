# typo-compose
[![part of Typo ecosystem](https://img.shields.io/badge/Typo%20ecosystem-typo_compose-blue?style=flat&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAACV0lEQVR4nO3dPUrDYByA8UQ8g15AI+gsOOnmrufoIBT0DAUFB+/R3bFTobOCwQvoJSouNcObhHyZ9n2eHwiirW3Th79J2iaJJEmSJEmSJIC06iGu1+vgz9M0Df9CY6t8PkP2fMrYDADOAOAMAM4A4OrWGl3bj0Pp8+wEgDMAuP2uD//w7I6+DEf19fbc6eadAHAGAGcAcAYAZwBwnbcCTrIj+jL8Fx/55yA34wSAMwA4A4AzADgDgDMAOAOAMwC4zjuCzi+uN9+fZgeNrvuefw+69FfL10H/fgycAHAGAGcAcAYAZwBwnbcCioZeq2+quIVS5NbBHycAnAHARffRsOksr71Ml38Bi/mk9XVH5EfDFGYAcHVbAWWjw08NbyePEaRmDADOAOAMAM4A4Fq9FjCd5cG1zaeHrPeleXnzsvl+MZ802vooe4fSatn9ftUILp/iYxlCm51UTgA4A4Dr9eXgsv3wtJdfhx71fXICwBkAXGUAv+cLCH0pHk4AOAOAMwA4A4AzALhedwRpXBVneSu9X04AOAOAMwA4A4AzADgDgDMAOAOAMwA4A4AzADgDgDMAOAOAMwA4A4AzALio3xG0bUcu3UZOADgDgDMAOAOAMwC4qLcCRjxG0M5wAsAZAJwBwBkAnAHAGQCcAcAZAJwBwBkAnAHA+Y4gOCcAnAHAGQCcAcAZAFyrrYDH++NGl7+6ZZ0yZpc4AeAMAC66HUFDnLwyZk4AOAOAKz+QfMXx58dScdz7se5o8A7t0HJzAtAZAJwBwBkAnAFIkiRJkiRJUtySJPkBweNXgRaWkYQAAAAASUVORK5CYII=)](https://github.com/topics/skribbl-typo)

This is the docker-setup for the VPS that is running all services needed for typo & palantir.

## Structure

### Core

The core configuration of portainer to manage containers, and traefik to handly traffic to containers via a reverse proxy.

### Apps

The configuration for all services.  
Services that depend on each other are provided in the same folder within a single docker-compose file.

---

## Needed Configuration

All critical information that is used for docker image builds or in docker-compose is stored in the .env file next to the docker-compose.
To customize settings further, the docker-compose files can be modified.  
Although, for a working environment, nothing more than the configuration below is needed.

Every stack that is accessible via a subdomain through traefik has at least a `SERVICE_DOMAIN_NAME` variable that corresponds to the domain that should be mapped to the service.  
Those variables are omitted in the descriptions below.

### Core

The core stack consists of Traefik as reverse proxy and Portainer as container manager.

**Location:** `core/.env`  
**Variables:**

- LETSENCRYPT_EMAIL - email used for letsencrypt certificates
- USER_CREDENTIALS - credentials for basic auth middleware generated with htpasswd:  
  `echo $(htpasswd -nb tobeh CanyonUltimateCFSL7)`  
  `$` signs have to be replaced with `$$` to escape them.

### Typo-Core

The typo core stacks contains the main typo services that interact with the database.  
Those are the frontend, api, database, a phpmyadmin instance, and the typo socket server.

**Location:** `apps/typo-core/.env`  
**Variables:**

- DB_ADMIN_USERNAME - admin account username; can login from everywhere
- DB_ADMIN_PASSWORD - admin account password
- MYSQL_ROOT_PASSWORD - password for the default root user account; can only login on localhost

## Needed Setup

Additional to the configs, some requriements have to be fulfilled.  
Those have been aimed to be as few as possible to ensure a fast & easy deployment.

### Docker

Docker & Docker-Compose is obviously needed.

### Traefik

For traefik, a proxy network in docker is required:
`sudo docker network create proxy`

Also, the acme file needs to have certain permissions:  
`sudo chmod 600 ./core/traefik-data/acme.json`

## Run

Clone the repo, ensure you have set everything up like in the above description, and summon all stacks with `docker-compose up -d` in the stack's root.
