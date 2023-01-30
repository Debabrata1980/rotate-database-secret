FROM alpine:3.13

RUN apk --no-cache add nodejs npm python3 py3-pip git
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN npm install -g aws-cdk
RUN apk add --no-cache aws-cli
RUN pip3 install aws-cdk.core

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]