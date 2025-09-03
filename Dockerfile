FROM alpine:3.19.1

RUN	apk update && \
	apk add --no-cache tzdata ca-certificates supervisor curl wget openssl bash python3 py3-requests sed unzip xvfb x11vnc websockify openbox chromium nss alsa-lib font-noto font-noto-cjk nodejs npm openjdk17 && \
	npm install -g serve && \
# noVNC SSL certificate
	openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 -subj "/C=IN/O=Dis/CN=www.google.com" -keyout /etc/ssl/novnc.key -out /etc/ssl/novnc.cert > /dev/null 2>&1 && \
# Wipe Temp Files
	apk del build-base curl wget unzip tzdata openssl && \
	rm -rf /var/cache/apk/* /tmp/*

RUN apk add --no-cache openjdk17

ENV	PORT=8080 \
	CHROME_URL=localhost:3000 \
	JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

COPY assets/ /

ENTRYPOINT ["supervisord", "-l", "/var/log/supervisord.log", "-c"]

CMD ["/config/supervisord.conf"]
