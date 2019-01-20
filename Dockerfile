FROM arm32v7/openjdk:8-jre

EXPOSE 9790 9791

ENTRYPOINT [ "/mnt/docker-entrypoint.sh" ]
