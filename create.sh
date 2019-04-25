#!/bin/sh
docker run -v /data/workbench:/data -d --name workbench ghostry/workbench
docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' workbench
./use.sh