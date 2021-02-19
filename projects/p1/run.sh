#!/bin/bash

echo "Benchmarking C/C++, C++11, Haskell, Java, and Python"
echo "Running the Tests:"
echo "*** Please ensure that you do not have the ondemand governor enabled ***"
benchmarkFilePath="$HOME/exploringRPi/chp05/performance/"

Duration="5000000"

echo -e "\nThe C/C++ Code Example"
T="$(date +%s%N)"
${benchmarkFilePath}/n-body $Duration
T="$(($(date +%s%N)-T))"
T=$((T/1000000))
echo "It took ${T} milliseconds to run the C/C++ test"

# echo -e "\nThe C++11 Code Example"
# T="$(date +%s%N)"
# ${benchmarkFilePath}/n-body2 $Duration
# T="$(($(date +%s%N)-T))"
# T=$((T/1000000))
# echo "It took ${T} milliseconds to run the C++11 test"

# echo -e "\nThe Java Example"
# T="$(date +%s%N)"
# java -XX:+AggressiveOpts /home/pi/exploringRPi/chp05/performance/nbody.java $Duration
# T="$(($(date +%s%N)-T))"
# T=$((T/1000000))
# echo "It took ${T} milliseconds to run the Java test"

# echo -e "Executing the Haskell Code\n"
# T="$(date +%s%N)"
# ${benchmarkFilePath}/nbody.ghc_run $Duration
# T="$(($(date +%s%N)-T))"
# T=$((T/1000000))
# echo "It took ${T} milliseconds to run the Haskell test"

# echo -e "\nThe Python Code Example"
# T="$(date +%s%N)"
# python ${benchmarkFilePath}/n-body.py $Duration
# T="$(($(date +%s%N)-T))"
# T=$((T/1000000))
# echo "It took ${T} milliseconds to run the Python test"

echo "Finished Running the Benchmarks"
