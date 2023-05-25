# typo-compose

This is the docker-setup for the VPS that is - or will be, in near future - running all services needed for typo & palantir.

## Structure

### core

The core configuration of portainer to manage containers, and traefik to handly traffic to containers via a reverse proxy.

### apps

The configuration for all services.  
Services that depend on each other are provided in the same folder within a single docker-compose file.

---

## Configuration

All critical information that is used for docker image builds or in docker-compose is stored in the .env file next to the docker-compose.

### Database

**Location:** `apps/typo-core/.env`  
**Variables:**

- DB_ADMIN_USERNAME - admin account username
- DB_ADMIN_PASSWORD - admin account password
