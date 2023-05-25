FROM mariadb

# Copy the modified init.sql script
COPY init_users.sql /docker-entrypoint-initdb.d/

# Set environment variables for the username and password
ARG DB_ADMIN_USERNAME admin
ARG DB_ADMIN_PASSWORD password

# Modify the init.sql script to use environment variables
RUN sed -i "s/ADMIN_USER_PLACEHOLDER/$DB_ADMIN_USERNAME/g" /docker-entrypoint-initdb.d/init.sql
RUN sed -i "s/ADMIN_PASSWORD_PLACEHOLDER/$DB_ADMIN_PASSWORD/g" /docker-entrypoint-initdb.d/init.sql