### Docker Setup for Appsmith > 1.8.5 and MongoDB  5.0.5 for Raspberry PI4/arm64

Starting with 1.8.5, Appsmith requires MongoDB 5.x - unfortunately, there is no official support for MongoDB 5 for the Pi4/arm64 platform.

There is however a community build of MongoDB 5 as documented [here](https://andyfelong.com/2021/08/mongodb-4-4-under-raspberry-pi-os-64-bit-raspbian64), this page also provides pre-built binaries.

This "project" here tries to establish a custom docker compose which should eventually use an external MongoDB as outlined by Appsmith [here](https://docs.appsmith.com/getting-started/setup/instance-configuration/custom-mongodb-redis#custom-mongodb).

Presently, this is work in progress and requires 2 custom images:

- mongodb: based on arm64v8/mongo:5.0 - including 
  - binaries from the article linked above
  - libcrypto.so.1.1 and libssl.so.1.1 as copied from the local system
- myappsmith: based on appsmith/appsmith-ce:latest - including
  - fixed mongo binary
  - disabled `appsmithctl check-replica-set` in the appsmith image entrypoint.sh (TBD [how to proceed](https://community.appsmith.com/t/appsmith-does-not-connect-to-external-mongodb-exited-with-code-132/2072/2?u=arminus)), also update patch entrypoint.sh from its [original location](https://github.com/appsmithorg/appsmith/blob/release/deploy/docker/entrypoint.sh)

Progress will be tracked on the issue tracker here.

### Test Environment

A Pi4 with 4GB RAM, Linux pi4 5.15.76-v8+ #1597 SMP PREEMPT Fri Nov 4 12:16:41 GMT 2022 aarch64 GNU/Linux

