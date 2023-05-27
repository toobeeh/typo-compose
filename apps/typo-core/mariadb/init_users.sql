-- create users for interaction from typo services

CREATE USER 'ithil'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `ithil`@`81.217.223.62`;

CREATE USER 'orthanc'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `orthanc`@`81.217.223.62`;

CREATE USER 'palantir'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `palantir`@`81.217.223.62`;

CREATE USER 'tirith'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `tirith`@`81.217.223.62`;

CREATE USER 'tirith'@'172.20.0.%' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `tirith`@`localhost`;

-- create an user for human db access from everywhere. 
-- the credentials come from the environment file in the root (via typo-core docker-compose -> mariadb dockerfile)
CREATE USER 'ADMIN_USER_PLACEHOLDER'@'%' IDENTIFIED BY 'ADMIN_PASSWORD_PLACEHOLDER';
GRANT ALL PRIVILEGES ON *.* TO 'ADMIN_USER_PLACEHOLDER'@`%`;

-- limit remote access
UPDATE user SET Host='172.20.0.%' WHERE User='root';
FLUSH PRIVILEGES;