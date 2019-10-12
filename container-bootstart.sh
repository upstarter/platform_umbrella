#!/bin/sh
set -ex
./start_release foreground
/usr/local/bin/envoy -c /etc/api-envoy.yaml --service-cluster api --component-log-level "upstream:debug"
