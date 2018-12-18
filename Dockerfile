FROM tomcat:8.0

ADD ./webapp/target/*.war /usr/local/tomcat/webapps/

COPY catalina.sh /usr/local/tomcat/bin/catalina.sh
RUN chmod 755 /usr/local/tomcat/bin/catalina.sh

EXPOSE 8080

CMD ["catalina.sh", "run"]
