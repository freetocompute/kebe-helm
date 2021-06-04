# Kebe Helm

Simple and shortest path to a Helm based deployment of Kebe related services. If you have
experience with Helm and Kubernetes, please help improve ASAP! :)

## Services Provided

Postgres
Minio
Pgadmin4
Kebe Store (kebe-store)

## TODOs

* Everything
* A lot of values need to be pulled out
* An easy way to add the additional services will need with either separate Postgres instances or
  databases added (kebe-login and kebe-dashboard).

## Requirements

This is currently used on a MicroK8s instance that has a local registry enabled. As such in
values.yaml the kebe-store is pulled from localhost:32000.