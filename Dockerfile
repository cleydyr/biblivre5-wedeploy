FROM cleydyr/tomcat:7-jdk8
RUN apt-get update
RUN apt-get install -y postgresql

ADD ./Biblivre4.war /usr/local/tomcat/webapps/Biblivre4.war

ADD ./sql/createdatabase.sql /tmp/sql/createdatabase.sql
ADD ./sql/biblivre4.sql /tmp/sql/biblivre4.sql

ENTRYPOINT echo "listen_addresses = '*'" >> /etc/postgresql/9.6/main/postgresql.conf \
&& 	echo "host    all             all              0.0.0.0/0                       md5" >> /etc/postgresql/9.6/main/pg_hba.conf \
&& 	/etc/init.d/postgresql start \
&&	su postgres -c "psql -U postgres -f /tmp/sql/createdatabase.sql" \
&&	su postgres -c "psql -U postgres -f /tmp/sql/biblivre4.sql -d biblivre4" \
&& catalina.sh run

VOLUME /var/lib/postgresql/9.6/main

EXPOSE 8080