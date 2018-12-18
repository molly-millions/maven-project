FROM tomcat:8.0

ADD ./webapp/target/*.war /usr/local/tomcat/webapps/

RUN apt-get update
RUN apt-get install -y haveged

EXPOSE 8080

CMD ["catalina.sh", "run"]
