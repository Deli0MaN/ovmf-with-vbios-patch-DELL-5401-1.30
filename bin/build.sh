#! /bin/bash

mkdir -p build
docker build -t ovmf-vbios-patch docker-build
docker run --rm -v "$PWD/build:/build" -v "$PWD/roms:/roms" ovmf-vbios-patch /ovmf/compile-ovmf.sh GeForce MX150 [GP108-A]-86.08.40.00.48.rom
tar -czf build/ovmf-vbios-patched.tgz build/OVMF*
