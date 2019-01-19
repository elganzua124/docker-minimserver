FROM arm32v7/openjdk:8-jre

ARG URL

ARG FFMPEG_URL

RUN wget -O /opt/MinimServer.tar.gz ${URL} && \
                cd /opt && \
                tar xf MinimServer.tar.gz && \
                rm MinimServer.tar.gz && \
                cd minimserver/opt/bin && \
                mkdir tmp && \
                wget -O tmp/ffmpeg.tar.xz ${FFMPEG_URL} && \
                tar xf tmp/ffmpeg.tar.xz --strip 1 -C tmp && \
                mv tmp/ffmpeg . && \
                rm -rf tmp

COPY ./minimserver.config /opt/minimserver/data/minimserver.config

EXPOSE 9790 9791

ENTRYPOINT [ "/opt/minimserver/bin/startc" ]
