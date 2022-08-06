FROM registry.access.redhat.com/ubi8/openjdk-11:latest

ENV APP_FILE java-sample-k8s.jar
ENV APP_HOME /apps

COPY code/java-sample-k8s/target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]
