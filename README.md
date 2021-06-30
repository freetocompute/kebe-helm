# Kebe Helm

Simple and shortest path to a Helm based deployment of Kebe related services. If you have
experience with Helm and Kubernetes, please help improve ASAP! :)

# WARNING

This is not intended to be a production deployment. Change passwords and use
on a secure network for development purposes only.

# Quickstart

For this quickstart we will assume:

1. You have a Kubernetes cluster
2. You have Helm3 installed and is configured to work with your Kubernetes cluster
3. Clone kebe repo (https://github.com/freetocompute/kebe)
4. Build an image for the cluster and push it there

```
cd kebe
docker build -f build-aux/docker/Dockerfile.store -t <cluster>:32000/kebe-store:latest .
docker push <cluster>:32000/kebe-store:latest
```

5. Run `helm install <name-of-your-deployment> .`
6. Verify Minio is running at <server_ip_or_fdqn>:30900
7. Verify PgAdmin4 is running at <server_ip_or_fdqn>:31080
8. Login to PgAdmin4 add postgres-store as server and check database connection

## Services Provided

Postgres
Minio
Pgadmin4
Kebe Store (kebe-store)

## TODOs

* Everything
* A lot of values need to be pulled out
* An easy way to add the additional services will need with either separate
  Postgres instances or databases added (kebe-login and kebe-dashboard).

## Requirements

### MicroK8s

#### Addons

* dns
* ha-cluster
* registry
* storage


# Troubleshooting

## Store unable to find database

This can happen when the DNS addon is not enabled before installing the chart.
Enable the DNS addon, uninstall the chart and reinstall it.

## Server gave HTTP response to HTTPS client

When trying to push images to the registry the local Docker daemon refuses to
use an insecure registry. Add it to the insecure-registries array in the
Docker daemon.json file. It's either in /etc/docker/daemon.json or if you are
using a Snap version it might be in /var/snap/docker/current/config/daemon.json

If it doesn't exist, create it. It might look like this:

```
{
  "insecure_registries": [ "<registry_ip1>:32000", "<registry_ip2>:32000" ]
}
```

Modify as necessary, restart docker: `sudo systemctl restart docker` or
`sudo snap restart docker`
