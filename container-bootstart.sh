#!/bin/sh
set -ex
cloud_sql_proxy -projects=eternal-sunset-206422 -dir=/tmp/cloudsql &

# DB
# export DATABASE_URL=/tmp/cloudsql/eternal-sunset-206422:us-central1:umbrella-db
# export DB_CA_CERTFILE=server-ca.pem
# export DB_KEYFILE=client-key.pem
# export DB_CERTFILE=client-cert.pem
# export POSTGRES_USER=postgres
# export POSTGRES_PASSWORD=ZQLm3AsToWtXkyePALtGRhjs

# export PORT=8080
# export HOME=/app
# mkdir -p ${HOME}
# cd ${HOME}
# RELEASE_URL=$(curl \
#     -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/release-url" \
#     -H "Metadata-Flavor: Google")
# gsutil cp ${RELEASE_URL} cw-proxy-release
# chmod 755 cw-proxy-release
# wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 \
#     -O cloud_sql_proxy
# chmod +x cloud_sql_proxy
# mkdir /tmp/cloudsql
# PROJECT_ID=$(curl \
#     -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" \
#     -H "Metadata-Flavor: Google")
# ./cloud_sql_proxy -projects=${PROJECT_ID} -dir=/tmp/cloudsql &
