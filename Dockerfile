FROM apache2-cosign:2.4.29

#EXPOSE 80
EXPOSE 443

#RUN rm /usr/local/apache2/htdocs/index.html

### Start script incorporates config files and sends logs to stdout ###
COPY start.sh .
RUN chmod +x start.sh

### Copy individual outage pages to the root directory in apache.
COPY static/ /usr/local/apache2/htdocs/

CMD /usr/local/apache2/start.sh
