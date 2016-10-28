#!/bin/sh

cd registry
docker-compose up -d
docker-compose logs -f --tail="200"