FROM postgres:9.6

ENV POSTGRES_PASSWORD abracadabra
ENV POSTGRES_USER postgres

ADD ./pg_hba.conf /etc/postgresql/pg_hba.conf
ADD ./postgresql.conf /etc/postgresql/postgresql.conf
ADD ./create-database.sh /docker-entrypoint-initdb.d/create-database.sh
ADD ./sql/createdatabase.sql /docker-entrypoint-initdb.d/sql/createdatabase.sql
ADD ./sql/biblivre4.sql /docker-entrypoint-initdb.d/sql/biblivre4.sql
