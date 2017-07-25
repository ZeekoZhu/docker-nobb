FROM node:6-alpine
ARG NODEBB_VERSION=v1.5.2

ENV NODE_ENV=production \
    daemon=false \
    silent=false

ENV NB_URL ""
ENV NB_PORT ""
ENV NB_SECRET ""
ENV NB_DATABASE ""
ENV NB_MONGO_HOST ""
ENV NB_MONGO_PORT ""
ENV NB_MONGO_USERNAME ""
ENV NB_MONGO_PASSWORD ""
ENV NB_MONGO_DATABASE ""
ENV NB_REDIS_HOST ""
ENV NB_REDIS_PORT ""
ENV NB_REDIS_PASSWORD ""
ENV NB_REDIS_DATABASE ""
ENV NB_ADMIN_USERNAME ""
ENV NB_ADMIN_EMAIL ""
ENV NB_ADMIN_PASSWORD ""

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk --update add openssl tar

WORKDIR /root
RUN wget https://github.com/NodeBB/NodeBB/archive/${NODEBB_VERSION}.tar.gz -O nodebb.tar.gz
RUN mkdir nodebb &&\
    tar xvzf nodebb.tar.gz -C nodebb --strip-components=1

WORKDIR /root/nodebb
RUN npm config set registry https://registry.npm.taobao.org
RUN yarn install --production
COPY setup.sh setup.sh

CMD ./setup.sh && ./nodebb slog
