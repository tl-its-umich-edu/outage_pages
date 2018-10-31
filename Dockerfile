FROM umich-httpd-auth:2.4

MAINTAINER Teaching and Learning <its.tl.dev@umich.edu>

WORKDIR /usr/local/apache2

### Copy individual outage pages to the root directory in apache.
COPY static/ /usr/local/apache2/htdocs/

# start.sh inherited from umich-httpd-auth
CMD /usr/local/bin/start.sh
