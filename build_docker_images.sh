#!/bin/sh

echo "Building custom mongo5 image..."

cd mongodb

# https://andyfelong.com/2021/08/mongodb-4-4-under-raspberry-pi-os-64-bit-raspbian64/
if [ ! -r raspbian_mongodb_5.0.5.gz ]; then
  wget https://andyfelong.com/downloads/raspbian_mongodb_5.0.5.gz
fi

if [ ! -r ./mongo -o ! -r ./mongod -o ! -r ./mongos ]; then
  tar xzf raspbian_mongodb_5.0.5.gz
fi

EXTRA_LIBS="/lib/aarch64-linux-gnu/libcrypto.so.1.1 /lib/aarch64-linux-gnu/libssl.so.1.1"
for LIB in $EXTRA_LIBS; do
  if [ ! -r $LIB ]; then
    echo "$LIB not found!"
    exit  
  fi
  cp $LIB .
done

docker build . -t mongo:5.0.5

echo "Building custom appsmith image..."

cd ../appsmith

cp ../mongodb/mongo .
chmod a+x ./mongo

docker build . -t myappsmith
