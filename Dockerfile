FROM mariadb

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        git \
    && git clone https://github.com/apache/guacamole-client.git \
    && cp guacamole-client/extensions/guacamole-auth-jdbc/modules/guacamole-auth-jdbc-mysql/schema/*.sql /docker-entrypoint-initdb.d \
    && rm -r guacamole-client \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove git
