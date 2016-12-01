FROM patrickmcelwee/marklogic-dependencies:8-latest

# If you want vim for local debugging
# RUN yum -y install vim

# Install MarkLogic
WORKDIR /tmp
ADD MarkLogic-6.0-6.x86_64.rpm /tmp/MarkLogic.rpm

RUN yum -y install /tmp/MarkLogic.rpm

# Expose MarkLogic Server ports - plus 8040, 8041, 8042 for your REST, etc
# endpoints - feel free to add more
EXPOSE 7997 7998 7999 8000 8001 8002 8040 8041 8042

VOLUME /var/opt/MarkLogic
VOLUME /data

# Define default command (which avoids immediate shutdown)
CMD /opt/MarkLogic/bin/MarkLogic && tail -f /dev/null