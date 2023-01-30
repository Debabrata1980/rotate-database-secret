FROM alpine:3.13

RUN apk --no-cache add python3 py3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN pip3 install cfn-lint awscli

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]