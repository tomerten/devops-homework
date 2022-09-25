FROM nginx:1.16

ARG user=app

# install curl as requested
RUN apt-get update && apt-get install -y curl && apt-get clean 

# create user to run as instead of root
# and set permissions for nginx to work
RUN useradd -u 5000 $user \
  && mkdir -p /var/run/nginx /var/tmp/nginx /opt/html \
  && chown -R app:app /opt/html /var/run/nginx /var/tmp/nginx


WORKDIR /opt/html

# copy files and nginx configs
COPY . .
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d/default.conf /etc/nginx/conf.d/

USER app:app


