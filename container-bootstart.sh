#!/bin/sh
set -ex
./start_release start
./cloud_sql_proxy -projects=eternal-sunset-206422 -dir=/tmp/cloudsql &
/usr/local/bin/envoy -c /etc/api-envoy.yaml --service-cluster api --component-log-level "upstream:debug,connection:trace"
