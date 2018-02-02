FROM hypriot/rpi-alpine-scratch

# GFW, first `make gosu`
COPY gosu /usr/local/bin/gosu

RUN apk update && apk add postgresql && \
    mkdir /docker-entrypoint-initdb.d && \
    chmod +x /usr/local/bin/gosu && \
    rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

# Set Env for entrypoint script
ENV POSTGRES_USER dbunit
ENV POSTGRES_PASSWORD dbunit
ENV POSTGRES_DB dbunit

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
