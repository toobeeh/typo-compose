-- create users for interaction from typo services

CREATE USER 'ithil'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `ithil`@`81.217.223.62`;

CREATE USER 'orthanc'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `orthanc`@`81.217.223.62`;

CREATE USER 'palantir'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `palantir`@`81.217.223.62`;

CREATE USER 'tirith'@'81.217.223.62' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `tirith`@`81.217.223.62`;

CREATE USER 'tirith'@'localhost' IDENTIFIED BY '';
GRANT SELECT, INSERT, UPDATE, DELETE ON palantir.* TO `tirith`@`localhost`;

-- create an user for human db access from everywhere. 
-- the credentials come from the environment file in the root (via typo-core docker-compose -> mariadb dockerfile)
CREATE USER 'ADMIN_USER_PLACEHOLDER'@'%' IDENTIFIED BY 'ADMIN_PASSWORD_PLACEHOLDER';
GRANT ALL ON *.* TO `tirith`@`%`;