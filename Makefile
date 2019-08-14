# Whenever you want to do a new build, you only need to repeat the steps to
# perform a production build as described in this subsection. You do not need to
# modify the Dockerfile.

# docker build -t cw-image .
# container_id=$(docker create cw-image) docker cp
# ${container_id}:/app/start_release start_release docker rm ${container_id}
# gsutil cp start_release gs://${BUCKET_NAME}/platform-umbrella-release

# BACKEND
create:
	gcloud compute instances create-with-container cw-proxy-instance \
		--container-image gcr.io/eternal-sunset-206422/cw-proxy-image \
		--image-family debian-9 \
		--image-project debian-cloud \
		--machine-type f1-micro \
		--scopes "userinfo-email,cloud-platform" \
		--metadata-from-file startup-script=instance-startup.sh \
		--metadata release-url=gs://${BUCKET_NAME}/cw-proxy-release-1 \
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
