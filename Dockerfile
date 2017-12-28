FROM joeltobey/lucee:5.2-commandbox

# Create Lucee configs
COPY docker/lucee-server.xml /opt/lucee/server/lucee-server/context/lucee-server.xml
COPY docker/lucee-web.xml.cfm /opt/lucee/web/lucee-web.xml.cfm
COPY docker/log4j.properties /opt/lucee/web/log4j.properties

RUN cd /var/www && \
    box coldbox create app myapp && \
    box install testbox && \
    box install docbox && \
    box install cfboom-lang && \
    cd modules_app/ && \
    mkdir cfboom-http/

COPY docker/Coldbox.cfc /var/www/config/Coldbox.cfc
COPY docker/generateDocs.cfm /var/www/generateDocs.cfm
COPY . /var/www/modules_app/cfboom-http/
