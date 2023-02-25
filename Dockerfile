# https://hub.docker.com/r/arm64v8/mongo/tags
FROM arm64v8/mongo:5.0

ADD mongo /bin/
ADD mongos /bin/
ADD mongod /bin/

# https://andyfelong.com/2021/08/mongodb-4-4-under-raspberry-pi-os-64-bit-raspbian64/#comment-355013
RUN sed -i 's/fphp|dcpop|sha3|sm3|sm4|asimddp|sha512|sve/fp|dcpop|sha3|sm3|sm4|asimddp|sha512|sve/g' /usr/local/bin/docker-entrypoint.sh

ADD libcrypto.so.1.1 /lib/aarch64-linux-gnu/
ADD libssl.so.1.1 /lib/aarch64-linux-gnu/
