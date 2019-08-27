# Whenever you want to do a new build, you only need to repeat the steps to
# perform a production build as described in this subsection. You do not need to
# modify the Dockerfile.

deploy:
	$(MAKE) build && $(MAKE) create

build:
	docker build -t cw-proxy-image .
	container_id=$(docker create cw-proxy-image)
	docker cp ${container_id}:/app/start_release start_release
	docker rm ${container_id}
	gsutil cp start_release gs://${BUCKET_NAME}/cw-proxy-release
	docker tag cw-proxy-image gcr.io/eternal-sunset-206422/cw-proxy-image
	docker push gcr.io/eternal-sunset-206422/cw-proxy-image


# BACKEND
create:
	gcloud compute instances create-with-container cw-proxy-instance \
		--container-image gcr.io/eternal-sunset-206422/cw-proxy-image \
		--machine-type f1-micro \
    # --machine-type g1-small \
		--scopes "userinfo-email,cloud-platform" \
		--metadata-from-file startup-script=instance-startup.sh \
		--metadata release-url=gs://${BUCKET_NAME}/cw-proxy-release \
		--zone us-central1-f \
 	 	--tags proxy-server \
		--container-stdin \
		--container-tty


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

# ON PRODUCTION:
# docker run -it gcr.io/eternal-sunset-206422/cw-proxy-image /bin/bash
