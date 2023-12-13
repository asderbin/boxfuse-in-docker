FROM tomcat:9.0
WORKDIR /home
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/; mvn package
RUN cd target/
RUN cp hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
