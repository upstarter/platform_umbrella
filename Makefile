# Whenever you want to do a new build, you only need to repeat the steps to
# perform a production build as described in this subsection. You do not need to
# modify the Dockerfile.

deploy:
	$(MAKE) build && $(MAKE) create

container_id := $(shell docker create cw-proxy)
build:
	docker build -t cw-proxy .
	container_id=${container_id}
	docker cp ${container_id}:/app/start_release start_release
	docker rm ${container_id}
	gsutil cp start_release gs://${BUCKET_NAME}/cw-proxy-release
	docker tag cw-proxy gcr.io/eternal-sunset-206422/cw-proxy
	docker push gcr.io/eternal-sunset-206422/cw-proxy

# BACKEND
update:
	gcloud compute instances update-container cw-proxy-instance \
		--container-command='toolbox' \
		--zone us-central1-a

# --machine-type g1-small
# --service-account db-access@eternal-sunset-206422.iam.gserviceaccount.com \
# --metadata-from-file user-data=cloud-config
# --container-image=gcr.io/eternal-sunset-206422/cw-proxy \
# --container-stdin \
# --container-tty
create:
	gcloud compute instances create cw-proxy-instance \
		--image-family debian-9 \
		--image-project debian-cloud \
		--metadata-from-file startup-script=instance-bootstart.sh  \
		--machine-type f1-micro \
		--service-account db-access@eternal-sunset-206422.iam.gserviceaccount.com \
		--scopes "userinfo-email,cloud-platform,storage-ro" \
		--metadata release-url=gs://${BUCKET_NAME}/cw-proxy-release \
		--zone us-central1-f \
 	 	--tags proxy-server


# set_accounts:
# 	gcloud compute instances set-service-account cw-proxy-instance \
#    --service-account db-access@eternal-sunset-206422.iam.gserviceaccount.com \
#    --scopes compute-rw,storage-rw

# check progress of instance creation
instances:
	gcloud compute instances get-serial-port-output cw-proxy-instance \
	    --zone us-central1-f

firewall:
	gcloud compute firewall-rules create default-allow-http-8080 \
	    --allow tcp:8080 \
	    --source-ranges 0.0.0.0/0 \
	    --target-tags proxy-server \
	    --description "Allow port 8080 access to http-server"

list_instances:
	gcloud compute instances list

describe:
	gcloud compute instances describe cw-proxy-instance

# HANDY DANDIES:
# docker run -it gcr.io/eternal-sunset-206422/cw-proxy /bin/bash
# psql -h /tmp/cloudsql/eternal-sunset-206422:us-central1:umbrella-db -U postgres

# sudo google_metadata_script_runner --script-type startup --debug
#
# Container-Optimized OS uses the systemd-journald service.
# Docker logs are in /var/log/journal. Also can run on coreos:
# sudo journalctl -u google-startup-scripts.service
