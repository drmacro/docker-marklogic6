# Marklogic 6 Docker Container

This Dockerfile produces a working MarkLogic 6 container using 
the separately-downloaded ML6 for CentOS 6 installer (http://developer.marklogic.com/products/marklogic-server/6.0)

To build it, put the MarkLogic installer rpm file in the same directory as the Dockerfile and then do: 

```
docker build -t drmacro/ml6 .
```

Run the container like so:

```
docker run -d --name=marklogic6 -v/Users/ekimber/rsuite/rsuite36-data/ml:/data  -p 8902:8002 -p 8901:8001 -p 8900:8000 -p 8036:8036 drmacro/ml6
```

Where port 8036 is the port that will be assigned to some newly-created service. The other ports are the standard MarkLogic admin and query console ports.

The first time you start the container you'll need to request a developer license and go through the rest of the installation.

After that you should be able to do `docker commit` to save the installed state.

Note that the MarkLogic license does not allow the distribution of pre-installed versions so this image cannot be made publicly available.