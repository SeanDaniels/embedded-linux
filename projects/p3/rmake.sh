#!/usr/bin/env bash
rm -rf ./build
cmake -Bbuild -H.
cd build && make
