FROM tomcat:8.5.47-jdk8-openjdk
WORKDIR /usr/local/tomcat/webapps
RUN useradd tomact_user
RUN chown -R tomact_user:tomact_user /usr/local/tomcat/webapps/*
USER tomact_user
COPY ./target/dptweb-1.0.war .
CMD ["java","-jar","dptweb-1.0.war"]