#!/usr/bin/env bash
set -euo pipefail

cd ../../build && make
cd ../perf-results/chroma-loop-opt
../../build/bin/istool1
