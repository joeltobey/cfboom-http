FROM joeltobey/lucee:5.3

ARG RUN_TESTS=true
ARG TEST_RUNNER_URL=http://localhost:8888/modules/cfboom/modules/cfboom-http/tests/runner.cfm?&directory=tests.specs&recurse=true&reporter=json&verbose=true

# Copy file system
COPY docker/build/ $BUILD_DIR/
RUN ls -la $BUILD_DIR
RUN chmod +x $BUILD_DIR/*.sh

RUN cd /var/www && \
    box coldbox create app myapp && \
    box install testbox && \
    box install docbox && \
    box install cfboom && \
    cd modules/cfboom && \
    mkdir modules/ && \
    cd modules && \
    mkdir cfboom-util/

COPY docker/Coldbox.cfc /var/www/config/Coldbox.cfc
COPY docker/generateDocs.cfm /var/www/generateDocs.cfm
COPY docker/Application.cfc /var/www/Application.cfc
COPY . /var/www/modules/cfboom/modules/cfboom-http/

# Run unit/integration tests
RUN $BUILD_DIR/test.sh
