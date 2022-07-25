FROM alpine:3.15

ENV REPO_URL='mirrors.tuna.tsinghua.edu.cn'

COPY docker-entrypoint.sh /

RUN set -eux; \
        sed -r -e "s@(^.*//).*org(.*$)@\1${REPO_URL}\2@g" -i /etc/apk/repositories; \
        apk update --no-cache; \
        apk add --no-cache curl; \
        chmod a+x /docker-entrypoint.sh;

ENTRYPOINT ["/docker-entrypoint.sh"]
